part of 'actor_bloc.dart';

@immutable
abstract class ActorState {}

class ActorInitial extends ActorState {}

class ActLoading extends ActorState {
  ActLoading();

}

class ActLoaded extends ActorState {
  final List<ActEntity> casts;

  ActLoaded({required this.casts});

}

class ActError extends ActorState {
  final String message;

  ActError(this.message);

}
