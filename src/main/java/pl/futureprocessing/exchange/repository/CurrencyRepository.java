package pl.futureprocessing.exchange.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.futureprocessing.exchange.entity.Currency;

public interface CurrencyRepository extends JpaRepository<Currency, Long> {
}
