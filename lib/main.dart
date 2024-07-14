import 'package:employee_list/bottom_navigatioin.dart';
import 'package:employee_list/home/controller/home_controller.dart';
import 'package:employee_list/profile/controller/profile_controller.dart';
import 'package:employee_list/utils/controller/common_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // StreamProvider<dynamic>(initialData: '',create: (_) => ConnectivityProvider().initialize()),

        ChangeNotifierProvider<CommonController>(
            create: (_) => CommonController()),

        ChangeNotifierProvider<ProfileController>(
            create: (_) => ProfileController()),

        ChangeNotifierProvider<HomeController>(create: (_) => HomeController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: PersistenBottomNavBarDemo(),
      ),
    );
  }
}
