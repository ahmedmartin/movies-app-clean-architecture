part of 'actor_bloc.dart';

@immutable
abstract class ActorEvent {}



class LoadActorEvent extends ActorEvent {
  final int actId;
  LoadActorEvent({required this.actId});
}