package pl.futureprocessing.exchange.controller;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.futureprocessing.exchange.entity.Login;
import pl.futureprocessing.exchange.entity.User;
import pl.futureprocessing.exchange.entity.Wallet;
import pl.futureprocessing.exchange.repository.UserRepository;
import pl.futureprocessing.exchange.repository.WalletRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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
        List<User> listOfUsers = userRepository.findAll();
        List<String> listOfUsernames = new ArrayList<String>();
        for (User userToGetName : listOfUsers){
            listOfUsernames.add(userToGetName.getUsername());
        }
        String json = new Gson().toJson(listOfUsernames);
        model.addAttribute("usernames", json);
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

    /*
     * login form
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model){
        Login login = new Login();
        model.addAttribute("login", login);
        return "login";
    }

    /*
     * logged in and added to session
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loggedIn(HttpSession session,
                           HttpServletRequest request,
                           Model model,
                           @ModelAttribute Login log){
        Login login = log;
        List<User> userList = userRepository.findAll();
        List<String> usernames = new ArrayList<String>();
        for (User user : userList){
            if (login.getUsername().equals(user.getUsername()) && login.getPassword().equals(user.getPassword())){
                session.setAttribute("user", user);
                return "wallet";
            }
        }
        String error = "Wrong username or password";
        request.setAttribute("error", error);
        return "redirect:/login";
    }
}
