

import 'package:app_example/domain/entitites.dart/actor_entity.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';

abstract class ActorRepository {

  Future<Either<Failure, List<ActEntity>>> getActorImages(int actID);
}