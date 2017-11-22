package BookManager.Controller;


import BookManager.Model.Book;
import BookManager.Model.User;
import BookManager.Service.ShoppingCart;
import BookManager.Service.BookService;
import BookManager.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpSession;



@Controller
public class CartController {

   private ShoppingCart cart = new ShoppingCart();
   private ShoppingCart shoppingCart;
   private BookService bookService;
   private UserService userService;

    @Autowired
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
       this.userService = userService;
    }


    @Autowired
    @Qualifier(value = "bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping("cart/{id}") //add book to HttpSession
    public String addToCart(@PathVariable("id") int id, Model model, HttpSession session)
    {

        cart.bookToCart( bookService.getBookById(id));
        session.setMaxInactiveInterval(3600);
        session.setAttribute("cart",cart);

        return "redirect:/books";
    }

    @RequestMapping(value="/cart",method=RequestMethod.GET)
    public String cartList(Model model, HttpSession session) // List books of HttpSession
    {

         shoppingCart = (ShoppingCart) session.getAttribute("cart");
         if(shoppingCart==null) {
             shoppingCart = new ShoppingCart();
         }
        model.addAttribute("cart", shoppingCart.getItems());

         if(shoppingCart.getItems()!= null && shoppingCart.getItems().size() > 0)
         {
             int amount = 0;
             for(Book b : shoppingCart.getItems())
             {
                 amount +=b.getPrice();
             }

             model.addAttribute("amount", amount);
         }

        return "cart";
    }

    @RequestMapping("/delete/{id}")
    public String remove(@PathVariable("id") int id) //remove book of cart
    {
        shoppingCart.removeBook(id);

        return "redirect:/cart";
    }

    @RequestMapping(value = "/cart/order", method = RequestMethod.POST)
    public String addOrder(@ModelAttribute("book") Book book) //add orders to ManyToMany books_users
    {

        for(Book b: this.shoppingCart.getItems())
        {
            userService.addBook(b);
        }

        return "redirect:/books";
    }

    @RequestMapping(value="/orders",method=RequestMethod.GET)
    public String cartList(Model model) //display all orders on page
    {


        model.addAttribute("listUsers", this.bookService.getUsersOrder());
        model.addAttribute("listBooks", this.userService.getBooksOrders());

        int ordersCount = 0;

        for(Book b :this.userService.getBooksOrders())
        {
            ordersCount +=b.getPrice();
        }

        model.addAttribute("ordersCount", ordersCount);
        return "orders";
    }

}
