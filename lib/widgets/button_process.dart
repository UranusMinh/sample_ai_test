import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonProcess extends StatelessWidget {
  const ButtonProcess({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: Theme.of(context).colorScheme.secondary,
      child: Text('Generate image by AI'),
      onPressed: () => onPressed(),
    );
  }
}
