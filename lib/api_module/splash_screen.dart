import 'package:flutter/material.dart';
import 'package:flutter_card/api_module/api_screen.dart';
import 'package:flutter_card/api_module/post_logic.dart';
import 'package:provider/provider.dart';

Widget providerApiApp(){
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PostLogic())
    ],
    child: const SplashScreen(),
  );
}

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: context.read<PostLogic>().read(),
     builder: (context, snapshot){
      if(snapshot.connectionState == ConnectionState.done){
        return const ApiApp();
      }else{
        return _buildLoading();
      }
     }
     );
  }

  Widget _buildLoading(){
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Icon(Icons.face, size: 100,),
        ),
      )
    );
  }
}