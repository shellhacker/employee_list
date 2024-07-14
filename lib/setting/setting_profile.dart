import 'package:flutter/material.dart';

class SettingProfileScreen extends StatelessWidget {
  const SettingProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text('Setting Profile'),
          )
        ],
      ),
    );
  }
}
