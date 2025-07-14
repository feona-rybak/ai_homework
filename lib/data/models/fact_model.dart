import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/fact.dart';

part 'fact_model.g.dart';

@JsonSerializable()
class FactModel extends Fact {
  @JsonKey(name: 'fact')
  final String text;

  FactModel({required this.text}) : super(text);

  factory FactModel.fromJson(Map<String, dynamic> json) => _$FactModelFromJson(json);
  Map<String, dynamic> toJson() => _$FactModelToJson(this);
}
