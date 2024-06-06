import 'package:flutter/material.dart';

class GetFormField extends StatelessWidget {
  const GetFormField({super.key, required this.name, required this.controller, required this.icon, required this.obs});

final String name;
 final bool obs;
 final TextEditingController controller;
 final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obs,
      controller: controller,
      decoration: InputDecoration(
        labelText: name,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        )
      ),
    );
  }
}