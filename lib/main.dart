import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Integration Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> items = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      
      final List<dynamic> data = json.decode(response.body);
      setState(() {
      
       items = data;
      
      });
    } else {
      
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Integration Example'),
      ),
      body: Container(
    
      
child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(

decoration: BoxDecoration(
    color: Colors.white, 
    border: Border(
      bottom: BorderSide(
        color: Colors.black, 
        width: 1.0,          
      ),
    )



),

child: ListTile(

              title: Text('Title: ${items[index]['title']}', style: TextStyle(color: Colors.orange,fontSize: 20),),
            subtitle: Text('Body: ${items[index]['body']}', style: TextStyle(color: Colors.blue)),
          ),


            
          );
        },
      ),


      )
    );
  }
}
