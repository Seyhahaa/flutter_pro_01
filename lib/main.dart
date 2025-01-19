import 'package:flutter/material.dart';
import 'package:flutter_card/counter_logic.dart';
import 'package:flutter_card/event_module/event_provider.dart';
import 'package:flutter_card/language_logic.dart';
import 'package:flutter_card/simple_state.dart';
import 'package:flutter_card/theme_logic.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(eventProvider());
}

Widget providerBasicApp(){
  return MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CounterLogic()),
    ChangeNotifierProvider(create: (context) => ThemesLogic()),
    ChangeNotifierProvider(create: (context) => LanguageLogic(),)
  ],
    child: MyApp(),
  );
}
class MyApp extends StatelessWidget {

  //const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  ThemeMode mode = context.watch<ThemesLogic>().mode;

  Color lightColor = Color.fromARGB(255, 226, 49, 5);
  Color darkColor = Colors.blueGrey.shade900;
  double size = context.watch<CounterLogic>().counter.toDouble();

    return  MaterialApp(
      home: SimpleStateScreen(),
      themeMode: mode,
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 18 + size),
          displayMedium: TextStyle(fontSize: 20 + size),
          displayLarge: TextStyle(fontSize: 20 + size, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontSize: 16 + size, fontStyle: FontStyle.italic),
        ),
        appBarTheme: AppBarTheme(
        backgroundColor: lightColor,
        foregroundColor: Colors.white,
        ),

        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.pink,
          )
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: lightColor),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        expansionTileTheme: ExpansionTileThemeData(
          iconColor: lightColor,
          textColor: lightColor,
        ),
        listTileTheme: ListTileThemeData(
          iconColor: lightColor,
          textColor: lightColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          iconColor: lightColor,
          border: InputBorder.none,
          suffixIconColor: lightColor
        )

      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
        backgroundColor: darkColor,
        foregroundColor: Colors.white,
        ),

        drawerTheme: DrawerThemeData(
          backgroundColor: darkColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.pink,
          )
        ),

      ),
    );
  }
}
