import 'package:flutter/material.dart';
import 'dogModel.dart';

class DogForm extends StatefulWidget {
//  DogForm({this.nameController,this.locationController,this.descriptionController})
  @override
  State<StatefulWidget> createState() => DogFormState();
}

class DogFormState extends State<DogForm> {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();

  void onSubmitPop() {
    if (nameController.text.isEmpty) {
      onSnackbar();
      return;
    }

    if (locationController.text.isEmpty) {
      onSnackbar();
      return;
    }
    if (descriptionController.text.isEmpty) {
      onSnackbar();
      return;
    }

    var newDog = DogModel(
        name: nameController.text,
        location: locationController.text,
        description: descriptionController.text);
    Navigator.of(context).maybePop(newDog);
  }

  void onSnackbar() {
    Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text("empty filed please fil")));
  }

  Widget onForm() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              //onChanged: (v)=> nameController.text=v,
              decoration: InputDecoration(labelText: "Name of the dog"),
            ),
            TextField(
              controller: locationController,
              //onChanged: (v)=>locationController.text=v,
              decoration: InputDecoration(labelText: "Location of the dog"),
            ),
            TextField(
              controller: descriptionController,
              textDirection: TextDirection.ltr,
              //  onChanged: (v)=>descriptionController.text=v,
              decoration: InputDecoration(labelText: "Location of the dog"),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Builder(builder: (BuildContext context) {
                return RaisedButton(
                  onPressed: () {
                    onSubmitPop();
                    print("click on pressed");
                  },
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "Submit pup",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  textColor: Colors.white,
                  color: Colors.indigo,
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog Form"),
      ),
      body: onForm(),
    );
  }
}
