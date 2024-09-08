import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/entity/todos.dart';
import 'package:to_do_app/ui/colors.dart';
import 'package:to_do_app/ui/cubit/homepage_cubit.dart';
import 'package:to_do_app/ui/view/detail_page.dart';
import 'package:to_do_app/ui/view/register_page.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {


  //var tfSearch = TextEditingController();




  @override
  void initState() {
    super.initState();
    //Uygulama çalıştığında 1 kez çalışacaktır.
    context.read<HomepageCubit>().toDosLoading();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ToDo",style: TextStyle(color: yaziRenk, fontFamily: "Pacifico", fontSize: 30 ),),
      backgroundColor: renk3,
        centerTitle: true,

      ),
      //burada geri döndüğünü algılasın diye kodlanacak
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()))
            .then((value) {
             context.read<HomepageCubit>().toDosLoading();
            });
            
          },
        child: const Icon(Icons.add),
        backgroundColor: renk3,
          ),
      
      
      body: Center(
        child: Column(
          //row, column,stack, center,spaceEvenly
         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.center, //sol taraf hizalar
          children: [

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CupertinoSearchTextField(
                  placeholder: "Ara",
                  //controller: tfSearch,
                  onChanged: (searchText){
                    context.read<HomepageCubit>().search(searchText);

                  },
                ),
              ),


              BlocBuilder<HomepageCubit, List<ToDos>>(
                builder: (context, toDosList){
                  if(toDosList.isNotEmpty){
                    return Expanded(
                      child: ListView.builder(
                          itemCount: toDosList.length,
                        itemBuilder: (context, indeks){
                            var toDo = toDosList[indeks];
                            //Text("Merhaba, $indeks - ${toDo.name}")
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(toDos: toDo)))
                                .then((value){
                                  context.read<HomepageCubit>().toDosLoading();
                                });
                                //print("tıklandı: ${toDo.name}");
                              },
                              child: Card(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(toDo.name, style: TextStyle(fontSize: 24, color: yaziRenk1),),
                                    ),
                                    const Spacer(),
                                    IconButton(onPressed: (){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                         SnackBar(
                                           backgroundColor: renk1,
                                           content: Text("${toDo.name} silmek istediğinize emin misiniz?", style: TextStyle(color: yaziRenk),),
                                           action: SnackBarAction(label: "Evet",textColor: yaziRenk, onPressed: (){
                                             context.read<HomepageCubit>().delete(toDo.id);

                                           },),
                                         )
                                      );
                                    }, icon: Icon(Icons.clear, color: renk3,)),
                                  ],
                                ),
                              ),
                            );
                        },
                      ),
                    );

                  }else{
                    return const Center();
                  }
                },
              ),

            //Container(width: 100, height: 100,color: Colors.red,),

            //ElevatedButton(onPressed: (){
              //var toDo = ToDos(id: 1, name: "Doga");
            //  Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(toDos: toDo)));
           // }, child: const Text("DETAY")),

          ],
        ),

      ),
    );
  }
}

