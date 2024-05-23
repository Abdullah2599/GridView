import 'package:flutter/material.dart';

class ProdDetails extends StatefulWidget {
  ProdDetails(
      {super.key,
      required this.title,
      required this.price,
      required this.image});

  final String title;
  final String price;
  final String image;

  @override
  State<ProdDetails> createState() => _ProdDetailsState();
}

class _ProdDetailsState extends State<ProdDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping Hub',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag),
          ),
        ],
      ),
      body: Container(
          child: Center(
        child: Column(children: [
          SizedBox(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      widget.image,
                      height: 300,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.price,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      )),
    );
  }
}
