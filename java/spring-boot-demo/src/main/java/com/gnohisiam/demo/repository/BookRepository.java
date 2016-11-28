package com.gnohisiam.demo.repository;

import com.gnohisiam.demo.model.Book;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BookRepository extends MongoRepository<Book, String> {

    @Query("{name:?0, author:?1}")
    Book findBook(String name, String author);

}
