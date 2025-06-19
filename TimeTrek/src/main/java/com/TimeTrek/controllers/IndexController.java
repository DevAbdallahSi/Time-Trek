package com.TimeTrek.controllers;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
 
import com.TimeTrek.models.LoginUser;
import com.TimeTrek.models.User;
import com.TimeTrek.services.UserService;
 
 
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
 
@Controller
public class IndexController {
     @Autowired
     private UserService userServ;
//     @Autowired
//     private Services talkServices;

     @GetMapping("/join")
     public String index(Model model) {
         model.addAttribute("newUser", new User());
         model.addAttribute("newLogin", new LoginUser());
         model.addAttribute("showSignUp", false); // ✅ default to sign-in
         return "index";
     }
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser,
                           BindingResult result, Model model, HttpSession session) {
        User registeredUser = userServ.register(newUser, result);
 
        if (result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            model.addAttribute("showSignUp", true); // ✅ Stay on sign-up panel
            return "index";
        }
 
        session.setAttribute("loggedInUser", registeredUser);
        return "redirect:/";
    }
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,
                        BindingResult result, Model model, HttpSession session) {
        User user = userServ.login(newLogin, result);
 
        if (result.hasErrors()) {
            model.addAttribute("newUser", new User());
            model.addAttribute("showSignUp", false); // ✅ Stay on login panel
            return "index";
        }
 
        session.setAttribute("loggedInUser", user);
        return "redirect:/";
    }
    


    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Destroys the entire session
        return "redirect:/";  // Redirect to login/registration page
    }
}