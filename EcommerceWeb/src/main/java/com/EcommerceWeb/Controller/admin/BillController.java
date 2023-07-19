package com.EcommerceWeb.Controller.admin;

import com.EcommerceWeb.DTO.BillDTO;
import com.EcommerceWeb.Entity.BillEntity;
import com.EcommerceWeb.Service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class BillController {

    @Autowired
    private BillService billService;

    @GetMapping("/bill")
    public String billView(Model model){
        List<BillDTO> bills = billService.findAll();
        model.addAttribute("size", bills.size());
        model.addAttribute("bills", bills);
        return "admin/bill/bill";
    }

    @GetMapping("/bill/{id}")
    public String getBillDetail(Model model, @PathVariable("id") Long id){
        BillEntity bill = billService.findById(id);
        model.addAttribute("bill", bill);
        return "admin/bill/bill_detail";
    }

    @PostMapping("/complete_bill")
    public String completeBill(BillDTO billDTO){
        billService.completeBill(billDTO);
        return "redirect:/admin/bill";
    }

    @PostMapping("/bill/search")
    public String searchProduct(@RequestParam(value = "billCode", required = true) String billCode,
                                Model model){
        BillDTO bill =  billService.searchBill(billCode);
        List<BillDTO> result = new ArrayList<>();
        result.add(bill);
        if(bill == null){
            model.addAttribute("size", 0);
            return "admin/bill/bill";
        }
        model.addAttribute("size", 1);
        model.addAttribute("bills", result);
        return "admin/bill/bill";
    }
}
