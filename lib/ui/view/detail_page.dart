import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/entity/todos.dart';
import 'package:to_do_app/ui/colors.dart';
import 'package:to_do_app/ui/cubit/detailpage_cubit.dart';

class DetailPage extends StatefulWidget {

  ToDos toDos;

  DetailPage({required this.toDos});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  var tfName = TextEditingController();

  @override
  void initState() {
    super.initState();
    var toDo = widget.toDos;
    tfName.text = toDo.name;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detay Sayfa", style: TextStyle(color: yaziRenk, fontFamily: "Pacifico", fontSize: 30),),
        backgroundColor: renk3,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Text("${widget.toDos.id} - ${widget.toDos.name}"),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(controller: tfName, decoration: const InputDecoration(hintText: "Yapılacak Gir.."),),
            ),
            SizedBox(width: 200, height: 50,
              child: ElevatedButton(onPressed: (){
                context.read<DetailPageCubit>().update(widget.toDos.id,tfName.text);


              }, child: Text("GUNCELLE", style: TextStyle(color: yaziRenk),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: renk1
                ),
                  ),
            )

          ],
        ),
      ),
    );
  }
}
