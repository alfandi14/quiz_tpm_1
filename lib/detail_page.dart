import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'coffee_menu.dart';

class DetailPage extends StatefulWidget {
  final CoffeeMenu dataCoffee;

  const DetailPage({
    Key? key,
    required this.dataCoffee,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Page ${widget.dataCoffee.name}"),
            // automaticallyImplyLeading: false,
          ),
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("${widget.dataCoffee.name}", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                        widget.dataCoffee.imageUrls[0],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        widget.dataCoffee.imageUrls[1],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        widget.dataCoffee.imageUrls[2],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Container( //apply margin and padding using Container Widget.
                    padding: EdgeInsets.all(20), //You can use EdgeInsets like above
                    margin: EdgeInsets.all(5),
                    child: Text("Description: ${widget.dataCoffee.description}"),
                  ),
                  Text("Price: ${widget.dataCoffee.price}"),
                  Text("Ingredient: ${widget.dataCoffee.ingredients}"),
                  Text("Nutrition: ${widget.dataCoffee.nutrition}"),
                  Text("Review Average: ${widget.dataCoffee.reviewAverage}"),
                  Text("Review Count: ${widget.dataCoffee.reviewCount}"),
                  ElevatedButton(
                    onPressed: () {
                      _launchURL(widget.dataCoffee.linkStore);
                    },
                    child: Text("Go to Starbucks Web Page"),
                  )
                ],
              )
          )
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
