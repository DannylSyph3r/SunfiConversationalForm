import 'package:dialogflow_flutter/googleAuth.dart';
import 'package:dialogflow_flutter/language.dart';
import 'package:dialogflow_flutter/message.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:dialogflow_flutter/dialogflowFlutter.dart';
import 'package:flutterbotv2/message.dart';
import 'package:hexcolor/hexcolor.dart';

class FlutterFactsChatBot extends StatefulWidget {
  const FlutterFactsChatBot({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _FlutterFactsChatBotState createState() => new _FlutterFactsChatBotState();
}

class _FlutterFactsChatBotState extends State<FlutterFactsChatBot> {
  final List<Facts> messageList = <Facts>[];
  late TextEditingController _textController;
  bool isButtonActive = true;

  @override
  void initState(){
    super.initState();

    _textController = TextEditingController();
    _textController.addListener(() {
      final isButtonActive = _textController.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  void dispose(){
    _textController.dispose();
    super.dispose();
  }


  Widget _queryInputWidget(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.only(left:8.0, right: 8),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                  controller: _textController,
                  onSubmitted: _submitQuery,
                  decoration:  InputDecoration.collapsed(hintText: 'Send a message...',).copyWith(
                      contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0)
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(EvaIcons.paperPlaneOutline,
                    color: Colors.blue.shade900,
                  ),
                  onPressed: isButtonActive
                  ? () {
                      setState(() => isButtonActive = false);
                      _submitQuery(_textController.text);
                     }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void agentResponse(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
    await AuthGoogle(fileJson: "assets/apikey.json").build();
    DialogFlow dialogFlow =
    DialogFlow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogFlow.detectIntent(query);
    Facts message = Facts(
      text: response.getMessage() ??
          CardDialogflow(response.getListMessage()![0]).title,
      name: "Flutter",
      type: false,
    );
    setState(() {
      messageList.insert(0, message);
    });
  }

  void _submitQuery(String text) {
    _textController.clear();
    Facts message = new Facts(
      text: text,
      name: "You",
      type: true,
    );
    setState(() {
      messageList.insert(0, message);
    });
    agentResponse(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#E5E5E5'),
      appBar: AppBar(
        leading: TextButton.icon(
          icon: const Icon(EvaIcons.arrowIosBackOutline),
          onPressed: () {
            int count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 2);
          },
          style: TextButton.styleFrom(
            primary: Colors.black,
          ),
          label: const Text("",
            style: TextStyle(
                fontSize: 9
            ),),
        ),
        centerTitle: true,
        title: Image.asset('assets/SunFiLogo/Logo Blue Blue with Transparent Background.png',
          fit: BoxFit.contain,
          height: 120,
        ),
        backgroundColor: HexColor('#E5E5E5'),
        elevation: 0,
      ),
      body: Column(children: <Widget>[
        Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true, //To keep the latest messages at the bottom
              itemBuilder: (_, int index) => messageList[index],
              itemCount: messageList.length,
            )),
        _queryInputWidget(context),
      ]),
    );
  }
}