package com.gnohisiam.repository;

import com.gnohisiam.model.Manager;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ManagerRepository extends MongoRepository<Manager, String> {

    Manager findByENumber(String dNumber);

}
