import 'package:mokuroku/repositories/book_repository.dart';
import 'package:mokuroku/models/book.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'books_provider.g.dart';

@riverpod
Future<List<Book>> books(BooksRef ref) async {
  final bookRepository = await ref.watch(bookRepositoryProvider.future);
  return bookRepository.getBooks();
}
