import 'package:isar/isar.dart';
import 'package:mokuroku/core/datasources/isar_provider.dart';
import 'package:mokuroku/core/models/book.dart';
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
    return isar.books.where().findAll();
  }

  Future<void> add(String bookName, String author) async {
    final book = Book()
      ..title = bookName
      ..author = author;
    await isar.writeTxn(() async {
      await isar.books.put(book);
    });
  }
}
