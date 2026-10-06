import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/user.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());

  final usersBox = await Hive.openBox<UserModel>('users');

  if (usersBox.isEmpty) {
    await usersBox.add(
      UserModel(
        id: 1,
        name: 'Ahmed Ali',
        email: 'ahmed@gmail.com',
      ),
    );

    await usersBox.add(
      UserModel(
        id: 2,
        name: 'Sara Mohamed',
        email: 'sara@gmail.com',
      ),
    );

    await usersBox.add(
      UserModel(
        id: 3,
        name: 'John Smith',
        email: 'john@gmail.com',
      ),
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hive Users',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}