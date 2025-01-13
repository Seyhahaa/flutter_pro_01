import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card/instagram_page.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // const LoginScreen({super.key}); //<--remove
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding:const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildEmailTextFieldBorder(),
         const  SizedBox(height: 10),
          _buildPasswordTextFieldBorder(),
         const SizedBox(height: 10),
          _buidElevatedButton(context),
        ],
      ),
    );
  }

  Widget _buidElevatedButton(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          if (_emailCtrl.text.trim() == "admin" &&
              _passCtrl.text.trim() == "admin") {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => InstagramPage(),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Login Failed"),
              ),
            );
          }
        },
        child: const Text("Login"),
      ),
    );
  }

  bool _hidePassword = true;

  final _emailCtrl = TextEditingController();

  Widget _buildEmailTextFieldBorder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.pink),
      ),
      child: TextField(
        controller: _emailCtrl,
        style:const TextStyle(color: Colors.pink),
        decoration: InputDecoration(
          icon:const Icon(Icons.email),
          iconColor: Colors.pink,
          hintText: "Enter Email",
          hintStyle: TextStyle(color: Colors.pink.shade300),
          border: InputBorder.none,
          
        ),
        textInputAction: TextInputAction.send,
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        obscureText: false, //true => password
      ),
    );
  }

  final _passCtrl = TextEditingController();

  Widget _buildPasswordTextFieldBorder() {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.pink),
      ),
      child: TextField(
        controller: _passCtrl,
        style: const TextStyle(color: Colors.pink),
        decoration: InputDecoration(
          icon:const Icon(Icons.key),
          iconColor: Colors.pink,
          hintText: "Enter Password",
          hintStyle: TextStyle(color: Colors.pink.shade300),
          border: InputBorder.none,
          suffix: IconButton(
            onPressed: () {
              setState(() {
                _hidePassword = !_hidePassword;
              });
              debugPrint("_hidePassword: $_hidePassword");
            },
            icon: Icon(_hidePassword ? Icons.visibility : Icons.visibility_off),
          )
        ),
        textInputAction: TextInputAction.send,
        autocorrect: false,
        obscureText: _hidePassword, //true => password
      ),
    );
  }

  Widget _buildEmailTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.pink,
        // border: Border.all(color: Colors.pink),
      ),
      child: const TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          icon: Icon(Icons.email),
          iconColor: Colors.white,
          hintText: "Enter Email",
          hintStyle: TextStyle(color: Colors.white60),
          border: InputBorder.none,
        ),
        textInputAction: TextInputAction.send,
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        obscureText: false, //true => password
      ),
    );
  }

  Widget _buidTextButton(Color color) {
    return Container(
      width: 300,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: color,
          side: BorderSide(color: color),
        ),
        onPressed: () {},
        child: Text("Login"),
      ),
    );
  }

  Widget _buildInkWell() {
    return InkWell(
      onTap: () {
        debugPrint("picture clicked");
      },
      child: Image.network(
        "https://lumiere-a.akamaihd.net/v1/images/p_moana2_payoff_5787a994.jpeg",
      ),
    );
  }
}