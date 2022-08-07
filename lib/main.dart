// ignore_for_file: public_member_api_docs, sort_constructors_first
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
              child: Row(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: fields[index].title),
                    controller: fields[index].controller,
                  ),
                  IconButton(
                      onPressed: () {
                        var field = fields.removeAt(index);
                        field.controller.dispose();
                      },
                      icon: Icon(Icons.delete))
                ],
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

  @override
  bool operator ==(covariant MyField other) {
    if (identical(this, other)) return true;

    return other.title == title;
  }

  @override
  int get hashCode => title.hashCode;
}
