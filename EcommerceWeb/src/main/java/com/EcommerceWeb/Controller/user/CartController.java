package com.EcommerceWeb.Controller.user;

import com.EcommerceWeb.DTO.CategoryDTO;
import com.EcommerceWeb.Entity.CartEntity;
import com.EcommerceWeb.Entity.UserEntity;
import com.EcommerceWeb.Repository.CartItemRepository;
import com.EcommerceWeb.Repository.CartRepository;
import com.EcommerceWeb.Repository.UserRepository;
import com.EcommerceWeb.Security.MyUserDetails;
import com.EcommerceWeb.Service.*;
import com.EcommerceWeb.Service.Impl.CartServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private UserService userService;

    @Autowired
    private CartService cartService;

    @Autowired
    private CartItemService cartItemService;

    @Autowired
    private ProductService productService;

    @Autowired
    private HttpSession httpSession;

    @Autowired
    private CategoryService categoryService;

    @PostMapping
    @ResponseBody
    public Integer addToCart(@RequestBody Long id) {
         String userName = SecurityContextHolder.getContext().getAuthentication().getName();
         UserEntity user = userService.findByUserName(userName);
         if(productService.findById(id).getProductQuantity()<1){
             return 0;
         } else {
             Integer quantity = cartService.addToCart(1, id, user);
             httpSession.setAttribute("cartQuantity", quantity);
             return quantity;
         }
    }

    @GetMapping
    public String cartView(Model model){
        String userName = SecurityContextHolder.getContext().getAuthentication().getName();
        UserEntity user = userService.findByUserName(userName);
        CartEntity cart = user.getCart();
        List<CategoryDTO> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        if(cart == null){
            model.addAttribute("noCart","Bạn không có sản phẩm nào trong giỏ hàng!");
        }
        else {
            model.addAttribute("cartItems", cart.getCartItems());
            model.addAttribute("subTotal", cart.getCartTotalPrice());
        }
        return "user/cart";
    }

    @PostMapping("/update")
    public String updateCart(@RequestParam("quantity") Integer quantity, @RequestParam("productId") Long id
    , RedirectAttributes attributes){
        String userName = SecurityContextHolder.getContext().getAuthentication().getName();
        UserEntity user = userService.findByUserName(userName);
        Integer tolalItems  = cartService.updateCart(quantity, id, user);
        if(tolalItems == null){
            attributes.addFlashAttribute("mess", "Xin lỗi vì sự bất tiện! Hiện số lượng sản phẩm không đủ!");
        } else {
            httpSession.setAttribute("cartQuantity", tolalItems);
        }
        return "redirect:/cart";
    }

    @DeleteMapping("/delete")
    @ResponseBody
    public Integer deleteItemInCart(@RequestBody Long id){
        String userName = SecurityContextHolder.getContext().getAuthentication().getName();
        UserEntity user = userService.findByUserName(userName);
        cartService.deleteItemInCart(id, user);
        Integer quantity = CartServiceImpl.getTotalCartItems(userService.findByUserName(userName).getCart().getCartItems());
        httpSession.setAttribute("cartQuantity", quantity);
        return quantity;
    }
}
