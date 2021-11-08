package info4.bd.jpa.repository;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.List;
import java.util.Optional;
import java.util.stream.*;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;

import info4.bd.jpa.entity.Book;
import info4.bd.jpa.repository.BookRepository;

@RunWith(SpringRunner.class)
@DataJpaTest
//  If you want to run the tests against the actually registered database, you can annotate the test with @AutoConfigureTestDatabase(replace=Replace.NONE), which will use the registered DataSource instead of an in-memory data source. 
// @AutoConfigureTestDatabase(replace=Replace.NONE)
public class BookRepositoryTest {

	@Autowired
	private BookRepository bookRepository;

	private List<Book> convert(Iterable<Book> iterable) {
		return StreamSupport
			  .stream(iterable.spliterator(), false)
			  .collect(Collectors.toList());
	}

	@Test
	public void it_can_find_the_book_after_save_it() {
		Book book = new Book("Beginning Java 2", "1861002238");
		bookRepository.save(book);
		List<Book> books = convert(bookRepository.findAll());
		
		assertEquals(1, books.size());
		assertEquals("Beginning Java 2", books.get(0).getTitle());
		assertEquals("1861002238", books.get(0).getIsbn());
	}

	@Test
	public void it_can_delete_the_book_after_save_it() {
		Book book = new Book("Beginning Java 2", "1861002238");		
		bookRepository.save(book);
		List<Book> foundBooks = convert(bookRepository.findAll());
		bookRepository.delete(foundBooks.get(0));
		foundBooks = convert(bookRepository.findAll());
		assertEquals(0, foundBooks.size());
	}
	
	@Test
	public void it_can_update_the_book_after_save_it() {
		Book book = new Book("Beginning Java 2", "1861002238");
		bookRepository.save(book);
		book.setTitle("Beginning Java 2nd Edition");
		bookRepository.save(book);
		
		List<Book> books = convert(bookRepository.findAll());
		assertEquals(1, books.size());
		assertEquals("Beginning Java 2nd Edition", books.get(0).getTitle());
	}


	@Test
	public void it_can_find_books_by_title_containing() {

		Book book1 = new Book("Beginning Java 2", "1861002238");
		Book book2 = new Book("Java Gently", "0201342979");
		Book book3 = new Book("Java 2 Platform Unleashed", "0672316315");		
		Book book4 = new Book("Transaction Processing: Concepts and Techniques", "0080519555");		
		Book book5 = new Book("Readings in Database Systems", "1558605231");		

		List<Book> booksWithJava = convert(bookRepository.findByTitleContaining("Java"));
		assertEquals(3, booksWithJava.size());
	}
	
	@Test
	public void it_return_null_when_not_found(){
		Optional<Book> book = bookRepository.findById(6L);
		assertEquals(false, book.isPresent());
	}

	
    @Autowired
    private TestEntityManager entityManager;
 
    @Test
    public void entity_manager() {
  
		Book book = new Book("Beginning Java 2", "1861002238");
        Integer id = entityManager.persistAndGetId(book, Integer.class);
        assertNotNull(id);
        Book book2 = bookRepository.findByIsbn("1861002238");
        assertNotNull(book);
        assertEquals(book2.getTitle(), book.getTitle());
        assertEquals(book2.getIsbn(), book.getIsbn());
    } 

	
}
