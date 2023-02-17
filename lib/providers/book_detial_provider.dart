import 'package:mokuroku/models/book.dart';
import 'package:mokuroku/repositories/book_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_detial_provider.g.dart';

@riverpod
Future<Book?> bookDetial(BookDetialRef ref, int bookId) async {
  final bookRepository = await ref.watch(bookRepositoryProvider.future);
  return bookRepository.getOneBookById(bookId);
}
