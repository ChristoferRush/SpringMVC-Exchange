package pl.futureprocessing.exchange.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.futureprocessing.exchange.entity.User;
import pl.futureprocessing.exchange.entity.Wallet;
import pl.futureprocessing.exchange.repository.UserRepository;
import pl.futureprocessing.exchange.repository.WalletRepository;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private WalletRepository walletRepository;

    /*
     * register form
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerUser(Model model){
        User user = new User();
        model.addAttribute("user", user);
        return "register";
    }

    /*
     * creates new user with data from form and saves it to db
     * creates new empty wallet for newly created user
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String saveUser(Model model,
                           @ModelAttribute User user){
        List<User> listOfUsersInDb  = userRepository.findAll();
        for (User currentUser : listOfUsersInDb){
            if (currentUser.getUsername().equals(user.getUsername())){
                return "usernameDuplicate";
            }
        }
        User newUser = user;
        Wallet wallet = new Wallet(user);
        newUser.setWallet(wallet);
        userRepository.save(newUser);
        walletRepository.save(wallet);
        return "redirect:/homepage";
    }
}
