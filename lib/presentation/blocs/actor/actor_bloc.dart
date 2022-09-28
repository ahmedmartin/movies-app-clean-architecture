import 'dart:async';

import 'package:app_example/domain/usecases/get_act_images_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entitites.dart/actor_entity.dart';

part 'actor_event.dart';
part 'actor_state.dart';

class ActorBloc extends Bloc<ActorEvent, ActorState> {

  final GetActImagesUsecase getActUsecase;

  ActorBloc(this.getActUsecase) : super(ActorInitial()) {
    on<LoadActorEvent>(getAct);
  }

    Future<void> getAct(event, emit) async {
      emit(ActLoading());
      var getActImages = await getActUsecase.call(event.actId);
      getActImages.fold(
            (failure) => emit(ActError('Something went wrong!')),
            (success) => emit(
          ActLoaded(casts: success),
        ),
      );
    }
}
