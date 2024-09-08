import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/ui/colors.dart';
import 'package:to_do_app/ui/cubit/registerpage_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  var tfName = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page", style: TextStyle(color: yaziRenk, fontFamily: "Pacifico", fontSize: 30),),
        centerTitle: true,
        backgroundColor: renk3,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                controller: tfName,
                decoration: const InputDecoration(hintText: "Yapılacaklar.."),

              ),
            ),
            SizedBox( width: 200, height: 50,
              child: ElevatedButton(onPressed: (){
                context.read<RegisterPageCubit>().register(tfName.text);


              },  child: Text("KAYDET", style: TextStyle(color: yaziRenk),),
              style: ElevatedButton.styleFrom(
                backgroundColor: renk1
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
