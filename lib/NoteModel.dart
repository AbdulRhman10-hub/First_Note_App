import 'package:first_note_app/HiveHelpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteModel extends StatefulWidget {
  const NoteModel({super.key});

  @override
  State<NoteModel> createState() => _NoteModelState();
}

class _NoteModelState extends State<NoteModel> {
  final _noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: Scaffold(
    appBar: AppBar(
    title: Text("Notes" , style: TextStyle(fontSize: 43 , fontWeight: FontWeight.bold),),
    actions: [
    Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
    color: Color(0xff3B3B3B),
    borderRadius: BorderRadius.circular(15),
    ),
    child: InkWell(
        onTap: (){
          HiveHelpers.clearAll();
          setState(() {

          });
        },
        child: Icon(Icons.delete , color: Colors.white, size: 24,)),
    ),
    )
    ],),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _noteController.text = "";
          showAlertDialog(context);
    },
      child: Icon( Icons.add , color: Colors.white,),
      backgroundColor: Color(0xff252525),
      shape: CircleBorder(),
    ),
      body: ListView.builder(
          itemCount: HiveHelpers.noteList.length,
          itemBuilder: (context,index) => Stack(
            children: [
               Container(
                width: double.infinity,
                  margin: EdgeInsets.all(16.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: index == 0 ? Color(0xffFFF599) : index %2 ==0 ? Color(0xff9EFFFF) : Color(0xffB69CFF) ,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text(HiveHelpers.noteList[index] , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.normal , color: Colors.black),)),
               ),
              Positioned(
                  top: 20,
                  right: 20,
                  child: InkWell(
                    onTap: (){
                      HiveHelpers.removeNote(index);
                      setState(() {

                      });
                    },
                      child: Icon( Icons.delete , size: 24,color: Colors.black,))

              ),
              Positioned(
                  top: 20,
                  right: 50,
                  child: InkWell(
                      onTap: (){
                        _noteController.text = HiveHelpers.noteList[index]; // will receive the new update
                        showAlertDialog(context, isEditing: true , index: index);
                      },
                      child: Icon( Icons.edit , size: 24,color: Colors.black,))

              ),
            ],
          ),
      ),
    ),
    );
  }
  showAlertDialog(BuildContext context,
      {bool? isEditing = false ,  int ? index}) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed:  () {
        Get.back();
      },
    );
    Widget addButton = TextButton(
      child: Text("Add"),
      onPressed:  () {
        if (_noteController.text.isNotEmpty) {
          if(isEditing!){
            HiveHelpers.updateNote(index!, _noteController.text) ; // replace your current text (noteList[index]) by the update (_noteController.text)
          }else
            {
              HiveHelpers.addNote(_noteController.text);
            }
          setState(() {});
          Get.back();
        }
      },

    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Add Your Note "),
      content: TextFormField(
        controller: _noteController,
      ),
      actions: [
        cancelButton,
        addButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
