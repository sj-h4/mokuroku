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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Text(
                              book!.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Text(
                            '${book.author} (${book.publishedYear})',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Tag: ${book.tags?.join(', ') ?? ''}',
                            style: const TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            ref
                                .read(bookRepositoryProvider.future)
                                .then((value) {
                              value.deleteBook(book.id);
                            });
                            context.go('/');
                          },
                          icon: const Icon(Icons.delete)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Text(
                        'Summary',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        book.summary ?? '',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          error: ((error, stackTrace) => Text(error.toString())),
          loading: CircularProgressIndicator.new),
    );
  }
}
