package info4.bd.jpa.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import info4.bd.jpa.entity.Book;
import info4.bd.jpa.repository.BookRepository;

import java.util.List;

/**
 * The Book service
 */
@Service("bookService")
public class BookService {
	
	@Autowired
	private BookRepository bookRepository;
		
	/**
	 * Create a new book
	 */ 
	private void create(String title, String isbn) {
		Book newBook = bookRepository.save(new Book(title, isbn));
		System.out.println("Book created:");
		System.out.println("------------------------------------------");
		System.out.println(newBook.toString());
	}

	/**
	 * Find a book by ID
	 * 
	 * @param id id of the book
	 */
	private void findById(long id) {
		// fetch book by id
		Book book = bookRepository.findById(id).get();
		System.out.println("Book found with findById(id):");
		System.out.println("-----------------------------");
		System.out.println(book.toString());
		System.out.println();
	}

	/**
	 * Find books by ISBN
	 * 
	 * @param isbn the ISBN of the book
	 */
	private void findByIsbn(String isbn) {
		// fetch book by ISBN
		Book bookWithIBSN = bookRepository.findByIsbn(isbn);
		System.out.println("Book found with findByIsbn('"+isbn+"'):");
		System.out.println("------------------------------------------");
		System.out.println(bookWithIBSN.toString());
		System.out.println();
	}

	/**
	 * Find books that contain keyword in title
	 * 
	 * @param isbn the ISBN of the book
	 */
	private void findByTitleContaining(String keyword) {
		System.out.println("Books that contain keyword '"+keyword+"':");
		System.out.println("----------------------------------");
		for (Book b : bookRepository.findByTitleContaining(keyword)) {
			System.out.println(b.toString());
		}
		System.out.println();
	}
	
	/**
	 * List all books by title and isbn
	 */
	private void findByTitleAndIsbn(String title, String isbn) {
		System.out.println("Books found with findByTitleAndIsbn():");
		System.out.println("---------------------------");
		for (Book book : bookRepository.findByTitleAndIsbn(title,isbn)) {
			System.out.println(book.toString());
		}
		System.out.println();
	}

	/**
	 * List all books
	 */
	private void findAll() {
		System.out.println("Books found with findAll():");
		System.out.println("---------------------------");
		for (Book book : bookRepository.findAll()) {
			System.out.println(book.toString());
		}
		System.out.println();
	}

	/**
	 * Count number of book
	 */
	private void count() {

		// total books in DB
		System.out.println("Total books in DB:");
		System.out.println("------------------");
		System.out.println(bookRepository.count());
		System.out.println();
	}

	/**
	 * Delete all books
	 */
	private void deleteAll() {
		bookRepository.deleteAll();
	}
	
	/**
	 * Update book title
	 */
	private void update(long id, String newTitle) {
		// 
		Book bookUpdate = bookRepository.findById(id).get();
		bookUpdate.setTitle(newTitle);
		bookRepository.save(bookUpdate);
		System.out.println("Update book title:");
		System.out.println("------------------");
		System.out.println(bookUpdate.toString());
		System.out.println();
	}

	/**
	 * Test
	 */
	public void test() {
		// create books
		create("Beginning Java 2", "1861002238");
		count();
		create("Java Gently", "0201342979");
		count();
		create("Java 2 Platform Unleashed", "0672316315");		
		count();
		create("Transaction Processing: Concepts and Techniques", "0080519555");		
		count();
		create("Readings in Database Systems", "1558605231");		
		count();
		findById(1L);
		findByIsbn("0201342979");
		findByTitleAndIsbn("Java Gently","0201342979");
		findByTitleContaining("Java");
		findAll();
		update(2L, "Java Gently 2nd Edition");
		findById(2L);
		count();
		deleteAll();
		count();
	}
}
