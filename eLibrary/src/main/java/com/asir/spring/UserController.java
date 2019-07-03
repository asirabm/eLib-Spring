package com.asir.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.ModelAndView;

import com.asir.spring.bean.Book;
import com.asir.spring.bean.Librarian;
import com.asir.spring.bean.User;
import com.asir.spring.bean.IssueBook;
//import com.asir.spring.dao.EmployeeDao;
import com.asir.spring.service.EmployeeService;
import java.util.*;

@Controller
public class UserController {
	@Autowired
	EmployeeService s;

	@RequestMapping("/adminLogin")
	public String adminLogin(Model m, @ModelAttribute("user") User user, HttpSession session) {
		String email = (String) session.getAttribute("email");
		if (email == null) {

			if (user.getEmail() == null && user.getPassword() == null) {

				return "error";

			}

			else {
				if (user.getEmail().equals("asir.abm@gmail.com") && user.getPassword().equals("abm")) {
					session.setAttribute("email", user.getEmail());
					return "adminHome";
				} else {
					return "error";
				}

			}

		}

		else {
			return "adminHome";
		}

	}

	@RequestMapping("/index")
	public String index() {
		return "index";
	}

	@RequestMapping("/AddLibrarianForm")
	public String addLibra(Model m, HttpSession session) {

		String email = (String) session.getAttribute("email");
		if (email == null) {
			return "redirect:/index";
		}

		m.addAttribute("command", new Librarian());
		return "addLibrarianForm";
	}

	@RequestMapping("/savelib")
	public String saveLib(@ModelAttribute("lib") Librarian lib, HttpSession session) {

		String email = (String) session.getAttribute("email");
		if (email == null) {
			return "redirect:/index";
		}

		// m.addAttribute("lib", lib);
		s.saveEm(lib);
		return "redirect:/ViewLibrarian";

	}

	@RequestMapping("/ViewLibrarian")
	public String viewlib(Model m, HttpSession session) {

		String email = (String) session.getAttribute("email");
		if (email == null) {
			return "redirect:/index";
		}

		List<Librarian> list = s.getAllLib();
		//System.out.print(list.get(0).getEmail());
		m.addAttribute("list", list);
		return "viewlib";

	}

	@RequestMapping(value = "/update/{e}",method = RequestMethod.GET)
	public String updateLib(@PathVariable String e, Model m, HttpSession session) {
		System.out.println("Asir");
		String email = (String) session.getAttribute("email");
		if (email == null) {
			return "redirect:/index";
		}
		System.out.println(e);
		// System.out.println(id);
		Librarian lib = s.getLibyEmail(e);
		System.out.println(lib);
		m.addAttribute("command", lib);
		// System.out.println(lib);
		return "libeditform";
	}

	@RequestMapping(value = "/saveedit", method = RequestMethod.POST)
	public String saveedit(@ModelAttribute() Librarian lib, HttpSession session) {

		String email = (String) session.getAttribute("email");
		if (email == null) {
			return "redirect:/index";
		}

		// System.out.println(lib);
		s.updateLib(lib);
		return "redirect:/ViewLibrarian";
	}

	@RequestMapping(value = "delete/{e}")
	public String Delete(@PathVariable String e, HttpSession session) {

		String email = (String) session.getAttribute("email");
		if (email == null) {
			return "redirect:/index";
		}

		Librarian lib = s.getLibyEmail(e);
		s.deleteEmp(lib);
		return "redirect:/ViewLibrarian";
	}

	@RequestMapping("/LogoutAdmin")
	public String LogOutAdmin(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}

	@RequestMapping("/LibrarianLogin")
	public String LoginLib(@ModelAttribute("us") User us, HttpSession session) {
		List<Librarian> list = s.libAuth(us);

		String email = (String) session.getAttribute("email");

		if (email != null) {
			return "LibraHome";
		}

		if (!list.isEmpty()) {
			session.setAttribute("email", us.getEmail());
			return "LibraHome";
		} else {
			return "redirect:/index";
		}

	}

