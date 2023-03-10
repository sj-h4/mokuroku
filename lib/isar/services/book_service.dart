import 'package:isar/isar.dart';
import 'package:mokuroku/isar/isar_provider.dart';
import 'package:mokuroku/isar/models/book.dart' as isar_book;
import 'package:mokuroku/models/book.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_service.g.dart';

@riverpod
Future<BookService> bookService(BookServiceRef ref) async {
  final isar = await ref.watch(isarInstanceProvider.future);
  return BookService(isar: isar);
}

class BookService {
  const BookService({required this.isar});
  final Isar isar;

  Future<List<Book>> findAll() async {
    final books = await isar.books.where().findAll();
    return books
        .map((book) => Book(
            id: book.id,
            title: book.title,
            author: book.author,
            publishedYear: book.publishedYear,
            tags: book.tags,
            summary: book.summary,
            isbn: book.isbn,
            bibtex: book.bibtex))
        .toList();
  }

  Future<Book?> findById(int id) async {
    final book = await isar.books.get(id);
    return book == null
        ? null
        : Book(
            id: book.id,
            title: book.title,
            author: book.author,
            publishedYear: book.publishedYear,
            tags: book.tags,
            summary: book.summary,
            isbn: book.isbn,
            bibtex: book.bibtex);
  }

  Future<void> add(String bookName, String author, String publishedYear,
      List<String>? tags, String? summary, String? isbn, String? bibtex) async {
    final book = isar_book.Book()
      ..title = bookName
      ..author = author
      ..publishedYear = publishedYear
      ..tags = tags
      ..summary = summary
      ..isbn = isbn
      ..bibtex = bibtex;
    await isar.writeTxn(() async {
      await isar.books.put(book);
    });
  }

  Future<void> delete(int id) async {
    await isar.writeTxn(() async {
      await isar.books.delete(id);
    });
  }
}
