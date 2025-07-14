import 'package:equatable/equatable.dart';

class Breed extends Equatable {
  final String id;
  final String name;
  final String? origin;
  final String? temperament;
  final String? description;
  final String? imageUrl;

  const Breed({
    required this.id,
    required this.name,
    this.origin,
    this.temperament,
    this.description,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, origin, temperament, description, imageUrl];
}
