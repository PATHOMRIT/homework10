import 'package:flutter/material.dart';
import 'package:homework10/ModelInfo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> PostInfo = [
    Post('DogThailand', 'assets/images/dog.jpg', 'assets/images/Labrador.jpg', 'ลาบลาดอร์ เป็นสุนัขที่ซื่อสัตย์ต่อเจ้าของเป็นที่หนึ่ง ฉะนั้นจึงมั่นใจได้เลยว่าคนที่ชอบสุนัขสายพันธุ์นี้ก็ต้องเป็นคนที่ซื่อสัตย์มากคนหนึ่งเลยทีเดียว ดำเนินชีวิตอย่างชาญฉลาด มีความสนุกสนานร่าเริง แต่ก็แอบมีอาการซุกซนอยู่ไม่น้อย ถ้าในบ้านมีคนที่รักและอาหารจานโปรดอยู่พวกเขาจะไม่ยอมออกจากบ้านไปไหนเลยล่ะ',
        ['like dog','poppy'], ['น่ารัก','จริงมาก']),
    Post('CatThailand', 'assets/images/cat.jpg', 'assets/images/Scottishfold.jpg', 'สก็อตติชโฟลด์ มีนิสัยที่อ่อนไหวง่าย ชอบแสดงอารมณ์ แต่ก็มีความขี้เล่น และแอคทีฟในเวลาเดียวกัน สรุปง่ายๆ ก็คือถ้าจะปล่อยสก๊อตทิช โฟลด์ ให้อยู่บ้านลำพังตัวเดียวอาจจะไม่ถูกใจสก๊อตทิช โฟลด์ เท่าไหร่นัก น้องแมวสายพันธุ์นี้ชอบที่จะมีเพื่อน จะเป็นเจ้าของ หรือเป็นแมวด้วยกัน ทางนี้ก็ไม่เกี่ยง ถ้าใครสามารถมอบความรักและความสนใจให้น้องแมวสก๊อตทิช โฟลด์ ได้แล้วละก็ คุณจะมีเพื่อนรักเป็นน้องแมวตัวนุ่มขนฟูแน่นอน',
        ['lovely cat','paladin'], ['น้องน่ารักเกินไปแล้ว','น่าเลี้ยงมากเลย']),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < PostInfo.length; i++) buildPost(position: i),
          ],
        ),
      ),
    );
  }

  Widget buildPost({int? position}) {
    var post = PostInfo[position!];

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        color: Colors.grey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage(post.userImages),
                      ),
                    ),
                    Text(
                      post.user,
                      style: TextStyle(fontSize: 35.0),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                )
              ],
            ),
            Image.asset(post.postImages),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0,left: 20.0,right: 20.0),
              child: Row(
                children: [
                  SizedBox(height: 20.0,),
                  Flexible(
                    child: Text(
                      post.userPostMessage,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            ),
            for (int i = 0; i < post.commmentUser.length; i++)
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    post.commmentUser[i] + ' : ',
                    style: TextStyle(fontSize: 20.0, color: Colors.blue),
                  ),
                  Text(
                    post.commentUserMessage[i],
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            Row(
              children: [
                buildThumpUp(position: position),
                buildField(position: position),
                SizedBox(
                  width: 40.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget buildThumpUp({int? position}) {
    var postlike = PostInfo[position!];
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: IconButton(
        onPressed: () {
          setState(() {
            postlike.like = !postlike.like;
          });
        },
        icon: Icon((postlike.like)? Icons.thumb_up : Icons.thumb_up_alt_outlined, size: 25.0,),
      ),
    );
  }
  Widget buildField({int? position}){
    var post = PostInfo[position!];
    var controller = post.controller;
    return Flexible(
      child: Container(
        height: 25.0,
        child: TextField(
          decoration: InputDecoration(hintText: 'Add message'),
          controller: controller,
          onSubmitted: (String comment){
            setState(() {
              post.commmentUser.add("Pathomrit");
              post.commentUserMessage.add(comment);
              controller.clear();
            });
          }
        ),
      ),
    );
  }
}
