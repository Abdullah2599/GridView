import 'package:flutter/material.dart';

class ProdDetails extends StatefulWidget {
  ProdDetails({super.key, required this.title,required this.price, required this.image});

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
      appBar: 
      AppBar(
        title: const Text('GridView',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Card(
               
                child: Column(
                  
                  children: [
                    
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.network(widget.image,height: 105,),
                    ),
                    const SizedBox(height: 5,),
                     SizedBox(
                      width: 100,
                      height: 35,
                      child: Text(
                        textAlign: TextAlign.left,
                        widget.title,
                        style: const TextStyle(fontSize: 10,
                        fontWeight: FontWeight.bold,
                          
                        ),
                        )), 
                       
                        Text(widget.price),
          ],
        ),
            )])
      ),
    );
  }
}