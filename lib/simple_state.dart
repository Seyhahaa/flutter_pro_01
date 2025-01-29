import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card/counter_logic.dart';
import 'package:flutter_card/language_data.dart';
import 'package:flutter_card/language_logic.dart';
import 'package:flutter_card/second_state.dart';
import 'package:flutter_card/theme_logic.dart';
import 'package:provider/provider.dart';


class SimpleStateScreen extends StatefulWidget {
  @override
  State<SimpleStateScreen> createState() => _SimpleStateScreenState();
}

class _SimpleStateScreenState extends State<SimpleStateScreen> {
  // const SimpleStateScreen({super.key});
  int _counter = 0;
  bool _dark=false;

  Language _lang = khmer();
  int _langIndex = 0;

  @override
  Widget build(BuildContext context) {

    _lang = context.watch<LanguageLogic>().lang;
    _langIndex = context.watch<LanguageLogic>().langIndex;

    // _dark = context.watch<ThemesLogic>().dark;
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDraer(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
        title:const Text("Simple State Screen"),

        actions: [
          IconButton(onPressed: ()=>{
            // context.read<ThemesLogic>().toggleDarkMode(),
          },
           icon: Icon(_dark ? Icons.dark_mode : Icons.dark_mode),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                builder: (context) => SecondStateScreen()
                )
             );
            },
            icon: const Icon(Icons.add_circle),
          ),
          IconButton(
            onPressed: () {
              context.read<CounterLogic>().decrementCounter();
              debugPrint("counter: $_counter");
            },
            icon:const Icon(Icons.remove),
          ),
          IconButton(
            onPressed: () {
              context.read<CounterLogic>().incrementCounter();
              debugPrint("counter: $_counter");
            },
            icon:const Icon(Icons.add),
          ),
        ],
      );
  }

  Drawer _buildDraer(){
    ThemeMode mode = context.watch<ThemesLogic>().mode;
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Icon(Icons.face)),
  
          ExpansionTile(title: Text(_lang.themeColor),
          initiallyExpanded: true,
          children: [
            ListTile(
            leading: Icon(Icons.light_mode),
            title: Text(_lang.lightMode),
            onTap: () {
              context.read<ThemesLogic>().changeToLight();
            },
            trailing: mode == ThemeMode.light ? Icon(Icons.check) : null,
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: Text(_lang.darkMode),
            onTap: () {
              context.read<ThemesLogic>().changeToDark();
            },
            trailing: mode == ThemeMode.dark ? Icon(Icons.check) : null,
          ),
          ListTile(
            leading: const Icon(Icons.phone_android),
            title: Text(_lang.changeToSystem),
            onTap: () {
              context.read<ThemesLogic>().changeToSystem();
            },
            trailing: mode == ThemeMode.system ? Icon(Icons.check) : null,
          ),
          ],
          ),
          ExpansionTile(
            title: Text(_lang.language),
            initiallyExpanded: true,
            children: [
              ListTile(
                leading: const Text("KH"),
                title: Text(_lang.changeToKhmer),
                onTap: () {
                context.read<LanguageLogic>().changeToKhmer();
                },
                trailing: _langIndex == 0 ? const Icon(Icons.check_circle) : null,
              ),
              ListTile(
                leading: const Text("EN"),
                title: Text(_lang.changeToEnglish),
                onTap: () {
                  context.read<LanguageLogic>().changeToEnglish();
                },
                trailing: _langIndex == 1 ? const Icon(Icons.check_circle) : null,
              ),
            ],),
        ],
      ),
    );
  }
  Widget _buildBody(){
   return Column(
        children: [
          Row(
            children: [
              ElevatedButton(onPressed: ()=>{}, child: const Text('Shoping card')),
              ElevatedButton(onPressed: ()=>{}, child: const Text('Whistlist')),
            ],
          ),

            const Card(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "input email"
                  ),
                ),
              ),
          ),
          const Expanded(
            
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Text(
                'គេហទំព័រនេះគឺជាវេទិកាមួយដែលត្រូវបានរចនាឡើងដើម្បី ផ្សព្វផ្សាយនិងចូលរួមព្រឹត្តិការណ៍នាពេលខាងមុខដូចជាសន្និសីទការប្រគំតន្ត្រីពិធីបុណ្យសិក្ខាសាលាការជួបជុំនិងការជួបជុំសង្គម។ ដែលអ្នកប្រើប្រាស់អាចស្វែងរកតាមប្រភេទទីតាំងកាលបរិច្ឆេទនិងលក្ខណៈវិនិច្ឆ័យផ្សេងទៀត។គេហទំព័រនេះគឺជាវេទិកាមួយដែលត្រូវបានរចនាឡើងដើម្បី ផ្សព្វផ្សាយនិងចូលរួមព្រឹត្តិការណ៍នាពេលខាងមុខដូចជាសន្និសីទការប្រគំតន្ត្រីពិធីបុណ្យសិក្ខាសាលាការជួបជុំនិងការជួបជុំសង្គម។ ដែលអ្នកប្រើប្រាស់អាចស្វែងរកតាមប្រភេទទីតាំងកាលបរិច្ឆេទនិងលក្ខណៈវិនិច្ឆ័យផ្សេងទៀត។',
                // style: TextStyle(fontSize: 30 + context.watch<CounterLogic>().counter.toDouble()),
              )
            )
          )
        ],
      );
  }
}