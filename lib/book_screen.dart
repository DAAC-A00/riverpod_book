// vim book_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter/book_add_screen.dart';
import 'package:riverpod_counter/book_state_notifier.dart';
import 'package:riverpod_counter/book_widget.dart';

class BookScreen extends ConsumerWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // booksProvider가 관리하는? 값을 가져오게 됩니다.
    final bookList = ref.watch(booksProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("책 소개"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            bookList.isEmpty
                ? const Text("소개할 책이 없습니다.")
                : Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          // 제스처 위젯으로 두 번 클릭하면 삭제되게 만들었습니다.
                          onDoubleTap: () {
                            // 버튼같이 사용자 입력으로 이벤트가 처리되는 곳에서는 .read 로 접근해야합니다.
                            // 값을 수정하고 싶을때에는 .notifier로  추가 접근합니다.
                            ref
                                .read(booksProvider.notifier)
                                .removeBook(bookList[index]);
                          },
                          child: BookWidget(
                              title: bookList[index].title,
                              description: bookList[index].description),
                        );
                      },
                      itemCount: bookList.length,
                    ),
                  ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BookAddScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: const Text("책 추가 페이지 이동"),
            ),
          ],
        ),
      ),
    );
  }
}
