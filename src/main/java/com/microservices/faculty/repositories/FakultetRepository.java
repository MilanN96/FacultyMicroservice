package com.microservices.faculty.repositories;

import com.microservices.faculty.jpa.Fakultet;
import java.util.Collection;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FakultetRepository extends JpaRepository<Fakultet, Integer>{
    Collection<Fakultet> findByNazivContainingIgnoreCase(String naziv);
}
