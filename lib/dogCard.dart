import 'package:flutter_baisc_app/dogModel.dart';
import 'package:flutter/material.dart';
import 'dogDetails.dart';

class DogCard extends StatefulWidget {
  DogCard({this.dog}); //constructor of DogCard

  final DogModel dog; //reference of DogModel class

  @override
  State<StatefulWidget> createState() => DogCardState();
} //end DogCard

class DogCardState extends State<DogCard> {
  // A class property that represents the URL flutter will render
// from the Dog class.
  String ImageRender;

  dogDetailsPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return DogDetails(dog: widget.dog);
    }));
  }

  Widget get dogCard {
    return Container(
      width: 300,
      height: 115.0,
      child: Card(
        color: Colors.grey[400],
        child: Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 64.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.dog.name,
                  style: Theme.of(context).textTheme.headline),
              Text("${widget.dog.description} , ${widget.dog.location}",
                  style: Theme.of(context).textTheme.subhead),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.deepOrange,
                  ),
                  Text(": ${widget.dog.rating} / 15"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  } //end dogCard

  //DogImage getter return Widget for Image
  Widget get dogImage {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black38,
              offset: Offset(5, 15.0),
              spreadRadius: 2,
              blurRadius: 15)
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          // ImageProviders (such as NetworkImage) are ideal
          // when your image needs to be loaded or can change.
          image: NetworkImage(ImageRender ??
              'https://thecontemporarypet.com/wp-content/themes/contemporarypet/images/default.png'),
        ),
      ),
    );
  } //end dogImage

  @override
  void initState() {
    dogRenderPic();
    super.initState();
  }

//we'd want the Dog class itself to get the image
  void dogRenderPic() async {
    // this makes the service call
    await widget.dog.getImageUrl();

    if (mounted) {
      // Avoid calling `setState` if the widget is no longer in the widget tree.
      setState(() {
        ImageRender = widget.dog.imageUri;
      });
    }
  } //end dogRanderPic

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: dogDetailsPage,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
        child: Container(
          height: 115.0,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                child: dogCard,
                left: 50.0,
              ),
              Positioned(
                child: dogImage,
                top: 7.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
