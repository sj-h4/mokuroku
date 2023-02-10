import 'ui.dart';
import 'package:mokuroku/features/BookList/data/book_repository.dart';
import 'package:mokuroku/features/BookList/providers/books_provider.dart';

class BookList extends HookConsumerWidget {
  const BookList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Book List'),
        ),
        body: ref.watch(booksProvider).when(
            data: (books) {
              return ListView.builder(
                padding: const EdgeInsets.all(40),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return Card(
                    elevation: 0,
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(book.title),
                          subtitle: Text(book.author),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            error: ((error, stackTrace) => Text(error.toString())),
            loading: CircularProgressIndicator.new),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(bookRepositoryProvider.future).then((value) {
              value.addBook('Book12', 'Author12');
            });
          },
          child: const Icon(Icons.add),
        ));
  }
}
