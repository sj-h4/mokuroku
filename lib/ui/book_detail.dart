import 'package:mokuroku/providers/book_detial_provider.dart';
import 'package:mokuroku/repositories/book_repository.dart';

import 'ui.dart';

class BookDetail extends HookConsumerWidget {
  const BookDetail(this.bookId, {super.key});
  final int bookId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: ref.watch(bookDetialProvider(bookId)).when(
          data: (book) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(book!.title),
                Text(book.author),
                IconButton(
                    onPressed: () {
                      ref.read(bookRepositoryProvider.future).then((value) {
                        value.deleteBook(book.id);
                      });
                      context.go('/');
                    },
                    icon: const Icon(Icons.delete))
              ],
            ));
          },
          error: ((error, stackTrace) => Text(error.toString())),
          loading: CircularProgressIndicator.new),
    );
  }
}
