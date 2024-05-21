import 'package:flutter/material.dart';
import 'package:grid_app/View/grid_get.dart';
import 'package:grid_app/Model/grid_list.dart';

class GridViews extends StatefulWidget {
  const GridViews({super.key});

  @override
  State<GridViews> createState() => _GridViewsState();
}

class _GridViewsState extends State<GridViews> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
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
        child: GridGet(),
      ),
    );
  }
}
