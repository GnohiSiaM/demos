package com.gnohisiam.repository;

import com.gnohisiam.model.Supermarket;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SupermarketRepository extends MongoRepository<Supermarket, String> {
}
