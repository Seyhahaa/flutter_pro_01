import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card/Home.dart';
import 'package:flutter_card/login_module.dart/login_model.dart';
import 'package:flutter_card/login_module.dart/login_service.dart';


class ApiLoginScreen extends StatefulWidget {
  @override
  State<ApiLoginScreen> createState() => _ApiLoginScreenState();
}

class _ApiLoginScreenState extends State<ApiLoginScreen> {
  // const LoginScreen({super.key}); //<--remove
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }
  final _formKey = GlobalKey<FormState>();

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 500,
        ),
        alignment: Alignment.center,
        padding:const EdgeInsets.all(20),
        child:  SingleChildScrollView(
          child: Form(
          key: _formKey,
          child: Column(
            children: [
            _buildEmailTextFieldBorder(),
           const  SizedBox(height: 10),
            _buildPasswordTextFieldBorder(),
           const SizedBox(height: 10),
            _buidElevatedButton(context),
          ],
          ),
        ),
        ),
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
        onPressed: () async{
          if(_formKey.currentState!.validate()){
            LoginRequestModel requestModel = LoginRequestModel(
              username: _emailCtrl.text.trim(),
              password: _passCtrl.text.trim(),
            );
                await LoginService.login(
            request: requestModel,
            onRes: (value)async {
              LoginResponseModel data = await value;
                debugPrint("data.token: ${data.token}");
                debugPrint("data.errorText: ${data.errorText}");
              if (data.token != null) {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => HomeApp(),
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
            onError: (e) {},
                );
            } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:const Text("Username and Password formats are not correct"),
                action: SnackBarAction(
                    label: "DONE",
                    onPressed: () {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    }),
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
      child: TextFormField(
        controller: _emailCtrl,
        validator: (String? text){
          if(text!.isEmpty){
            return "Email cannot be empty";
          }
          return null;
        },
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
      child: TextFormField(
        controller: _passCtrl,
        validator: (String? text){
          if(text!.isEmpty){
            return "Password cannot be empty";
          }else if(text.length < 6){
            return "Password should be at least 6 characters";
          }
          return null; //no problem
        },
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