import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mokuroku/features/BookList/models/book.dart';

final booksRepositoryProvider = Provider<BooksRepository>((ref) {
  return BooksRepository();
});

final booksProvider = FutureProvider.autoDispose<List<Book>>((ref) async {
  final booksRepository = ref.watch(booksRepositoryProvider);
  return booksRepository.getBooks();
});

class BooksRepository {
  Future<List<Book>> getBooks() async {
    final books = [
      const Book(
        title: 'Book 1',
        author: 'Author 1',
      ),
      const Book(
        title: 'Book 2 -book2-',
        author: 'Author 2',
      ),
    ];
    return books;
  }
}
