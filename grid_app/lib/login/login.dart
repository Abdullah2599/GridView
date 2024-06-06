import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grid_app/View/homepage.dart';
import 'package:grid_app/login/widgets/formfields.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
     final passController = TextEditingController();
  final emailController = TextEditingController();

 Future<void> _submitData () async{
  Map<String, dynamic> data ={
    "email" :emailController.text,
    "password": passController.text,
  };

   var response =await http.post(
    Uri.parse("http://localhost:82/api/login.php"),
    body: jsonEncode(data));

    var res = jsonDecode(response.body);
    if(response.statusCode ==200){
      print(res);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('error')));
    }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('Login'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Form(
            child: Card(
              elevation: 40,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetFormField(name: 'Name', controller: emailController, icon: Icons.email, obs: false),
                    const SizedBox(height: 10,),
                    GetFormField(name: 'Password', controller: passController, icon: Icons.password, obs: true),
                    const SizedBox(height: 10,),
                    MaterialButton(
                      onPressed: () {
                      _submitData();
                    },
                    child:const  Text('Login',style: TextStyle(
                      backgroundColor: Colors.white,
                    ),),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}