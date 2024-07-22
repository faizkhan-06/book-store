package com.bookstore.entites;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Authors {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int authorId;
    private String authorName;

    @OneToMany(mappedBy = "authors")
    private List<Books> books = new ArrayList<Books>();

    public Authors() {
    }

    public Authors(int authorId, String authorName) {
        this.authorId = authorId;
        this.authorName = authorName;
    }

    public Authors(String authorName, List<Books> books) {
        this.authorName = authorName;
        this.books = books;
    }

    public Authors(String authorName) {
        this.authorName = authorName;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public String getauthorName() {
        return authorName;
    }

    public void setauthorName(String authorName) {
        this.authorName = authorName;
    }

    public List<Books> getBooks() {
        return books;
    }

    public void setBooks(List<Books> books) {
        this.books = books;
    }

}
