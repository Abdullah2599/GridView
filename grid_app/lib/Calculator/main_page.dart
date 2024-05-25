import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MianViewState();
}

class _MianViewState extends State<MainView> {
  final List<String> buttons = [
    '7',
    '8',
    '9',
    '+',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    'x',
    '0',
    '.',
    'C',
    '/',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 140,
            width: 70,
            color: Colors.amber,
            child: const Center(
              child: Text(
                "Text Goes Here",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 330,
            // width: 180,
            child: GridView.builder(
              itemCount: 16,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 8,
                childAspectRatio: 1.20,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    child: Center(
                      child: Text(
                        buttons[index],
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.red,
                    ),
                    height: 20,
                    width: 20,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
