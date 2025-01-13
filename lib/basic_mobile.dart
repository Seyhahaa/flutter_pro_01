import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasicMobile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Basic Mobile App'),
        ),
        body:  Center(
          child: _buildTextField(),
        )
      );
  }

  Widget _buildTextField(){
    return const Padding(
      padding:  EdgeInsets.all(8.0),
      child: TextField(
        style: TextStyle(
          color: Colors.pink,
        ),
        decoration: InputDecoration(
          icon: Icon(Icons.message_outlined),
          hintText: 'Enter your email',
          border: InputBorder.none,
        ),
        textInputAction: TextInputAction.send,
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        obscureText: false,
      ),
    );
  }
  Widget _buildButton(){
    return Container(
      height: 70,
      width: 300,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.orange,
          side: const BorderSide()
        ),
      onPressed: () {},
      child: const Text("Login")
      ),
    );
  }

  Widget _buileInkWel(){
    return InkWell(
      onTap: (){
        debugPrint("sdfsdfsf");
      },
      child: Image.network('https://images.pexels.com/photos/18069291/pexels-photo-18069291/free-photo-of-beautiful-woman-in-black-dress-posing-on-lakeshore.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load')
    );
  }
}