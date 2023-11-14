// To parse this JSON data, do
//
//     final imageGeneratedApi = imageGeneratedApiFromJson(jsonString);

import 'dart:convert';

ImageGeneratedApi imageGeneratedApiFromJson(String str) =>
    ImageGeneratedApi.fromJson(json.decode(str));

String imageGeneratedApiToJson(ImageGeneratedApi data) =>
    json.encode(data.toJson());

class ImageGeneratedApi {
  List<String> images;

  ImageGeneratedApi({
    required this.images,
  });

  ImageGeneratedApi copyWith({
    List<String>? images,
  }) =>
      ImageGeneratedApi(
        images: images ?? this.images,
      );

  factory ImageGeneratedApi.fromJson(Map<String, dynamic> json) =>
      ImageGeneratedApi(
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
