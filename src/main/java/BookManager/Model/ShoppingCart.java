package BookManager.Model;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {


    private List<Book> items;

    public ShoppingCart()
    {
        this.items = new ArrayList<Book>();
    }

    public List<Book> getItems() {
        return items;
    }

    //add book to cart
    public void bookToCart(Book book)
    {
        if(book !=null)
        {
            items.add(book);
        }
    }
    public void removeBook(int id)
    {
        Book book = getBookId(id);
       items.remove(book);
    }


    public Book getBookId(int id)
    {

        for(Book book : items)
        {
            if(id==book.getId())
            {
                return book;
            }
        }
        return null;
    }

}
