import 'package:equatable/equatable.dart';

class ActEntity extends Equatable{
  final double vote_average;
  final String filePath;
  final int vote_count;
  final double aspectRatio;
  final int height;
  final int width;

  const ActEntity({
    required this.vote_average,
    required this.filePath,
    required this.vote_count,
    required this.aspectRatio,
    required this.height,
    required this.width}
  );

  @override
  List<Object?> get props => [vote_average, filePath,vote_count];

}
