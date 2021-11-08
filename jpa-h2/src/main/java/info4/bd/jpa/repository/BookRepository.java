package info4.bd.jpa.repository;

import info4.bd.jpa.entity.Book;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BookRepository extends CrudRepository<Book, Long> {

    Book findByIsbn(String isbn);

    List<Book> findByTitleContaining(String title);
    
    // TODO add findBy with @Query
	@Query("SELECT b FROM Book b  WHERE b.title=(:t) AND b.isbn= (:i)")
	List<Book> findByTitleAndIsbn(@Param("t") String title, @Param("i") String isbn);
}