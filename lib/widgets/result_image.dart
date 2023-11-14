import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_generate_ai_stable_diffusion/bloc/global_bloc.dart';

class ResultImage extends StatelessWidget {
  const ResultImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          color: Colors.grey,
          child: StreamBuilder<String>(
              stream: globalBloc.imageBase64Stream,
              builder: (context, snapshot) {
                String imageBase64 = snapshot.data ?? '';
                if (imageBase64.isEmpty) {
                  return Container();
                }
                final _bytesImage = Base64Decoder().convert(imageBase64);
                return Image.memory(_bytesImage);
              }),
        ),
      ),
    );
  }
}
