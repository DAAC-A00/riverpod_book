import 'package:flutter_riverpod/flutter_riverpod.dart';

// Rivierpod을 사용해 앱전체에서 데이터를 관리할 수 있는 provider를 생성하는 코드입니다.
// Riverpod은 전역으로 final provider를 생성하여도 아무 문제가 없습니다.
// StateNotifierProvider는 StateNotifier를 관리하는 전용 프로바이더 입니다.
final booksProvider =
    StateNotifierProvider<BookStateNotifier, List<Book>>((ref) {
  return BookStateNotifier();
});

// StateNotifier를 상속받고 제네릭엔 어떠한 상태를 관리할 것인지 적어준다. List형식으로 위에서만든 Book클래스의 인스턴스를 관리할 것 이므로 <List<Book>>
class BookStateNotifier extends StateNotifier<List<Book>> {
  // 빈 list를 넣어서 초기화 해주겠습니다.
  BookStateNotifier() : super([]);

  // state는 StateNorifier가 관리하고 있는 상태값이 들어 있습니다.
  // 즉 여기에서는 state = List<Book> 입니다.

  // StateNotifier는 notifier 안에서만 값을 수정할 수 있습니다.
  // -- StateNorifier의 사용 이유가 state가 변경되면 알려주기 위해서인데 .add나 .remove를 사용하면 해당 list객체 안에서 값을 추가하거나, 값을 지우기 때문에 state가 변경되지 않습니다.
  // -- 이러한 이유 때문에 addBook(), removeBook()을 이용해 새로운 list 객체를 넣어서 state가 변경되게 합니다.
  // ---- state는 StateNorifier가 관리하고 있는 상태값이 들어 있습니다. 즉 여기에서는 state = List<Book> 입니다.
  void addBook(Book newBook) {
    state = [...state, newBook];
  }

  void removeBook(Book removeBook) {
    state = state.where((book) => book != removeBook).toList();
  }
}

class Book {
  final String title;
  final String description;

  Book({required this.title, required this.description});
}
