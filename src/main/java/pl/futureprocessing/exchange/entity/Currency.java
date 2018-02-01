package pl.futureprocessing.exchange.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "currencies")
public class Currency {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    private String code;

    @OneToMany
    private List<WalletCurrency> walletCurrencyList;

    public Currency(){}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public List<WalletCurrency> getWalletCurrencyList() {
        return walletCurrencyList;
    }

    public void setWalletCurrencyList(List<WalletCurrency> walletCurrencyList) {
        this.walletCurrencyList = walletCurrencyList;
    }
}
