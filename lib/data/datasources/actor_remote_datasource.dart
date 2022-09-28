import 'package:app_example/core/errors/exceptions.dart';
import 'package:app_example/core/http_client/http_client.dart';
import 'package:app_example/core/utils/api_utils.dart';
import 'package:app_example/data/models/actor_images_model.dart';
import 'package:app_example/data/models/genre_list_model.dart';
import 'package:dio/dio.dart';

abstract class ActorRemoteDataSource {
  Future<ActorImagesModel> getActImages(int id);
}

class ActorRemoteDatasourceImplementation implements ActorRemoteDataSource {
  final HttpClient client;

  ActorRemoteDatasourceImplementation(this.client);

  @override
  Future<ActorImagesModel> getActImages(int id) async {
    Response response = await client.get(ApiUrls.ActorImages(id));
    final actImageList = ActorImagesModel.fromMap(response.data);
    //print(genresList.genres);
    if (response.statusCode == 200) {
      return actImageList;
    } else {
      throw const ServerException('Something went wrong!');
    }
  }
}