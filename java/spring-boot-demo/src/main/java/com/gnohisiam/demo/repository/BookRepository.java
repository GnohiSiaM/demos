package com.gnohisiam.demo.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;
import com.gnohisiam.demo.model.Book;

@Repository
public interface BookRepository extends MongoRepository<Book, String> {

    @Query("{author: ?0, price: {$gte: ?1, $lte: ?2}}")
    List<Book> findBooks(String author, float from, float to);

    List<Book> findByAuthorAndPriceBetweenOrderByPriceAsc(String author, float from, float to);

    @Query(value = "{author: ?0}", delete = true)
    void deleteByAuthor(String author);

}
