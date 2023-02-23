import 'package:isar/isar.dart';

part 'book.g.dart';

@collection
class Book {
  Id id = Isar.autoIncrement;
  late String title;
  late String author;
  late String publishedYear;
  List<String>? tags;
  String? summary;
  String? isbn;
  String? bibtex;
}
