import 'package:chitchat/message_model.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  RxList<Message> chatHistory = <Message>[].obs;
}
