package com.gnohisiam.demo.service;


import com.gnohisiam.demo.model.Book;
import com.gnohisiam.demo.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class BookService {

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
        repository.delete(id);
    }

    public Book findBook(String name, String author) {
        return repository.findBook(name, author);
    }

}
