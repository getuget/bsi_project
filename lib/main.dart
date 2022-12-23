import 'package:bsi_project/presentation/pages/screens/homepage.dart';
import 'package:bsi_project/provider/api/sheets/jelekong_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await JelekongKeluarSheetsApi.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catatan Bumi Spiritual Itsbatul Yaqin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Catatan Bumi Spiritual Itsbatul Yaqin'),
    );
  }
}
