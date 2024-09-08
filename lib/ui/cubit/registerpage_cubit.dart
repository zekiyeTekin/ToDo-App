import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/repository/tododao.dart';

class RegisterPageCubit extends Cubit<void> {

  RegisterPageCubit() : super(0);
  var toDoRepo = ToDoRepository();

  Future<void> register(String name) async {
    await toDoRepo.register(name);


  }



}