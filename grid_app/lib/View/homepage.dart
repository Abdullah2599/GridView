import 'package:flutter/material.dart';
import 'package:grid_app/View/grid_get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Shopping Hub', style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          
          ),),
          SizedBox(height: 10,),
          OutlinedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => GridGet(),));
          }, 
          child: Text('Discover'))
          ]
        ),
      );
    
  }
}