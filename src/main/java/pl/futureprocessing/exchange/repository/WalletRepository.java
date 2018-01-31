package pl.futureprocessing.exchange.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.futureprocessing.exchange.entity.Wallet;

public interface WalletRepository extends JpaRepository<Wallet, Long> {
}
