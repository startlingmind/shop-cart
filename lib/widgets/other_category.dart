import 'package:flutter/material.dart';

class OtherCategory extends StatelessWidget {
  const OtherCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: const SizedBox(
      width: 300,
      height: 300,
      child: Text('No results'),
    ));
  }
}
