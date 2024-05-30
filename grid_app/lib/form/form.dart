import 'package:flutter/material.dart';


// final GlobalKey<bool>;

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final nameController = TextEditingController();
  final passController = TextEditingController();
  GlobalKey<FormState> form_key =GlobalKey<FormState>();

void _onSubmit(){
if(form_key.currentState!.validate()){
    print(nameController.text);
    print(passController.value);

}
  


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
        title: Text("Form Sample"),
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),
                     
                      ),
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Name',
                    ),
                    ),
                 ),
                  SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    obscureText: passwordVisible,
                    controller: passController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if(nameController.text.isEmpty){
                           return 'Name is Required';
                        }
                        else{
                          null;
                        }
                    },
                    decoration: const InputDecoration(
                         
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: IconButton(
                      icon: _buildVisibilityIcon,
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
                  TextButton(
                    
                    onPressed: _onSubmit, 
                    child: const Text("Submit"))
              ],

            ),
          ),
        ),
      ),
    );
  }
}