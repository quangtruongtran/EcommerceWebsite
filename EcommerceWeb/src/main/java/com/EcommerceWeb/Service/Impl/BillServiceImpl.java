package com.EcommerceWeb.Service.Impl;

import com.EcommerceWeb.Converter.BillConverter;
import com.EcommerceWeb.DTO.BillDTO;
import com.EcommerceWeb.Entity.*;
import com.EcommerceWeb.Repository.BillDetailRepository;
import com.EcommerceWeb.Repository.BillRepository;
import com.EcommerceWeb.Repository.CartRepository;
import com.EcommerceWeb.Repository.ProductRepository;
import com.EcommerceWeb.Service.BillService;
import com.EcommerceWeb.Utils.RandomUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class BillServiceImpl implements BillService {

    @Autowired
    private BillDetailRepository billDetailRepository;

    @Autowired
    private BillRepository billRepository;

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private ProductRepository productRepository;

    @Override
    public BillEntity save(BillDTO billDTO, UserEntity user) {
        CartEntity cart = user.getCart();
        List<CartItemEntity> cartItems = cart.getCartItems();
        BillEntity bill = new BillEntity();
        for (CartItemEntity cartItem: cartItems) {
            BillDetailEntity billDetail = new BillDetailEntity();
            billDetail.setBillDetailQuantity(cartItem.getCartQuantity());
            billDetail.setBillDetailProductPrice(cartItem.getProduct().getProductPrice());
            billDetail.setBillDetailTotalPrice(cartItem.getCartTotalPrice());
            billDetail.setBill(bill);
            billDetail.setProduct(cartItem.getProduct());
            bill.getBillDetails().add(billDetail);
            ProductEntity product = productRepository.findById(cartItem.getProduct().getId()).get();
            product.setProductQuantity(product.getProductQuantity() - cartItem.getCartQuantity());
            productRepository.save(product);
            billDetailRepository.save(billDetail);
        }
        bill.setBillAddress(billDTO.getBillAddress());
        String billCode = "";
        while (true){
            billCode = RandomUtil.randomUtil();
            if(billRepository.findByBillCode(billCode) == null){
                break;
            }
        }
        bill.setBillCode(billCode);
        bill.setBillOrderDate(new Date());
        bill.setBillTotalPrice(cart.getCartTotalPrice());
        bill.setBillPhone(billDTO.getBillPhone());
        bill.setBillOrderStatus(false);
        bill.setUser(user);
        cartRepository.delete(cart);
        return billRepository.save(bill);
    }

    @Override
    public List<BillDTO> findAll() {
        List<BillDTO> result = new ArrayList<>();
        for (BillEntity bill : billRepository.findAll()) {
            result.add(BillConverter.EntitytoDTO(bill));
        }
        return result;
    }

    @Override
    public BillEntity findById(Long id) {
        return billRepository.findById(id).get();
    }

    @Override
    public BillEntity completeBill(BillDTO billDTO) {
        BillEntity bill = billRepository.findById(billDTO.getId()).get();
        bill.setBillDeliveryDate(billDTO.getBillDeliveryDate());
        bill.setBillOrderStatus(true);
        return billRepository.save(bill);
    }

    @Override
    public BillDTO searchBill(String billCode) {
        BillEntity bill = billRepository.findByBillCode(billCode);
        if(bill == null){
            return null;
        } else {
            return BillConverter.EntitytoDTO(bill);
        }
    }
}
