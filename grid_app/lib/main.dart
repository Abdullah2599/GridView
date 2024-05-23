import 'package:flutter/material.dart';
import 'package:grid_app/View/grid_view.dart';
import 'package:grid_app/View/homepage.dart';

void main() {
  runApp(MaterialApp(home:Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Hub',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag),
          ),
        ],
      ),
      body: Container(
        
        child: HomePage(),
      ),
    )));
}
