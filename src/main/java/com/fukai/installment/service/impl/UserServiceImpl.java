package com.fukai.installment.service.impl;

import com.fukai.installment.bean.InstallmentEntity;
import com.fukai.installment.bean.InstallmentInfoEntity;
import com.fukai.installment.bean.User;
import com.fukai.installment.dao.InstallmentInfoRepository;
import com.fukai.installment.dao.InstallmentRepository;
import com.fukai.installment.dao.UserRepository;
import com.fukai.installment.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Author: niul
 * @Date: 2019-02-21 22:52
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private InstallmentRepository installmentRepository;
    @Autowired
    private InstallmentInfoRepository installmentInfoRepository;

    @Override
    @Transactional(propagation = Propagation.NOT_SUPPORTED,readOnly = true)
    // 添加用户
    public Map<String,Object> save(User user, InstallmentEntity installmentEntity) throws Exception{
            Map<String,Object> result = new HashMap<String,Object>();
            user.setUserType("0");
            userRepository.save(user);// 保存用户信息
            installmentEntity.setUserId(user.getId());
            installmentRepository.save(installmentEntity);// 保存贷款信息主表数据

            //从贷款主表中获取本金、利率、贷款期数等数据经过计算生成贷款明细数据
            double installmentAmount = installmentEntity.getInstallmentAmount();//本金
            double interestRate = installmentEntity.getInterestRate();//利率
            int repayNumber = installmentEntity.getRepayNumber();//还款总期数
            Date repayDate = installmentEntity.getRepayDate();//首次还款日期
            if (repayNumber==0) repayNumber = 36;
            BigDecimal amount;
            BigDecimal rate;
            //计算每期还款额
            if (installmentAmount==0){
                throw new Exception("贷款本金为0创建用户失败！");
            }else{
                amount = new BigDecimal(Double.toString(installmentAmount));
            }
            if (interestRate==0){
                throw new Exception("执行利率为0创建用户失败！");
            }else{
                rate = new BigDecimal(Double.toString(interestRate));
            }
            BigDecimal amountAll = amount.multiply(rate);//总金额
            double averageAmount = amountAll.divide(rate, 2, BigDecimal.ROUND_HALF_UP).doubleValue();

            //定义日期实例
        Calendar data = Calendar.getInstance();
        data.setTime(repayDate);//设置日期起始时间
        for (int i = 0; i < repayNumber; i++) {
                InstallmentInfoEntity installmentInfoEntity = new InstallmentInfoEntity();
                String id = UUID.randomUUID().toString();
                installmentInfoEntity.setId(id);
                installmentInfoEntity.setInstallId(installmentEntity.getId());
                installmentInfoEntity.setRepayState("1");//默认已还款
                installmentInfoEntity.setRepayDate(i+1);
                installmentInfoEntity.setRepayAmount(averageAmount);
                if (i==0){
                    installmentInfoEntity.setRepayTime(repayDate);
                }else{
                    data.add(Calendar.MONTH,1);//日期递增
                    installmentInfoEntity.setRepayTime(data.getTime());
                }
                installmentInfoRepository.save(installmentInfoEntity);
            }

        result.put("retCode","200");
        result.put("retMsg", "添加用户信息成功！");
        return result;
    }

    @Override
    //删除用户
    public void deleteUser(User user) {
        userRepository.delete(user.getId());
    }

    @Override
    //查询用户列表
    public List<User> selectUserList(int page,int size) {

        //查询数据库中user总数
        long count = userRepository.count();
//        PageRequest request = PageRequest.of(page, size);
        PageRequest request = new PageRequest(page,size);
        Page<User> userPage = userRepository.findAll(request);
        List<User> users = userPage.getContent();
        for (User user:users) {
            InstallmentEntity installmentEntity = installmentRepository.findByUserId(user.getId());
            if(installmentEntity == null){
                installmentEntity = new InstallmentEntity();
            }
            user.setInstallmentEntity(installmentEntity);
            user.setCount(count);
        }
        return users;

    }

    @Override
    // 查询贷款明细数据
    public List<InstallmentInfoEntity> selectInstallmentInfoList(String installId) {
        Sort sort = new Sort(Sort.Direction.DESC,"repayTime");
        List<InstallmentInfoEntity> infoEntities = installmentInfoRepository.findAll(sort);
        ArrayList<InstallmentInfoEntity> resultList = new ArrayList<InstallmentInfoEntity>();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        for (InstallmentInfoEntity info:infoEntities
             ) {
            Date date = new Date();
            boolean flag = date.after(info.getRepayTime());
            if (flag==true){
                info.setRepayTime1(format.format(info.getRepayTime()));
                resultList.add(info);
            }
        }
        return resultList;
    }

    @Override
    public User findByMobilePhoneAndPassword(String mobilePhone, String password) {
        return userRepository.findByMobilePhoneAndPassword(mobilePhone,password);
    }

    /**
     * 修改还款状态
     * @param installmentInfoId
     * @param state
     * @return
     * @throws Exception
     */
    @Override
    @Transactional(propagation = Propagation.NOT_SUPPORTED,readOnly = true)
    public Map<String, Object> editRepayState(String installmentInfoId, String state) throws Exception{
        Map<String,Object> result = new HashMap<String,Object>();
        InstallmentInfoEntity infoEntity = installmentInfoRepository.findOne(installmentInfoId);
//        InstallmentInfoEntity infoEntity = info.get();
        infoEntity.setRepayState(state);
        installmentInfoRepository.save(infoEntity);
        result.put("retCode","200");
        result.put("retMsg", "修改还款状态成功！");
        return result;
    }

    /**
     * 根据登录人id查询贷款明细信息 app前台使用
     * @param userId
     * @return
     */
    @Override
    public InstallmentEntity selectInstallmentListByUserId(String userId) {
        InstallmentEntity installmentEntity = installmentRepository.findByUserId(userId);
        return installmentEntity;
    }

    /**
     * 查询用户信息 app调用
     * @param id
     * @return
     */
    @Override
    public User queryUser(String id) {
        return userRepository.findOne(id);
    }


}
