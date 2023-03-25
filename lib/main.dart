import 'package:chitchat/app_constants.dart';
import 'package:chitchat/message_area.dart';
import 'package:chitchat/message_box.dart';
import 'package:chitchat/size_configs.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Chit Chat',
      debugShowCheckedModeBanner: false,
      home: AppScreen(),
    );
  }
}

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppConstants.greenColor,
        title: const Text('Client Id'),
      ),
      body: Column(
        children: [
          const MessageArea(),
          MessageBox(),
        ],
      ),
    );
  }
}
