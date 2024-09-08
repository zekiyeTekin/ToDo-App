import '../entity/todos.dart';

class ToDoRepository //tododao
{

  Future<void> register(String name) async {
    print("Kayıt: $name");

  }

  Future<void> update(int id, String name) async {
    print("Guncelle: $id - $name");
  }

  Future<void> delete(int id) async {
    print("sil : $id ");
  }


  Future<List<ToDos>> search(String searchKeyWord) async {

    var toDosList = <ToDos>[];
    var toDo1 = ToDos(id: 1, name: "hasan");
    toDosList.add(toDo1);

    return toDosList;
  }


  Future<List<ToDos>> toDosLoading() async {
    var toDosList = <ToDos>[];

    var toDo1 = ToDos(id: 1, name: "hasan");
    var toDo2 = ToDos(id: 2, name: "zekiye");
    var toDo3 = ToDos(id: 3, name: "hasanZekiye");

    toDosList.add(toDo1);
    toDosList.add(toDo2);
    toDosList.add(toDo3);

    return toDosList;
  }





}