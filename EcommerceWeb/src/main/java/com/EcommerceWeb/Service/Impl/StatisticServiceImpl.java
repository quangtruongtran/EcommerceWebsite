package com.EcommerceWeb.Service.Impl;

import com.EcommerceWeb.DTO.StatisticDTO;
import com.EcommerceWeb.Entity.BillEntity;
import com.EcommerceWeb.Repository.BillDetailRepository;
import com.EcommerceWeb.Repository.BillRepository;
import com.EcommerceWeb.Repository.ProductRepository;
import com.EcommerceWeb.Repository.UserRepository;
import com.EcommerceWeb.Service.StatisticService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class StatisticServiceImpl implements StatisticService {


    @Autowired
    private BillRepository billRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public StatisticDTO getStatistic() {
        StatisticDTO statistic = new StatisticDTO();
        List<BillEntity> bills = billRepository.getAllBillInMonth();
        statistic.setSales(bills.size());
        BigDecimal sum = new BigDecimal(0);
        for (BillEntity bill: bills) {
            sum = sum.add(bill.getBillTotalPrice());
        }
        statistic.setRevenue(sum);
        statistic.setNumberOfProducts((int)productRepository.count());
        statistic.setNumberOfUsers((int) userRepository.count());
        return statistic;
    }
}
