import 'package:dio/dio.dart';
import 'package:flutter_generate_ai_stable_diffusion/bloc/generated_image_api_response.dart';
import 'package:rxdart/subjects.dart';
import 'package:collection/collection.dart';

final GlobalBloc globalBloc = GlobalBloc();

class GlobalBloc {
  BehaviorSubject<String> imageBase64Stream =
      BehaviorSubject<String>.seeded('');
  BehaviorSubject<bool> isLoadingStream = BehaviorSubject<bool>.seeded(false);
  final dio = Dio();
  generateImage(String propmt) async {
    isLoadingStream.add(true);
    imageBase64Stream.add('');
    final response = await dio.post(
      'http://sditify.ddns.net:7001/sdapi/v1/txt2img',
      options: Options(
        responseType: ResponseType.plain,
      ),
      data: <String, String>{
        'prompt': propmt,
        'negative_prompt': '',
      },
    );
    final imageResult = imageGeneratedApiFromJson(response.data);
    final imageGeneratedBase64 = imageResult.images.firstOrNull;
    if (imageGeneratedBase64 != null) {
      imageBase64Stream.add(imageGeneratedBase64);
    }
    isLoadingStream.add(false);
  }
}
