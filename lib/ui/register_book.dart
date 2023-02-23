import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mokuroku/repositories/book_repository.dart';

import 'ui.dart';

class RegisterBook extends HookConsumerWidget {
  const RegisterBook({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController(text: '');
    final authorController = useTextEditingController(text: '');
    final publishedYearController = useTextEditingController(text: '');
    final tagsController = useTextEditingController(text: '');
    final summaryController = useTextEditingController(text: '');
    final isbnController = useTextEditingController(text: '');
    final bibtexController = useTextEditingController(text: '');

    // FIXME: sliver とかを使わないと画面がオーバーフローする
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  controller: publishedYearController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '出版年',
                    hintText: '出版年',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  controller: tagsController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'タグ',
                    hintText: 'タグ',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  controller: summaryController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '概要',
                    hintText: '概要',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  controller: isbnController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ISBN',
                    hintText: 'ISBN',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  controller: bibtexController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'BibTeX',
                    hintText: 'BibTeX',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(bookRepositoryProvider.future).then((value) {
                    value.addBook(
                        titleController.text,
                        authorController.text,
                        publishedYearController.text,
                        tagsController.text.split(','),
                        summaryController.text,
                        isbnController.text,
                        bibtexController.text);
                  });
                  ref.read(bookRepositoryProvider.future).then((value) {
                    value.getAllBooks(); // HACK: これがないと登録した本が表示されない
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
