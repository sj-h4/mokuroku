import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mokuroku/features/BookList/data/books_repository.dart';

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
    );
  }
}
