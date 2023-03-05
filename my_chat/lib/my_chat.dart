library my_chat;

import 'package:flutter/material.dart';

class MyChat extends StatefulWidget {
  const MyChat({
    Key? key,
    required this.message,
    required this.recieved,
    this.chatBoxColor = Colors.grey,
    this.textColor = Colors.black,
    required this.dateTime,
    this.userPicture,
  }) : super(key: key);

  final String message;
  final bool recieved;
  final Color chatBoxColor;
  final Color textColor;
  final DateTime dateTime;
  final Image? userPicture;
  @override
  State<MyChat> createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  bool _recieved = true;
  String _message = "No message was sent";
  Color _chatBoxColor = Colors.grey;
  final Color _textColor = Colors.black;
  DateTime now = DateTime.now();
  ImageProvider userPicture = const AssetImage("assets/img/user-default.png");

  @override
  void initState() {
    super.initState();
    _recieved = widget.recieved;
    _message = widget.message;
    _chatBoxColor = widget.chatBoxColor;
    now = widget.dateTime;
    userPicture = widget.userPicture?.image ??
        const AssetImage("assets/img/user-default.png");
  }

  @override
  Widget build(BuildContext context) {
    return _recieved == true
        ? Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    foregroundImage: userPicture,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      // width: 250,
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 2 / 3,
                        minWidth: MediaQuery.of(context).size.width / 4,
                      ),
                      decoration: BoxDecoration(
                        color: _chatBoxColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: RichText(
                            text: TextSpan(
                              text: "$_message\n",
                              style: TextStyle(
                                color: _textColor,
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        "${(now.hour).toString().padLeft(2, "0")}:${(now.minute).toString().padLeft(2, "0")}",
                                    style: const TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 150, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 2 / 3,
                        minWidth: MediaQuery.of(context).size.width / 5,
                        minHeight: MediaQuery.of(context).size.height / 15,
                      ),
                      decoration: BoxDecoration(
                        color: _chatBoxColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: RichText(
                            text: TextSpan(
                              text: "$_message\n",
                              style: TextStyle(
                                color: _textColor,
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        "${(now.hour).toString().padLeft(2, "0")}:${(now.minute).toString().padLeft(2, "0")}",
                                    style: const TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ],
                            ),
                          )),
                    ),
                  ),
                  CircleAvatar(
                    foregroundImage: userPicture,
                  ),
                ],
              ),
            ),
          );
  }
}
