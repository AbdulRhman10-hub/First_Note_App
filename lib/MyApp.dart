import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'NoteModel.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Notes" , style: TextStyle(fontSize: 43 , fontWeight: FontWeight.bold),),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.to(NoteModel());
          },
          child: Icon( CupertinoIcons.arrow_right , color: Colors.white,),
          backgroundColor: Color(0xff252525),
          shape: CircleBorder(),
        ),
          body: Center(
            child: Column(
              children: [
                SizedBox(height: 150,),
                Image.asset("assets/rafiki.png" , width: 350, height: 286.73,) ,
                SizedBox(height: 10,),
                Text("Create your first note !" , style: TextStyle(fontSize: 20),),

              ],
            ),
          )
        ),
      );
  }
}

