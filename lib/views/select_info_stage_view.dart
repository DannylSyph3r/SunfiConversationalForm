import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutterbotv2/dialog_flow.dart';
import 'package:hexcolor/hexcolor.dart';

class SelectInfoUploadStageView extends StatelessWidget {
  const SelectInfoUploadStageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#E5E5E5'),
      appBar: AppBar(
        centerTitle: true,
        leading: TextButton.icon(
          icon: const Icon(EvaIcons.arrowIosBackOutline),
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(
            primary: Colors.white,
          ),
          label: const Text("",
            style: TextStyle(
                fontSize: 19
            ),),
        ),
        title: Image.asset('assets/SunFiLogo/Logo Yellow White with Transparent Background.png',
          fit: BoxFit.contain,
          height: 20.72,
        ),
        backgroundColor: HexColor("#011A3C"),
        elevation: 0,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 40, bottom: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25.0))),
                          title: Row(
                            children: [
                              IconButton(
                                  onPressed: (){}, icon: Icon(EvaIcons.alertCircleOutline,
                                color: Colors.blue.shade900,
                              ),
                              ),
                              Text('IMPORTANT',
                                style: TextStyle(
                                  color: HexColor('#011A3C'),
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                          content: const Text(
                            "You are about to begin a chat session with the sunFi chatbot to collect your personal information. Please begin the conversation with a Hi or a Hello. Please give straight answers for yes or no questions! And state you would like an energy offer when you are asked what you want do! And reply with exactly the suggested answers provided if there are any included with the questions!",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          actions: [
                            TextButton.icon(
                                icon: const Icon(EvaIcons.close),
                                onPressed: () => Navigator.pop(context),
                                style: TextButton.styleFrom(
                                primary: HexColor('#011A3C'),
                              ),
                                label: const Text("CANCEL"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: TextButton.icon(
                                  icon: const Icon(EvaIcons.checkmark),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => FlutterFactsChatBot())
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                  primary: HexColor('#011A3C'),
                                ),
                                  label: const Text("OK"),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text("Provide User Information",
                      style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w700,
                          fontSize: 15.5
                      ),),
                    style: ElevatedButton.styleFrom(
                      primary: HexColor("#011A3C"),
                      fixedSize: const Size(380,60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25.0))),
                          title: Row(
                            children: [
                              IconButton(
                                onPressed: (){}, icon: Icon(EvaIcons.alertCircleOutline,
                                color: Colors.blue.shade900,
                              ),
                              ),
                              Text('IMPORTANT',
                                style: TextStyle(
                                    color: HexColor('#011A3C'),
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ],
                          ),
                          content: const Text(
                            "Begin with providing user information with the button above this. This stage requires you upload the necessary documents to validate your credit information and identity.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          actions: [
                            TextButton.icon(
                              icon: const Icon(EvaIcons.close),
                              onPressed: () => Navigator.pop(context),
                              style: TextButton.styleFrom(
                                primary: HexColor('#011A3C'),
                              ),
                              label: const Text("CANCEL",),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: TextButton.icon(
                                icon: const Icon(EvaIcons.checkmark),
                                onPressed: () => Navigator.pop(context),
                                style: TextButton.styleFrom(
                                  primary: HexColor('#011A3C'),
                                ),
                                label: const Text("OK"),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text("Upload Documents",
                      style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w600,
                          fontSize: 15.5
                      ),),
                    style: ElevatedButton.styleFrom(
                      primary: HexColor("#011A3C"),
                      fixedSize: const Size(380,60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Container(
                  width: 260,
                  height: 370,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Illustrations/New Illustrations/new 5.png"),
                        fit: BoxFit.fitHeight
                    ),
                  ),
                )
              ],

            ),
          ),
        ],
      ),
    );
  }
}
