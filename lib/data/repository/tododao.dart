import 'package:to_do_app/sqlite/database_manager.dart';

import '../entity/todos.dart';

class ToDoRepository //tododao
{

  Future<void> register(String name) async {
    var db = await DatabaseManager.veritabaniErisim();

    var newToDo = Map<String, dynamic>();
    newToDo["name"] = name;

    await db.insert("toDo", newToDo);


  }

  Future<void> update(int id, String name) async {
    var db = await DatabaseManager.veritabaniErisim();

    var updatedToDo = Map<String, dynamic>();
    updatedToDo["name"] = name;

    await db.update("toDo", updatedToDo, where: "id=?", whereArgs: [id]);

  }

  Future<void> delete(int id) async {
    var db = await DatabaseManager.veritabaniErisim();

    await db.delete("toDo", where: "id=?", whereArgs: [id]);




  }


  Future<List<ToDos>> search(String searchKeyWord) async {

    var db = await DatabaseManager.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM toDo WHERE name like '%$searchKeyWord%'");

    return List.generate(maps.length, (index){
      var row = maps[index];
      var id = row["id"];
      var name = row["name"];
      return ToDos(id: id, name: name);
    });
  }


  Future<List<ToDos>> toDosLoading() async {

    var db = await DatabaseManager.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM toDo");

    return List.generate(maps.length, (index){
      var row = maps[index];
      var id = row["id"];
      var name = row["name"];
      return ToDos(id: id, name: name);
    });
  }





}