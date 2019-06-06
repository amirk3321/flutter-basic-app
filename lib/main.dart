import 'package:flutter/material.dart';
import 'package:flutter_baisc_app/dogCard.dart';
import 'package:flutter_baisc_app/dogList.dart';
import 'dogModel.dart';
import 'dogForm.dart';


void main() => runApp(myApp());


class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: "Basic Flutter App",
        theme: ThemeData(primarySwatch: Colors.purple),
        home: basicAppCompo(title: "Romi App",),
      );
  }//build
}//myApp

class basicAppCompo extends StatefulWidget{
  basicAppCompo({Key key,this.title});
  String title;
  @override
  State<StatefulWidget> createState() => basicAppCompoState();
}//end basicAppCompo

class basicAppCompoState extends State<basicAppCompo>{

  ListView _listView(){
    return ListView.builder(
        itemCount: DogList.ListDog.length,
        itemBuilder: (context,int){
      return DogCard(dog: DogList.ListDog[int]);
    });
  }
  //Action icon Activity
  Future _showDogForm() async{
    DogModel newDog=await Navigator.of(context)
        .push(MaterialPageRoute(
      builder: (BuildContext context){
        return DogForm();
      }
    ));

    if (newDog!=null){
      DogList.ListDog.add(newDog);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showDogForm,
          )
        ],
      ),
      body: Container(
        decoration:BoxDecoration(
          gradient:LinearGradient(

           colors: [Colors.grey[100],Colors.grey[300],Colors.grey[100]]
          ),
        ),
        child: Center(child: _listView()),
      ),
    );
  }//end build
}//end basicAppCompoState

