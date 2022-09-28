



import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/repositories/actor_repository.dart';
import 'package:app_example/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../entitites.dart/actor_entity.dart';

class GetActImagesUsecase implements UseCase<ActEntity, int> {
  final ActorRepository repository;

  GetActImagesUsecase(this.repository);

  @override
  Future<Either<Failure, List<ActEntity>>> call(int actID) async {
    return await repository.getActorImages(actID);
  }


}