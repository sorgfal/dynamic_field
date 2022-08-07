import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MyField> fields = [];

  @override
  void dispose() {
    fields.forEach((element) {
      element.controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fields.add(MyField("поле №" + fields.length.toString()));
          setState(() {});
        },
      ),
      body: ListView.builder(
          itemCount: fields.length,
          itemBuilder: (ctx, index) {
            return Card(
              child: TextField(
                decoration: InputDecoration(hintText: fields[index].title),
                controller: fields[index].controller,
              ),
            );
          }),
    );
  }
}

class MyField {
  final String title;
  final TextEditingController controller = TextEditingController();

  MyField(this.title);
}
