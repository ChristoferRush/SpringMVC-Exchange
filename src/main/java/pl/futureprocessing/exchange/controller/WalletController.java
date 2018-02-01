package pl.futureprocessing.exchange.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.futureprocessing.exchange.entity.User;
import pl.futureprocessing.exchange.entity.Wallet;
import pl.futureprocessing.exchange.entity.WalletCurrency;
import pl.futureprocessing.exchange.repository.UserRepository;
import pl.futureprocessing.exchange.repository.WalletRepository;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class WalletController {

    @Autowired
    private WalletRepository walletRepository;

    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/wallet")
    public String viewWallet(HttpSession session,
                             Model model){
        User currentlyLoggedUser = (User) session.getAttribute("user");
        if (currentlyLoggedUser == null){
            return "redirect:/login";
        }
        String username = currentlyLoggedUser.getUsername();
        model.addAttribute("username", username);

        Wallet userWallet = currentlyLoggedUser.getWallet();
        model.addAttribute("userWallet", userWallet);
        Wallet officeWallet = walletRepository.findOne(userRepository.findOne(1L).getWallet().getId());
        model.addAttribute(officeWallet);

        List<WalletCurrency> walletCurrencies = userWallet.getWalletCurrencyList();
        model.addAttribute("walletCurrencies", walletCurrencies);

        return "wallet";
    }
}
