import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutterbotv2/views/get_started.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#011A3C"),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            centerTitle: false,
            titleSpacing: 37,
            title: Padding(
             padding: const EdgeInsets.only(top: 35.0),
              child: Image.asset("assets/SunFiLogo/Logo Yellow White with Transparent Background.png",
                fit: BoxFit.contain,
                height: 20.72,
          ),
        ),
            bottom: const PreferredSize( preferredSize: Size(20.0, 15.0), child: Text(''), ),
        backgroundColor: HexColor("#011A3C"),
        elevation: 0,
            ),
          ],
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: <Widget>[
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 37.0, top: 172.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("We Simplify.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Qanelas',
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text("We Scale.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Qanelas',
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                ),),
                            ],
                          ),
                        ),
                       // Text("We have solved the problems that make it difficult for energy providers to transition millions of consumers")
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 37.0, top: 35.0),
                          child: SizedBox(
                            width: 350,
                            height: 78,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("We’ve solved the problems that make it difficult for energy providers to transition millions of consumers",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'SFProDisplay',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Text("We have solved the problems that make it difficult for energy providers to transition millions of consumers")
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 37.0),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(top: 37),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const GetStartedView())
                                );
                              },
                              child: const Text("Continue",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontWeight: FontWeight.w600,
                                fontSize: 15.5
                              ),),
                              style: ElevatedButton.styleFrom(
                                primary: HexColor("#004AAD"),
                                fixedSize: const Size(160,56),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 54.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 500,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Illustrations/solar_city_with_transparent_background_card_towards_the_right.png"),
                              fit: BoxFit.fitHeight

                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}
