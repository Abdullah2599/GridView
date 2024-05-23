import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grid_app/Model/grid_list.dart';
import 'package:http/http.dart' as http;

class GridGet extends StatefulWidget {
  const GridGet({
    super.key,
  });

  @override
  State<GridGet> createState() => _GridGetState();
}

class _GridGetState extends State<GridGet> {



List<dynamic> prodData=[];
Future<void> getData() async {
  var response =
  await http.get(Uri.parse("https://fakestoreapi.com/products"),);

  List<dynamic> data= jsonDecode(response.body);


  setState((){
    prodData=data;
  });
}

@override
void initState(){
  getData();
  super.initState();
}

  

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      
      itemCount: prodData.length,
      itemBuilder: (context, index) {
        return Card(
           
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(prodData[index]["image"],height: 105,),
                ),
                SizedBox(height: 5,),
                 SizedBox(
                  width: 100,
                  height: 35,
                  child: Text(
                    textAlign: TextAlign.left,
                    prodData[index]["title"],
                    style: const TextStyle(fontSize: 10,
                    fontWeight: FontWeight.bold,
                      
                    ),
                    )), 
                   
                    Text("\$${prodData[index]["price"].toString()}"),

                    SizedBox(
              width: 180,
              height: 30,
              child: ElevatedButton(
                style: const ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.black)),
                onPressed: (){},
                child: const Text('Add To Cart',
                style: TextStyle(
                  color: Colors.white,
                ),
                )
                
                ),
            )
              ],
            ),
          
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
    );
  }
}
