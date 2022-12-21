import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mokuroku/core/models/book.dart';

part 'isar_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<Isar> isarInstance(IsarInstanceRef ref) {
  return Isar.open([BookSchema]);
}
