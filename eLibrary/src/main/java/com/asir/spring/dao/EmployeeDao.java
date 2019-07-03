package com.asir.spring.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate4.HibernateTemplate;
//import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Transactional;

import com.asir.spring.bean.Book;
import com.asir.spring.bean.IssueBook;
import com.asir.spring.bean.Librarian;
import com.asir.spring.bean.User;

@Transactional(readOnly = false)
public class EmployeeDao {
    
	HibernateTemplate sessionFactory;

	EmployeeDao() {
		System.out.println(sessionFactory);
	}

	public void setTemplate(HibernateTemplate template) {
		this.sessionFactory = template;
	}

	@Transactional(readOnly = false)
	public void save(Librarian lib) {
		sessionFactory.save(lib);

	}

	@Transactional(readOnly = false)
	public List<Librarian> getAll() {
		List<Librarian> list = sessionFactory.loadAll(Librarian.class);
		return list;

	}

	@Transactional(readOnly = false)
	public Librarian getLib(int id) {
		Librarian lib = (Librarian) sessionFactory.get(Librarian.class, id);
		return lib;
	}

	@Transactional(readOnly = false)
	public void updateLib(Librarian lib) {
		// System.out.println(lib);
		sessionFactory.update(lib);
	}

	@Transactional(readOnly = false)
	public void deleteEmp(Librarian lib) {
		sessionFactory.delete(lib);
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = false)
	public List<Librarian> libAuth(User us) {
		List<Librarian> libList = new ArrayList<Librarian>();
		String Query = "select id, name,email,mobile from Librarian where email=? and password=?";
		Object[] queryParam = { us.getEmail(), us.getPassword() };

		libList = (List<Librarian>) sessionFactory.find(Query, queryParam);
		// System.out.println(libList);
		// sessionFactory.fin
		return libList;

	}

	public void saveBook(Book b) {
		sessionFactory.save(b);
	}

	public List<Book> getAllBooks() {
		return sessionFactory.loadAll(Book.class);
	}

	public void saveIBook(IssueBook ib) {
		sessionFactory.save(ib);
	}

	@Transactional(readOnly = false)
	public Book getBook(String callno) {
		return sessionFactory.get(Book.class, callno);

	}

	public void updateBook(Book b) {
		sessionFactory.update(b);
	}

	public List<IssueBook> getAlliBook() {
		return sessionFactory.loadAll(IssueBook.class);

	}

	public IssueBook getIssueBook(String studentid) {
		return sessionFactory.get(IssueBook.class, studentid);

	}

	public void updateIssueBook(IssueBook i) {
		sessionFactory.update(i);

	}

	public Librarian getLibyEmail(String email) {
		
		Librarian lib= (Librarian) sessionFactory.get(Librarian.class,email.trim());
	
		System.out.println(lib);
		return lib;
	}

}
