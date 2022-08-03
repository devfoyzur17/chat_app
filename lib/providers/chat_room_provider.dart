import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/db/dbhelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';

class ChatRoomProvider extends ChangeNotifier {
  List<MessageModel> msgList = [];

  Future<void> addMsg(String msg) {
    final messageModel = MessageModel(
        msgId: DateTime.now().microsecondsSinceEpoch,
        userUid: AuthService.user!.uid,
        userName: AuthService.user!.displayName,
        email: AuthService.user!.email!,
        userImage: AuthService.user!.photoURL,

        msg: msg,
        timestamp: Timestamp.fromDate(DateTime.now()));
    return DBHelper.addMsg(messageModel);
  }

  getAllChatRoomMessages() {
    DBHelper.getAllRoomMessage().listen((snapshot) {
      msgList = List.generate(snapshot.docs.length,
          (index) => MessageModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }
}
