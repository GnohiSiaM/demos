package com.gnohisiam.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.stereotype.Service;
import com.gnohisiam.demo.model.Book;
import com.gnohisiam.demo.repository.BookRepository;

@Service
public class BookService {

    @Autowired
    private MongoOperations mongoTemplate;

    @Autowired
    private BookRepository repository;

    public Book saveBook(Book book) {
        return repository.save(book);
    }

    public Book findBook(String id) {
        return repository.findOne(id);
    }

    public Page<Book> findAllBooks(Pageable pageable) {
        return repository.findAll(pageable);
    }

    public void deleteBook(String id) {
        repository.deleteByAuthor(id);
    }

    public List<Book> findBook(String author, float lowPrice, float highPrice) {
        //mongoTemplate.getCollection("Book").distinct("author");
        return repository.findByAuthorAndPriceBetweenOrderByPriceAsc(author, lowPrice, highPrice);
    }

    public boolean existsBook(Book book) {
        return repository.exists(Example.of(book));
    }

}
