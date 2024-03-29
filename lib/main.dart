import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallstate/providers/user_provider.dart';
import 'package:wallstate/providers/wallpaper_provider.dart';
import 'package:wallstate/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<WallPaperProvider>(
          create: (context) => WallPaperProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Wall State',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
