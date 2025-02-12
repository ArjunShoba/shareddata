import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefStoringString extends StatefulWidget {
  @override
  State<SharedPrefStoringString> createState() => _SharedPrefStoringStringState();
}

class _SharedPrefStoringStringState extends State<SharedPrefStoringString> {
  String _name = '';

  @override
  void initState() {
    super.initState();
    loadName();
  }

  loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? 'No name saved';
    });
  }

  saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    loadName(); // Refresh the displayed name
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SharedPreferences String Storing"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Saved name: $_name"),
            SizedBox(height: 20),
            TextField(
              onSubmitted: (value) {
                saveName(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter your name",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
