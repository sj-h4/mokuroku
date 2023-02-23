import 'models.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required int id,
    required String title,
    required String author,
    required String publishedYear,
    List<String>? tags,
    String? summary,
    String? isbn,
    String? bibtex,
  }) = _Book;

  factory Book.fromJson(Map<String, Object?> json) => _$BookFromJson(json);
}
