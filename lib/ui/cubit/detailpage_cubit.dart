import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/repository/tododao.dart';

class DetailPageCubit extends Cubit<void>{

  DetailPageCubit() : super(0);
  var toDoRepo = ToDoRepository();


  Future<void> update(int id, String name) async {
    await toDoRepo.update(id, name);

  }

}