package com.asir.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.asir.spring.bean.Book;
import com.asir.spring.bean.IssueBook;
import com.asir.spring.bean.Librarian;
import com.asir.spring.bean.User;
import com.asir.spring.dao.EmployeeDao;

@Service
public class EmployeeService {
	EmployeeDao employeedao;

	public void setEmployeedao(EmployeeDao employeedao) {
		this.employeedao = employeedao;
	}

	public void saveEm(Librarian lib) {
		employeedao.save(lib);
	}

	public List<Librarian> getAllLib() {
		return employeedao.getAll();
	}

	public Librarian getLib(int id) {
		return employeedao.getLib(id);
	}

	public void updateLib(Librarian lib) {
		employeedao.updateLib(lib);
	}

	public void deleteEmp(Librarian lib) {
		employeedao.deleteEmp(lib);
	}

	public List<Librarian> libAuth(User us) {
		return employeedao.libAuth(us);
	}

	public void saveBook(Book b) {
		employeedao.saveBook(b);
	}

	public List<Book> getAllBooks() {
		return employeedao.getAllBooks();
	}

	public void saveIBook(IssueBook ib) {
		employeedao.saveIBook(ib);
	}

	public Book getBook(String callno) {
		return employeedao.getBook(callno);
	}

	public void updateBook(Book b) {
		employeedao.updateBook(b);
	}

	public List<IssueBook> getAlliBook() {
		return employeedao.getAlliBook();
	}

	public IssueBook getIssueBook(String studentid) {
		return employeedao.getIssueBook(studentid);
	}

	public void updateIssueBook(IssueBook i) {
		employeedao.updateIssueBook(i);

	}

	public Librarian getLibyEmail(String email) {
		
		return employeedao.getLibyEmail(email);
	}

}
