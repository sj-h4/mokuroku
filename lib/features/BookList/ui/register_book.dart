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
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.go('/'),
            )),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'タイトル',
                    hintText: 'タイトル',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  controller: authorController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '著者',
                    hintText: '著者',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(bookRepositoryProvider.future).then((value) {
                    value.addBook(titleController.text, authorController.text);
                  });
                  context.go('/');
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ));
  }
}
