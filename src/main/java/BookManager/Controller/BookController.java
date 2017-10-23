package BookManager.Controller;

import BookManager.Service.BookService;
import BookManager.Model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import java.io.*;
import java.io.File;
import java.sql.Blob;
import java.sql.SQLException;


@Controller
public class BookController {

    private BookService bookService;

    @Autowired
    @Qualifier(value = "bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping(value = "books",method = RequestMethod.GET)
    public String listBooks(Model model)
    {
        model.addAttribute("book", new Book());
        model.addAttribute("listBooks", this.bookService.listBooks());
        return "books";
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.POST)
    public @ResponseBody String addBook(@ModelAttribute("book") Book book, @RequestParam("file") MultipartFile file, HttpServletRequest request)
    {

       if (!file.isEmpty()) {

            try {

                byte[] fileBytes = file.getBytes();
                String rootPath = request.getSession().getServletContext().getRealPath("/");
                System.out.println("Server rootPath: " + rootPath);
                System.out.println("File original name: " + file.getOriginalFilename());
                System.out.println("File content type: " + file.getContentType());
                Blob blob = new SerialBlob(fileBytes);
                book.setBookImg(blob);
               File newFile = new File(rootPath + File.separator + file.getOriginalFilename());
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(newFile));

                stream.write(fileBytes);
                stream.close();

                System.out.println("File is saved under: " + rootPath + File.separator + file.getOriginalFilename());


            } catch (Exception e) {
                e.printStackTrace();
                return "File upload is failed: " + e.getMessage();
            }
        } else {
            return "File upload is failed: File is empty";
        }

        if(book.getId() == 0) this.bookService.addBook(book);
        else this.bookService.updateBook(book);
        return "redirect:/books";
    }






    @RequestMapping("/remove/{id}")
    public String remove(@PathVariable("id") int id)
    {
        this.bookService.removeBook(id);

        return "redirect:/books";
    }

    @RequestMapping("edit/{id}")
    public String editBook(@PathVariable("id") int id, Model model)
    {
        model.addAttribute("book", this.bookService.getBookById(id));
        model.addAttribute("listBooks", this.bookService.listBooks());

        return "books";
    }

    @RequestMapping("bookdata/{id}")
    public String bookData(@PathVariable("id") int id, Model model)
    {
        model.addAttribute("book", bookService.getBookById(id));

        return "bookdata";
    }

    @RequestMapping(value = "page",method = RequestMethod.GET)
    public String list(Model model, HttpServletResponse response)
    {

        model.addAttribute("book", new Book());
        model.addAttribute("listBooks", this.bookService.listBooks());

        return "page";
    }

    @RequestMapping(value={"image/{id}"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
    public void file(@PathVariable("id") int id, Model model, HttpServletResponse response)
    {
        model.addAttribute("book", bookService.getBookById(id));
        Blob img = bookService.getBookById(id).getBookImg();
        System.out.println(img);

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        OutputStream o = null;
        response.setContentType("image/jpg");


        try
        {
            int length = (int) img.length();
            byte[] buf = new byte[length];

            InputStream is = img.getBinaryStream();
            try {
                int dataSize;
                while ((dataSize = is.read(buf)) != -1) {
                    response.getOutputStream().write(buf, 0, dataSize);
                }
            } finally {
                if (is != null) {
                    is.close();
                }
            }
            int dataSize;
            response.setContentType("image/jpg");
        }
        catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model){
        return "../../index";
    }

}
