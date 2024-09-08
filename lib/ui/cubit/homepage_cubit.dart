import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/entity/todos.dart';
import 'package:to_do_app/data/repository/tododao.dart';

class HomepageCubit extends Cubit<List<ToDos>> {

  HomepageCubit() : super(<ToDos>[]);

  var toDoRepo = ToDoRepository();


//cubit dosyalarında void olmalı return değeri döndürmeyecektir
  Future<void> toDosLoading() async {

    var list = await toDoRepo.toDosLoading();
    emit(list); // Tetikleme
  }


  Future<void> search(String searchKeyWord) async {
    var list = await toDoRepo.search(searchKeyWord);
    emit(list);

  }


  Future<void> delete(int id) async {
    await toDoRepo.delete(id);
    toDosLoading();
  }

}