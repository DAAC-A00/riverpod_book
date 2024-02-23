// vim book_add_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter/book.dart';
import 'package:riverpod_counter/book_state_notifier.dart';

class BookAddScreen extends ConsumerWidget {
  const BookAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var title = "";
    var description = "";

    return Scaffold(
      appBar: AppBar(
        title: const Text("책 추가하기"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: "책 제목을 입력해 주세요."),
              onChanged: (text) {
                title = text;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "책 소개를 입력해 주세요."),
              onChanged: (text) {
                description = text;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                final book = Book(title: title, description: description);
                ref.read(booksProvider.notifier).addBook(book);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: const Text("책 추가하기"),
            ),
          ],
        ),
      ),
    );
  }
}
