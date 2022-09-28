
import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/data/datasources/actor_remote_datasource.dart';
import 'package:app_example/data/models/actor_images_model.dart';
import 'package:app_example/domain/entitites.dart/actor_entity.dart';
import 'package:app_example/domain/repositories/actor_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/exceptions.dart';




class ActorRepositoryImplementation implements ActorRepository{

  final ActorRemoteDataSource remoteDataSource;

  ActorRepositoryImplementation(this.remoteDataSource);

  @override
  Future<Either<Failure, List<ActEntity>>> getActorImages(int actID)async {
    try {
      final allActImages = await remoteDataSource.getActImages(actID);
      return Right(allActImages.profiles!);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

