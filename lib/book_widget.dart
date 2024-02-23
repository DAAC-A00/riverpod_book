import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  final String title;
  final String description;

  const BookWidget({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const Icon(Icons.book_rounded),
          const SizedBox(
            width: 16,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title\n",
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: description,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
