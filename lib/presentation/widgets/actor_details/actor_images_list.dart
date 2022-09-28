
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/utils/api_utils.dart';
import '../../../domain/entitites.dart/actor_entity.dart';




class ActorImagesList extends StatelessWidget{

  List<ActEntity> actors_list;

  ActorImagesList({Key? key, required this.actors_list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 11),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: actors_list.length,
        itemBuilder: (context, index) {
          final castEntity = actors_list[index];
          return Padding(
            padding: const EdgeInsets.only(right: 11),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white,width: 5),
                  ),
                  height: MediaQuery.of(context).size.width/.9,//350,
                  width: MediaQuery.of(context).size.width/.9,
                  margin: EdgeInsets.all(10),
                  //padding: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    // ignore: unnecessary_null_comparison
                    child: castEntity.filePath == null || castEntity.filePath.isEmpty
                        ? Image.network(
                      'https://www.helptechco.com/files/1215BP6.png',
                      fit: BoxFit.cover,
                    )
                        : Image.network(
                      ApiUrls.requestImage(
                        castEntity.filePath,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(11.0),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(10),
                //     child: Container(
                //       color: const Color(0xFF221029),
                //       height: 50,
                //       width: 100,
                //       child: Text(
                //         castEntity.name,
                //         textAlign: TextAlign.center,
                //         maxLines: 2,
                //         overflow: TextOverflow.ellipsis,
                //         style: const TextStyle(
                //           color: Colors.white,
                //           fontSize: 18,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}