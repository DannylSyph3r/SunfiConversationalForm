import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({Key key}) : super(key: key);

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
                  width: 100,
                  height: 120,
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
                    onPressed: () {},
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
