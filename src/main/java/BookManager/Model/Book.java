package BookManager.Model;

import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.persistence.*;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.*;
import java.sql.Blob;
import java.sql.SQLException;

@Entity
@Table(name = "books")
public class Book {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "BOOK_TITLE")
    private String bookTitle;

    @Column(name = "BOOK_AUTOR")
    private String bookAutor;

    @Column(name = "BOOK_PRICE")
    private int price;


    @Column(name = "BOOK_IMG")
    @Lob
    private Blob bookImg;

    @Column(name = "BOOK_INFO")
    private String bookInfo;

    public Blob getBookImg()
    {


        return bookImg;
    }

    public void setBookImg(Blob bookImg) {
        this.bookImg = bookImg;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getBookAutor() {
        return bookAutor;
    }

    public void setBookAutor(String bookAutor) {
        this.bookAutor = bookAutor;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getBookInfo() {
        return bookInfo;
    }

    public void setBookInfo(String bookInfo) {
        this.bookInfo = bookInfo;
    }

    @Override
    public String toString() {
        return "books{" +
                "id=" + id +
                ", bookTitle='" + bookTitle + '\'' +
                ", bookAutor='" + bookAutor + '\'' +
                ", price=" + price +
                '}';
    }
}
