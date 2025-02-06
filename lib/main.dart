import 'package:flutter/material.dart';
import 'package:flutter_card/counter_logic.dart';
import 'package:flutter_card/language_logic.dart';
import 'package:flutter_card/login_screen.dart';
import 'package:flutter_card/theme_logic.dart';
import 'package:flutter_card/xampp/item_provider.dart';
import 'package:flutter_card/xampp/picker_app.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const PickerApp());
}

Widget providerBasicApp(){
  return MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CounterLogic()),
    ChangeNotifierProvider(create: (context) => ThemesLogic()),
    ChangeNotifierProvider(create: (context) => LanguageLogic(),)
  ],
    child: const MyApp(),
  );
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future _readLocalData() async {
    //await Future.delayed(const Duration(seconds: 2), () {});
    await context.read<CounterLogic>().read();
    await context.read<ThemesLogic>().read();
    await context.read<LanguageLogic>().read();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
    return FutureBuilder(
      future: _readLocalData(),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return const Center(
            child: Text("Error"),
          );
        }
        if(snapshot.connectionState == ConnectionState.done){
          return BasicApp();
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    }
}

class BasicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeMode mode = context.watch<ThemesLogic>().mode;

    Color lightColor = Colors.pink;
    Color darkColor = Colors.blueGrey.shade900;

    double size = context.watch<CounterLogic>().counter.toDouble();

    final myTextTheme = TextTheme(
      bodyMedium: TextStyle(fontSize: 18 + size),
      displayMedium: TextStyle(
        fontSize: 20 + size,
      ),
      displayLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22 + size,
      ),
      displaySmall: TextStyle(
        fontSize: 14 + size,
        fontStyle: FontStyle.italic,
      ),
    );

    return MaterialApp(
      home: LoginScreen(),
      themeMode: mode,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        textTheme: myTextTheme,
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
          suffixIconColor: lightColor,
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
          backgroundColor: lightColor,
          foregroundColor: Colors.white,
        )),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: lightColor,
            side: BorderSide(color: lightColor),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: myTextTheme,
        appBarTheme: AppBarTheme(
          backgroundColor: darkColor,
          foregroundColor: Colors.white,
        ),
        drawerTheme: DrawerThemeData(backgroundColor: darkColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade800,
          foregroundColor: Colors.white,
        )),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.white),
        )),
      ),
    );
  }
}
