import 'package:mokuroku/isar/services/book_service.dart';
import 'package:mokuroku/models/book.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_repository.g.dart';

@riverpod
Future<BookRepository> bookRepository(BookRepositoryRef ref) async {
  final bookService = await ref.watch(bookServiceProvider.future);
  return BookRepository(bookService);
}

class BookRepository {
  BookRepository(this.bookService);

  final BookService bookService;

  Future<List<Book>> getAllBooks() async {
    return bookService.findAll();
  }

  Future<Book?> getOneBookById(int id) async {
    return bookService.findById(id);
  }

  Future<void> addBook(String bookName, String author) async {
    await bookService.add(bookName, author);
  }

  Future<void> deleteBook(int id) async {
    await bookService.delete(id);
  }
}
