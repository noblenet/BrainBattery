import 'package:flutter/material.dart';

void main() => runApp(ListviewApp());

class ListviewApp extends StatefulWidget {
  @override
  State<ListviewApp> createState() => _ListviewAppState();
}

class _ListviewAppState extends State<ListviewApp> {
  final List<String> entries = [];
  final textcontroller = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    entries.sort();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: textcontroller,
          ),
        ),
        body: entries.length > 0
            ? ListView.builder(
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text('${entries[index]}'),
                      onLongPress: () {
                        setState(() {
                          entries.removeAt(index);
                        });
                        Divider();
                      });
                })
            : Center(child: Text('No items in list')),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            setState(() {
              entries.add(textcontroller.text);
              textcontroller.clear();
            });
          },
        ),

        // Scaffold
      ),
    );

//MaterialApp
  }
}
