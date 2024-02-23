import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter/book_screen.dart';

void main() {
  runApp(const ProviderScope(
      child: MyApp())); //리버팟을 사용하기 위해 최상위루트 위젯을 ProviderScope 로 감쌈.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark, //다크모드설정
      darkTheme: ThemeData.dark(), //다크모드설정
      home: const BookScreen(),
    );
  }
}
