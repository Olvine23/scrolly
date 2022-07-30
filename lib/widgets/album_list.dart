import 'package:flutter/material.dart';
import 'package:scrolly/main.dart';
import 'dart:convert';

import 'package:scrolly/models/album.dart';
 

Widget album(dynamic data) {
  var statusCode = data[1];
  if (statusCode == 200) {
    final finalJson = json.decode(data[0]!);

    var allCast = finalJson.map((e) => Album.fromJson(e)).toList();

    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: allCast.length,
        itemBuilder: ((context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(allCast[index].title),
                )
          ],
        )));
  }

  return Text("Error");
}
