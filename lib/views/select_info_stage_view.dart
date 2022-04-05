import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SelectInfoUploadStageView extends StatelessWidget {
  const SelectInfoUploadStageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#E5E5E5'),
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/SunFiLogo/Logo Yellow White with Transparent Background.png',
          fit: BoxFit.contain,
          height: 20.72,
        ),
        backgroundColor: Colors.lightBlue.shade900,
        elevation: 0,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40, bottom: 15),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("User Information",
                  style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w600,
                      fontSize: 15.5
                  ),),
                style: ElevatedButton.styleFrom(
                  primary: HexColor("#004AAD"),
                  fixedSize: const Size(380,60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Upload Documents",
                  style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w600,
                      fontSize: 15.5
                  ),),
                style: ElevatedButton.styleFrom(
                  primary: HexColor("#004AAD"),
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
    );
  }
}
