import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/items_list_screen.dart';
import 'screens/add_item_screen.dart';
import 'screens/edit_item_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // هنا يمكن إضافة تسجيل Adapter لاحقًا
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'إدارة البضائع',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo',
      ),
      locale: const Locale('ar', ''),
      supportedLocales: const [Locale('ar', '')],
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ItemsListScreen(),
        '/add': (context) => AddItemScreen(),
        '/edit': (context) => EditItemScreen(),
      },
    );
  }
}