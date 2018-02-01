package pl.futureprocessing.exchange.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "wallets")
public class Wallet {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(cascade = CascadeType.ALL)
    private User user;

    @OneToMany
    private List<WalletCurrency> walletCurrencyList = new ArrayList<WalletCurrency>();

    public Wallet(){}

    public Wallet(User user){
        setUser(user);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<WalletCurrency> getWalletCurrencyList() {
        return walletCurrencyList;
    }

    public void setWalletCurrencyList(List<WalletCurrency> walletCurrencyList) {
        this.walletCurrencyList = walletCurrencyList;
    }
}
