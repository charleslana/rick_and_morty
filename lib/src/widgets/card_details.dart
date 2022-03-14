import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({
    Key? key,
    required this.title,
    required this.description,
    this.isTitleUnderline = false,
  }) : super(key: key);

  final String title;
  final String description;
  final bool isTitleUnderline;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                decoration: isTitleUnderline
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
            ),
            const SizedBox(
              width: 10,
              child: Text(':'),
            ),
            Text(description),
          ],
        ),
      ),
    );
  }
}
