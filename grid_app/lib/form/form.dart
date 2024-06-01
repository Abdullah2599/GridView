import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final emailController = TextEditingController();

  GlobalKey<FormState> form_key =GlobalKey<FormState>();





Future<void> _onSubmit() async{
if(form_key.currentState!.validate()){



    Map<String, dynamic> data={
      "name": nameController.text,
      "email":  emailController.text,
      "password": passController.text
    };

    var response =await http.post(
      Uri.parse("http://localhost:82/api/addData.php"),
      body: jsonEncode(data));


    if(response.statusCode == 200){

      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Success'),
                content: const Text(
                    'Details Submitted...'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text('Okay'))
                ],
              ));
      print(response.body);
    }
    nameController.clear();
    emailController.clear();
    passController.clear();
    
}
}

void subm(){
  _onSubmit();
}

  @override
  void dispose() {
    nameController.dispose();
    passController.dispose();
    
    super.dispose();
  }

bool passwordVisible=false;

  @override 
    void initState(){ 
      super.initState(); 
      passwordVisible=true; 
    }     
 
 Icon _buildVisibilityIcon() {
  return Icon(
    passwordVisible 
      ? Icons.visibility
      : Icons.visibility_off,
  );
}
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Sample"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: form_key,
            child: Column(
              children: [
                 Padding(
                  
                   padding: const EdgeInsets.all(8.0),
                   child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if(nameController.text.isEmpty){
                           return 'Name is Required';
                        }
                        else{
                          null;
                        }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),
                     
                      ),
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Name',
                    ),
                    ),
                 ),
                 const SizedBox(height: 12,),
                 Padding(
                  
                   padding: const EdgeInsets.all(8.0),
                   child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if(emailController.text.isEmpty){
                           return 'Email is Required';
                        }
                        else{
                          null;
                        }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),
                     
                      ),
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                    ),
                    ),
                 ),
                  const SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    obscureText: passwordVisible,
                    controller: passController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if(passController.text.isEmpty){
                           return 'Password is Required';
                        }
                        else{
                          null;
                        }
                    },
                    decoration: InputDecoration(
                         
                    border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.person),
                    suffixIcon: IconButton(
                      icon: _buildVisibilityIcon(),
                       onPressed: () {
                         setState(
                           () {
                            
                             passwordVisible = !passwordVisible;
                           }
                         );
                       }
                         ),
                    ),
                    
                    ),
                  ),
                  const SizedBox(height: 20,),
                  OutlinedButton(
                    style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 0, 0, 0))),
                    onPressed: subm, 
                    
                    child: const Text("Submit",style: TextStyle(color: Colors.white),))
              ],

            ),
          ),
        ),
      ),
    );
  }
}