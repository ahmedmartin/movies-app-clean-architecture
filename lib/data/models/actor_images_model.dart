import 'package:app_example/domain/entitites.dart/actor_entity.dart';
import 'package:equatable/equatable.dart';

class ActorImagesModel {
  int? _id;
  List<Profiles>? _profiles;

  ActorImagesModel({int? id, List<Profiles>? profiles}) {
    if (id != null) {
      this._id = id;
    }
    if (profiles != null) {
      this._profiles = profiles;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  List<Profiles>? get profiles => _profiles;
  set profiles(List<Profiles>? profiles) => _profiles = profiles;

  // ActorImagesModel.fromJson(Map<String, dynamic> json) {
  //   _id = json['id'];
  //   if (json['profiles'] != null) {
  //     _profiles = <Profiles>[];
  //     json['profiles'].forEach((v) {
  //       _profiles!.add(new Profiles.fromJson(v));
  //     });
  //   }
  // }

  factory ActorImagesModel.fromMap(Map<String, dynamic> json) => ActorImagesModel(
    id: json["id"] ?? 1,
    profiles:(json['profiles'] as List).map((x) =>Profiles.fromJson(x)).toList(),
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._profiles != null) {
      data['profiles'] = this._profiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object> get props => [id!, profiles!];
}

// class Profiles extends ActEntity{
//   double? aspectRatio;
//   int? height;
//   String? filePath;
//   double? voteAverage;
//   int? voteCount;
//   int? width;
//
//   Profiles(
//         this.aspectRatio,
//         this.height,
//         this.filePath,
//         this.voteAverage,
//         this.voteCount,
//         this.width) : super(0, '', 0, 0.0, 0, 0){
//     // if (aspectRatio != null) {
//     //   this.aspectRatio = aspectRatio;
//     // }
//     // if (height != null) {
//     //   this.height = height;
//     // }
//     // if (filePath != null) {
//     //   this.filePath = filePath;
//     // }
//     // if (voteAverage != null) {
//     //   this.voteAverage = voteAverage;
//     // }
//     // if (voteCount != null) {
//     //   this.voteCount = voteCount;
//     // }
//     // if (width != null) {
//     //   this.width = width;
//     // }
//   }
//
//   // double get aspectRatio => aspectRatio;
//   // set aspectRatio(double? aspectRatio) => aspectRatio = aspectRatio;
//   // int? get height => height;
//   // set height(int? height) => height = height;
//   // String? get filePath => _filePath;
//   // set filePath(String? filePath) => _filePath = filePath;
//   // double? get voteAverage => _voteAverage;
//   // set voteAverage(double? voteAverage) => _voteAverage = voteAverage;
//   // int? get voteCount => _voteCount;
//   // set voteCount(int? voteCount) => _voteCount = voteCount;
//   // int? get width => _width;
//   // set width(int? width) => _width = width;
//
//   Profiles.fromJson(Map<String, dynamic> json): super(0, '', 0, 0.0, 0, 0) {
//     aspectRatio = json['aspect_ratio'];
//     height = json['height'];
//     filePath = json['file_path'];
//     voteAverage = json['vote_average'];
//     voteCount = json['vote_count'];
//     width = json['width'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['aspect_ratio'] = this.aspectRatio;
//     data['height'] = this.height;
//     data['file_path'] = this.filePath;
//     data['vote_average'] = this.voteAverage;
//     data['vote_count'] = this.voteCount;
//     data['width'] = this.width;
//     return data;
//   }
// }

class Profiles extends ActEntity{
  const Profiles({required double vote_average, required String filePath, required int vote_count,
    required double aspectRatio, required int height, required int width})
      : super(vote_average: vote_average, filePath: filePath, vote_count: vote_count, aspectRatio: aspectRatio,
      height: height, width: width);

  factory Profiles.fromJson(Map<String, dynamic> json){

    return Profiles(vote_average: json['vote_average'], filePath: json['file_path'],
        vote_count: json['vote_count'], aspectRatio: json['aspect_ratio'],
        height: json['height'], width: json['width']);
  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aspect_ratio'] = aspectRatio;
    data['height'] = height;
    data['file_path'] = filePath;
    data['vote_average'] = vote_average;
    data['vote_count'] = vote_count;
    data['width'] = width;
    return data;
  }
}
