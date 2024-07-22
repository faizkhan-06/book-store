package com.bookstore.entites;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;



@Entity
public class Books {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int bookId;
    private String bookName;
    private String releaseDate;
    private String bookImage;
    private float bookPrice;
    private int bookQuantity;
    
    @ManyToOne
    private Category category;
    
    @ManyToOne
    private Authors authors;

    public Authors getAuthors() {
        return authors;
    }

    public void setAuthors(Authors authors) {
        this.authors = authors;
    }
    
    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getBookImage() {
        return bookImage;
    }

    public void setBookImage(String bookImage) {
        this.bookImage = bookImage;
    }

    public float getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(float bookPrice) {
        this.bookPrice = bookPrice;
    }

    public int getBookQuantity() {
        return bookQuantity;
    }

    public void setBookQuantity(int bookQuantity) {
        this.bookQuantity = bookQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Books() {
    }

    public Books(String bookName, String releaseDate, String bookImage, float bookPrice, int bookQuantity, Category category, Authors authors) {
        this.bookName = bookName;
        this.releaseDate = releaseDate;
        this.bookImage = bookImage;
        this.bookPrice = bookPrice;
        this.bookQuantity = bookQuantity;
        this.category = category;
        this.authors = authors;
    }

    public Books(int bookId, String bookName, String releaseDate, String bookImage, float bookPrice, int bookQuantity) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.releaseDate = releaseDate;
        this.bookImage = bookImage;
        this.bookPrice = bookPrice;
        this.bookQuantity = bookQuantity;
    }

    @Override
    public String toString() {
        return "Books{" + "bookId=" + bookId + ", bookName=" + bookName + ", releaseDate=" + releaseDate + ", bookImage=" + bookImage + ", bookPrice=" + bookPrice + ", bookQuantity=" + bookQuantity + ", category=" + category + ", authors=" + authors + '}';
    }

   
    
            
    
           
    
    
    
}
