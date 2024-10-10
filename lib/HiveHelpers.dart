import 'package:hive/hive.dart';

class HiveHelpers{
  static const notesBox = "notes";
  static var box = Hive.box(notesBox);
  static const key = "notesKey";

  static List<String> noteList = [];

  // ADD
  static void addNote(String text){
    noteList.add(text);
    box.put(key, noteList); // to update the box after adding the note
  }
  //GET
  static Future <void> getAllNotes() async{
    if(box.get(key) != null) // if the note have already notes show it
    noteList = await box.get(key); // to get all already notes at the app and will call it at starting of program
  }
  //REMOVE
  static void removeNote(int index){
    noteList.removeAt(index);
    box.put(key, noteList); // to update the box after removing the note
  }
  //CLEAR ALL
  static void clearAll(){
    noteList.clear();
    box.put(key, noteList); // to update the box after removing all notes
  }
  //UPDATE
  static void updateNote(int index , String text){
    noteList[index] = text;
    box.put(key, noteList); // to update the box after updating the note
  }
}