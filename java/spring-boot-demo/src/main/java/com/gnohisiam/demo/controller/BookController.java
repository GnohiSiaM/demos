package com.gnohisiam.demo.controller;

import com.gnohisiam.demo.configuration.TestConfiguration;
import com.gnohisiam.demo.model.Book;
import com.gnohisiam.demo.service.BookService;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;

@Log
@RestController
@RequestMapping("books")
public class BookController {

    @Autowired
    private TestConfiguration config;

    @Autowired
    private BookService service;

    @GetMapping("config")
    public TestConfiguration getConfig() {
        return config;
    }

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
    public Book getBooks(
            @RequestParam(required = false) String author,
            @RequestParam(required = false) String name
    ) {
        return service.findBook(name, author);
    }

}
