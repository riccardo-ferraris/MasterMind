import 'package:flutter/material.dart';

class RightChoicesRow extends StatefulWidget {
  const RightChoicesRow(
      {super.key,
      required this.rightNumbersAtRightPosition,
      required this.rightNumbers});

  final String rightNumbersAtRightPosition;
  final String rightNumbers;

  @override
  State<RightChoicesRow> createState() => _RightChoicesRowState();
}

class _RightChoicesRowState extends State<RightChoicesRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              widget.rightNumbers,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              widget.rightNumbersAtRightPosition,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
