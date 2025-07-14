import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/breed.dart';

part 'breed_model.g.dart';

@JsonSerializable()
class BreedModel extends Breed {
  BreedModel({
    required String id,
    required String name,
    String? origin,
    String? temperament,
    String? description,
    @JsonKey(name: 'image') ImageWrapper? image,
  }) : super(
          id: id,
          name: name,
          origin: origin,
          temperament: temperament,
          description: description,
          imageUrl: image?.url,
        );

  factory BreedModel.fromJson(Map<String, dynamic> json) => _$BreedModelFromJson(json);

  Map<String, dynamic> toJson() => _$BreedModelToJson(this);
}

@JsonSerializable()
class ImageWrapper {
  final String url;
  const ImageWrapper({required this.url});

  factory ImageWrapper.fromJson(Map<String, dynamic> json) => _$ImageWrapperFromJson(json);
  Map<String, dynamic> toJson() => _$ImageWrapperToJson(this);
}
