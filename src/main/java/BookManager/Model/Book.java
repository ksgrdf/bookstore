package BookManager.Model;

import org.hibernate.Hibernate;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.persistence.*;
import javax.swing.*;
import javax.transaction.Transactional;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.*;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

//TODO try to use Lombok instead of get() set()
//Todo before use it read about it
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

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "books_users",
            joinColumns = { @JoinColumn(name = "book_id") },
            inverseJoinColumns = { @JoinColumn(name = "user_id") })
    private Set<User> usersOrder = new HashSet<User>();

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


    public Set<User> getUsersOrder() {

        Hibernate.initialize(usersOrder);
        return usersOrder;
    }

    public void setUsersOrder(Set<User> UserOrders) {
        this.usersOrder = UserOrders;
    }


    public void addUser(User user)
    {
        Hibernate.initialize(usersOrder);
        usersOrder.add(user);
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
