import 'package:flutter/material.dart';
import 'package:flutter_generate_ai_stable_diffusion/main.dart';

class InputText extends StatelessWidget {
  const InputText({super.key, required this.onChanged});
  final ValueChanged<String> onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (value) {
        context.focusScope.unfocus();
      },
      onChanged: (value) => onChanged(value),
    );
  }
}
