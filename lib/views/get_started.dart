import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutterbotv2/views/select_info_stage_view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({required Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#E5E5E5'),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  height: 120,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: TextButton.icon(
                      icon: const Icon(EvaIcons.arrowIosBackOutline),
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        primary: HexColor('#011A3C'),
                      ),
                      label: const Text("Back",
                      style: TextStyle(
                        fontSize: 16
                      ),),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/SunFiLogo/Logo Yellow Blue with Transparent Background.png"),
                        fit: BoxFit.fitHeight
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 59, top: 65),
                  child: Container(
                    width: 210,
                    height: 265,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Illustrations/Welcome.png"),
                          fit: BoxFit.fitHeight
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 11),
                  child: Text("Welcome Friend",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: HexColor("#011A3C"),
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 36.0, right: 36.0),
                  child: SizedBox(
                    width: 300,
                    height: 104,
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(color: HexColor("#011A3C"), fontFamily: 'SFProDisplay', fontSize: 16,),
                            children: const [
                              TextSpan(text: "To serve you better, we would like to get your information. We've sectioned this into",style: TextStyle(fontWeight: FontWeight.w400)),
                              TextSpan(text: " 3 categories", style: TextStyle(fontWeight: FontWeight.w600)),
                              TextSpan(text: " and it will take", style: TextStyle(fontWeight: FontWeight.w400)),
                              TextSpan(text: " approximately 5 minutes", style: TextStyle(fontWeight: FontWeight.w600)),
                              TextSpan(text: " to round up", style: TextStyle(fontWeight: FontWeight.w400)),
                            ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  //alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 15, bottom: 60),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(PageTransition(
                        child: const SelectInfoUploadStageView(key: null,),
                        type: PageTransitionType.rightToLeftJoined,
                        childCurrent: this,
                        duration: const Duration(milliseconds: 250),
                        reverseDuration: const Duration(milliseconds: 250),
                      ));
                    },
                    child: const Text("Get Started",
                      style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w600,
                          fontSize: 15.5
                      ),),
                    style: ElevatedButton.styleFrom(
                      primary: HexColor("#004AAD"),
                      fixedSize: const Size(194,56),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
