import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class TaskScreen extends StatefulWidget{
  
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
int sum(int a, int b){
  return a + b;
}

  Future<int> add(int a, int b){
    return Future.value(a + b);
  }

  Future _myBuild()async{
    int a = await add(10, 20);
    debugPrint("a: $a");

  int s = sum(10, 20);
    debugPrint("s: $s");
  }


  @override
  Widget build(BuildContext context) {

  _myBuild();

    return Scaffold(
      appBar: AppBar(
        title: Text("Asynchronous"),
      ),
      body: _buildBody(),
    );
  }

  Future<int> _getData(int max){
    return compute(_getTotal, max);
  }
  Future<String> _getTextData()async {
    http.Response response = await http.get(Uri.parse("https://fakestoreapi.com/products"),
    );
    return response.body;
  }

 
  Widget _buildBody(){
    return Center(
      child: FutureBuilder<String>(
        future: _getTextData(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Text("Error: ${snapshot.error}");
          }
          if(snapshot.connectionState == ConnectionState.done){
            return _buildOutput(snapshot.data);
            }else{
          return CircularProgressIndicator();
          }
        },
      ),
    );
  }

   Widget _buildOutput(String? data){
    if(data == null){
      return Icon(Icons.error);
    }
  List list = json.decode(data);
  List<Map<String, dynamic>> record = 
    list.map((x) => x as Map<String, dynamic>).toList();

    return ListView.builder(
      itemCount: record.length,
      itemBuilder: (context, index){
        return Card(

              child: Column(
                children: [
                  Image.network(record[index]['image'], height: 20,),
              ListTile(
                title: Text(record[index]['title'], style: TextStyle(fontSize: 20),),
                subtitle: Text(record[index]['description']),
              ),
            ],
          ),
        );
      });
  }

}

int _getTotal(int max){
  int total = 0;
  for (int index = 0; index < max; index++){
    total += index;
  }
  return total;
}