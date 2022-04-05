import 'package:flutter/material.dart';

class Facts extends StatelessWidget {
  const Facts({Key key, this.text, this.name, this.type}) : super(key: key);

  final String text;
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
                style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
              ),
            ),
//            Text(this.name,
//                style: TextStyle(fontWeight: FontWeight.bold)),
            Card(
                elevation: 3,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(text, ),
                )
            ),
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
                style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
              ),
            ),
//            Text(this.name, style: Theme.of(context).textTheme.subhead),
            Card(
                color: Colors.lightBlue.shade900,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(text, style: const TextStyle(color: Colors.white),),
                )
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 10.0),
        child: const CircleAvatar(
          backgroundImage: AssetImage("assets/avatars/user.png"),
          backgroundColor: Colors.white, radius: 16,),
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