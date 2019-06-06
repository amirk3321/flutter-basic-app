import 'package:flutter/material.dart';
import 'dogModel.dart';
import 'dart:math';

class DogDetails extends StatefulWidget {
  DogDetails({this.dog});

  DogModel dog;

  @override
  State<StatefulWidget> createState() => DogDetailsState();
}

class DogDetailsState extends State<DogDetails> {
  Widget get dogImage {
    return Container(
      height: 150.0,
      width: 150.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(widget.dog.imageUri ?? ''))),
    );
  }

  var colorRnd = Random();
  var color = 300;

  Widget get rating {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.star,
            size: 50,
            color: Colors.deepOrange,
          ),
          Text(
            "${widget.dog.rating} / 15",
            style: Theme.of(context).textTheme.display1,
          )
        ],
      ),
    );
  }

  var _reating = 10.0;

  Widget get addReating {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 56.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Slider(
                  min: 0,
                  max: 15.0,
                  activeColor: Colors.indigo[400],
                  onChanged: (newReating) =>
                      {setState(() => _reating = newReating)},
                  value: _reating,
                ),
              ),
              Container(
                child: Text("${_reating.toInt()}"),
              ),
            ],
          ),
        ),
        submitReatingButton
      ],
    );
  }

  //change rating value
  void onChangeValue() {
    setState(() => widget.dog.rating = _reating.toInt()
    );
  }

  Widget get submitReatingButton {
    return RaisedButton(
      onPressed: onChangeValue,
      color: Colors.indigo,
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "submit",
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget get dogProfile {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Colors.grey[100],
            Colors.grey[200],
            Colors.grey[350],
          ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          dogImage,
          Text(
            "${widget.dog.name}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "${widget.dog.description} , ${widget.dog.location}",
            style: TextStyle(fontSize: 20),
          ),
          rating,
          addReating
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.dog.name}"),
        ),
        body: dogProfile);
  }
}
