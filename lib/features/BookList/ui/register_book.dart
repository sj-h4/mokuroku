import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mokuroku/features/BookList/data/book_repository.dart';

import 'ui.dart';

class RegisterBook extends HookConsumerWidget {
  const RegisterBook({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController(text: '');
    final authorController = useTextEditingController(text: '');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register Book'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Book Name',
                ),
              ),
              TextField(
                controller: authorController,
                decoration: const InputDecoration(
                  hintText: 'Author',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(bookRepositoryProvider.future).then((value) {
                    value.addBook(titleController.text, authorController.text);
                  });
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ));
  }
}
