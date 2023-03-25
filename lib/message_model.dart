class Message {
  String? message;
  String? socketId;

  Message({required this.message, required this.socketId});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    socketId = json['socket_id'];
  }
}
