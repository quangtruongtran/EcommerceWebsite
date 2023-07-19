package com.EcommerceWeb.Controller.admin;

import com.EcommerceWeb.Service.StatisticService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class StatisticController {

    @Autowired
    private StatisticService statisticService;

    @GetMapping
    public String statisticView(Model model){
        model.addAttribute("statistic", statisticService.getStatistic());
        return "admin/statistic";
    }
}
