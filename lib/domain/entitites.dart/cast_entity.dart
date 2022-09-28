import 'package:equatable/equatable.dart';

class CastEntity extends Equatable {
  final String creditId;
  final String name;
  final String? posterPath;
  final String character;
  final int castId;
  final int id;

  const CastEntity({
    required this.creditId,
    required this.name,
    this.posterPath,
    required this.character,
    required this.castId,
    required this.id,
  });

  @override
  List<Object?> get props => [creditId, name, posterPath, character];

  @override
  bool get stringify => true;
}