	@RequestMapping("/AddBookForm")
	public String addBookForm(HttpSession session) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			return "redirect:/index";
		}
		return "addBookForm";
	}

	@RequestMapping(value = "/AddBook", method = RequestMethod.POST)
	public String addBook(@ModelAttribute("book") Book book, HttpSession session) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			return "redirect:/index";
		}
		s.saveBook(book);
		return "redirect:/ViewBook";
	}

	@RequestMapping("/ViewBook")
	public String Viewbook(Model m, HttpSession session) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			return "redirect:/index";
		}

		List<Book> list = s.getAllBooks();
		m.addAttribute("list", list);
		return "viewbook";
	}

	@RequestMapping("/IssueBookForm")
	public String issueBookForm(HttpSession session) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			return "redirect:/index";
		}

		return "issueBookForm";
	}

	@RequestMapping(value = "/IssueBook", method = RequestMethod.POST)
	public String IssueBook(@ModelAttribute("ib") IssueBook ib, Model m, HttpSession session) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			return "redirect:/index";
		}

		Book b = s.getBook(ib.getCallno());
		System.out.println(b);
		int q = b.getQuantity();
		int i = b.getIssued();
		if (i >= q) {
			m.addAttribute("msg", "Not available");
			return "redirect:/IssueBookForm";
		} else {
			b.setIssued(i + 1);
			s.updateBook(b);
			s.saveIBook(ib);
			return "redirect:/ViewIssuedBook";
		}

	}

	@RequestMapping("/ViewIssuedBook")
	public String viewIssuedBook(Model m, HttpSession session) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			return "redirect:/index";
		}

		List<IssueBook> iL = s.getAlliBook();
		m.addAttribute("list", iL);
		return "viewIssuedBook";
	}

	@RequestMapping("/ReturnBookForm")
	public String ReturnBookForm(Model m, HttpSession session) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			return "redirect:/index";
		}

		return "returnBookForm";
	}

	@RequestMapping("/ReturnBook")
	public String ReturnBook(@ModelAttribute("rb") IssueBook ib, HttpSession session) {

		String email = (String) session.getAttribute("email");
		if (email == null) {
			return "redirect:/index";
		}

		String callno = ib.getCallno();
		String studentid = ib.getStudentid();
		Book b = s.getBook(callno);
		IssueBook i = s.getIssueBook(studentid);
		i.setReturnstatus("yes");
		b.setIssued(b.getIssued() - 1);
		s.updateBook(b);
		s.updateIssueBook(i);
		return "redirect:/ViewIssuedBook";
	}

	@RequestMapping("/LogoutLibrarian")
	public String LogoutLibrarian(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}

	@RequestMapping("/callnoCheck")
	public String callnoCheck(HttpServletRequest request, Model m) {
		String callno = request.getParameter("callno");
		Book b = s.getBook(callno);
		if (b != null) {
			return "callnoCheck";
		} else {
			return "callnoCheck2";
		}
	}

	@RequestMapping("/callnoavailable")
	public String callnoavailable(HttpServletRequest request, Model m) {
		String callno = request.getParameter("callno");
		Book b = s.getBook(callno);
		if (b == null) {
			return "notavailable";
		}

		else {
			int q = b.getQuantity();
			int i = b.getIssued();
			if (q > i) {
				return "available";
			} else {
				return "notavailable";
			}
		}

	}

	@RequestMapping("/checkstudent")
	public String checkstudent(HttpServletRequest request, Model m) {
		String id = request.getParameter("id");
		IssueBook book = s.getIssueBook(id);
		if (book == null) {
			return "checkstuID2";
		} else {
			String r = book.getReturnstatus();
			if (r.equals("no")) {
				return "checkstuID";
			} else {
				return "checkstuID2";
			}
		}
	}
	@RequestMapping("/emailCheck")
	public String emailCheck(HttpServletRequest request) {
		String email=request.getParameter("email");
		Librarian lib=s.getLibyEmail(email);
		if(lib==null) {
			return "emailcheck2";
		}
		else {
			return "emailcheck";
			
		}
		
		
		
		
	}
	
	


	

}
