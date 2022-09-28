
import 'package:app_example/presentation/blocs/actor/actor_bloc.dart';
import 'package:app_example/presentation/widgets/actor_details/actor_images_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../widgets/actor_details/actor_detail_arguments.dart';




class Actor_details extends StatelessWidget{

  final ActorDetailArguments actorDetailArguments;

  Actor_details({Key? key, required this.actorDetailArguments}) : super(key: key);

  var actBloc = Modular.get<ActorBloc>();



  @override
  Widget build(BuildContext context) {

    actBloc.add(LoadActorEvent(actId:actorDetailArguments.ActId));
    return Scaffold(
      appBar: AppBar(
        title: Text(actorDetailArguments.ActName,style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: BlocBuilder<ActorBloc,ActorState>(
        bloc: actBloc,
        builder: (context,state){
          if(state is ActLoading){
            return Center(child: CircularProgressIndicator());
          }else if(state is ActLoaded){
            return ActorImagesList(actors_list: state.casts);
          }else if (state is ActError){
            return Center(child: Text("${state.message}",style: TextStyle(color: Colors.white,fontSize: 40),));
          }
          return Container();
        },
      ),
    );
  }
}