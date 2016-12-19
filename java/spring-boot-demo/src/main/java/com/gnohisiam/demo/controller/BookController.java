package com.gnohisiam.demo.controller;

import java.util.List;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.gnohisiam.demo.model.Book;
import com.gnohisiam.demo.service.BookService;

@Slf4j
@RestController
@RequestMapping("books")
public class BookController {

    @Autowired
    private BookService service;

    @PostMapping
    public Book createBook(@RequestBody Book book,
           @RequestHeader("Host") String host,
           @RequestHeader("Accept") String accept,
           @RequestHeader("Accept-Encoding") String encoding,
           @RequestHeader("Accept-Language") String Language
    ) {
        log.info("--------------@RequestHeader-start-------------");
        log.info(host);
        log.info(accept);
        log.info(encoding);
        log.info(Language);
        log.info("--------------@RequestHeader--end--------------");

        return service.saveBook(book);
    }

    @DeleteMapping
    public void deleteBook(@RequestParam String id) {
        service.deleteBook(id);
    }

    @GetMapping
    public Page<Book> getAllBooks(@PageableDefault Pageable pageable) {
        log.info(pageable.toString());
        return service.findAllBooks(pageable);
    }

    @GetMapping("{id}")
    public Book getBook(@PathVariable String id) {
        return service.findBook(id);
    }

    @GetMapping("search")
    public List<Book> getBooks(
            @RequestParam(required = false) String author,
            @RequestParam(required = false, defaultValue = "0") float lowPrice,
            @RequestParam(required = false, defaultValue = "1000") float highPrice
    ) {
        return service.findBook(author, lowPrice, highPrice);
    }

    @PostMapping("exists")
    public boolean existsBook(@RequestBody Book book) {
        return service.existsBook(book);
    }

}
