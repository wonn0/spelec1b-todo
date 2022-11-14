import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController textFieldController = TextEditingController();
  //list of todo items
  List<String> todos = [];

  void handleSubmit(String s) {
    if (s.isEmpty) {
      return;
    }
    setState(() {
      todos.add(textFieldController.text);
    });
    textFieldController.text = '';
  }
  
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Todo List"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            TextField(
              controller: textFieldController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Input something to do...",
              )
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {handleSubmit(textFieldController.text);}, 
              child: const Text('Add Todo')
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: SizedBox(
                height: 300.0,
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: const FlutterLogo(),
                        title: Text(todos[index]),
                      )
                    );
                  },
                )
              ),
            ),
          ],
        )
      )
    );
  }
}