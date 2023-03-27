import 'package:chitchat/app_constants.dart';
import 'package:chitchat/message_model.dart';
import 'package:chitchat/received_message.dart';
import 'package:chitchat/sent_message.dart';
import 'package:chitchat/size_configs.dart';
import 'package:chitchat/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  Get.lazyPut(() => ChatController(), fenix: true);
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
  final ChatController chatController = Get.find<ChatController>();
  late IO.Socket _socket;
  String headerTitle = 'Chit Chat';

  @override
  void initState() {
    super.initState();
    _socket = IO.io(
        'http://localhost:4000',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .build());
    _socket.connect();
    _socket.onConnect((data) {
      headerTitle = _socket.id!;
      setState(() {});
    });
    addSocketListener();
  }

  void addSocketListener() {
    _socket.on('receive-message',
        (data) => chatController.chatHistory.add(Message.fromJson(data)));
  }

  void sentMessage(String message) {
    if (message.isNotEmpty) {
      _socket
          .emit('send-message', {'message': message, 'socket_id': _socket.id});
      chatController.chatHistory
          .add(Message(message: message, socketId: _socket.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppConstants.greenColor,
        title: Text(headerTitle),
      ),
      body: Column(
        children: [
          Expanded(
              child: Obx(() => SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(chatController.chatHistory.length,
                          (index) {
                        if (chatController.chatHistory[index].socketId ==
                            _socket.id) {
                          return SentMessage(
                              message:
                                  chatController.chatHistory[index].message);
                        }
                        return ReceivedMessage(
                            message: chatController.chatHistory[index].message);
                      }),
                    ),
                  ))),
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight! * 0.065,
            margin: EdgeInsets.only(
                left: 20, right: 20, bottom: SizeConfig.safeAreaBottom! + 10),
            decoration: BoxDecoration(
                border: Border.all(color: AppConstants.greenColor),
                borderRadius: BorderRadius.circular(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: AppConstants.greenColor,
                    autofocus: false,
                    controller: messageController,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(
                        fontSize: SizeConfig.screenWidth! * 0.04,
                        letterSpacing: 01,
                        fontWeight: FontWeight.w500,
                        color: AppConstants.blackColor),
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(
                          height: 0, fontSize: 0, color: Colors.white),
                      hintText: 'Type a message',
                      hintStyle: GoogleFonts.poppins(
                        color: AppConstants.blackColor,
                        letterSpacing: 01,
                        fontSize: SizeConfig.screenWidth! * 0.04,
                        fontWeight: FontWeight.w500,
                      ),
                      counterText: '',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    sentMessage(messageController.text);
                    Future.delayed(const Duration(milliseconds: 100),
                        () => messageController.clear());
                  },
                  child: Container(
                    width: SizeConfig.screenWidth! * 0.15,
                    height: SizeConfig.screenHeight! * 0.065,
                    margin: const EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                        color: AppConstants.greenColor,
                        border: Border.all(color: AppConstants.greenColor),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Icon(
                        Icons.send_rounded,
                        color: AppConstants.whiteColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
