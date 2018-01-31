package pl.futureprocessing.exchange.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.futureprocessing.exchange.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
}
