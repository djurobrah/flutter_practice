import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget {
  final String text;

  AddressTag(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(text),
    );
  }
}
