import 'package:flutter/material.dart';

class AvilableSize extends StatefulWidget {
  final String size;
  const AvilableSize({super.key, required this.size});

  @override
  State<AvilableSize> createState() => _AvilableSizeState();
}

class _AvilableSizeState extends State<AvilableSize> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16.0),
        width: 40,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.red),
        ),
        child: Text(
          widget.size,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
