import 'package:flutter/material.dart';

import '../../home/home_page.dart';

class Note extends StatelessWidget {
  final Task task;
  final Function(bool) onChanged;
  const Note({Key? key, required this.task, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Checkbox(
                shape: const CircleBorder(),
                value: task['value'],
                onChanged: (value) {
                  if (value != null) {
                    onChanged(value);
                  }
                }),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task['title'],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    task['subtitle'],
                    style: const TextStyle(fontSize: 13),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
