import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:hexcolor/hexcolor.dart';

class Facts extends StatelessWidget {
  const Facts({Key? key, required this.text, required this.name, required this.type}) : super(key: key);

  final String? text;
  final String name;
  final bool type;

  List<Widget> botMessage(context) {
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 10.0),
        child: CircleAvatar(
          backgroundImage: const AssetImage("assets/avatars/man.png"),
          child: const Padding(
          padding: EdgeInsets.all(5),
        ), backgroundColor: Colors.grey[200], radius: 16,),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 3),
              child: const Text(
                '     Daniel from Sunfi',
                style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w800),
              ),
            ),
//            Text(this.name,
//                style: TextStyle(fontWeight: FontWeight.bold)),
            ChatBubble(
              elevation: 10,
              clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble, nipWidth: 5, nipRadius: 2),
              backGroundColor: Colors.white,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.5, left: 1, bottom: 3.5, right: 1),
                  child: SelectableText(text! ),
                ),
              ),
            )
          ],
        ),
      ),
    ];
  }

  List<Widget> userMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 3),
              child: const Text(
                'You     ',
                style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w800),
              ),
            ),
//            Text(this.name, style: Theme.of(context).textTheme.subhead),
            ChatBubble(
              elevation: 10,
              clipper: ChatBubbleClipper1(type: BubbleType.sendBubble, nipWidth: 5, nipRadius: 2),
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 5),
              backGroundColor: HexColor("#011A3C"),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.5, left: 1, bottom: 3.5, right: 1),
                  child: SelectableText(
                      text!, style: const TextStyle(color: Colors.white)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 10.0),
        child: const CircleAvatar(
          backgroundImage: AssetImage("assets/avatars/user.png"),
          backgroundColor: Colors.white, radius: 14,),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? userMessage(context) : botMessage(context),
      ),
    );
  }
}