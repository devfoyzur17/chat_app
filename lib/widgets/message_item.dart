// ignore_for_file: prefer_const_constructors

import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/utils/helper_function.dart'; 
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  final MessageModel messageModel;
  const MessageItem({Key? key, required this.messageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: messageModel.userUid == AuthService.user!.uid? CrossAxisAlignment.end: CrossAxisAlignment.start,
            children: [
          Text(messageModel.userName ?? messageModel.email, style: TextStyle(fontSize: 12,color: Colors.grey),),
              Text(getFormatedDate(messageModel.timestamp.toDate()), style: TextStyle(fontSize: 12,color: Colors.grey) ),
            SizedBox(height: 3,),
              Text(messageModel.msg, style: TextStyle(fontSize: 16,color: Colors.black),)

            ],
          ),
        ),

    );
  }
}


