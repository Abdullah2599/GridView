import 'package:flutter/material.dart';
import 'package:grid_app/Model/grid_list.dart';

class GridGet extends StatefulWidget {
  const GridGet({super.key,});


  @override
  State<GridGet> createState() => _GridGetState();
}

class _GridGetState extends State<GridGet> {
  @override
  Widget build(BuildContext context) {
  


    return GridView.builder(
      itemCount: get.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(10)),
                  child: Image.network(get[index].link),
                  
                ),
                Padding(padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(get[index].name),Text(get[index].price)],
                ),
                
                )
              ],
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.1,),
        
      );
    
    
  }
}