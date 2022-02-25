import 'package:flutter/cupertino.dart';

class Post {
  var user;
  var userImages;
  var postImages;
  var userPostMessage;
  bool like = false;
  List<String> commmentUser = [];
  List<String> commentUserMessage = [];
  TextEditingController controller = TextEditingController();
  Post(var user, var userImages, var postImages, var userPostMessage,
      List<String> commmentUser, List<String> commentUserMessage) {
    this.user = user;
    this.userImages = userImages;
    this.postImages = postImages;
    this.userPostMessage = userPostMessage;
    this.commmentUser = commmentUser;
    this.commentUserMessage = commentUserMessage;
  }
}
