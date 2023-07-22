import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/screens/home_screen.dart';

class NwesPage extends StatelessWidget {
  const NwesPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenH = 812;
    double screenW = 375;
    double responsevW = MediaQuery.of(context).size.width;
    double responsevH = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        backgroundColor: Color(0xffFF3A44),
        child: SvgPicture.asset("assets/love.svg"),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              height: 440 / screenH * responsevH,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage('assets/man.png'))),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 400 / screenH * responsevH,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  color: Colors.white,
                ),
                child: Container(
                  // margin: EdgeInsets.all(15),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80 / screenH * responsevH,
                      ),
                      const Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            'LONDON — Cryptocurrencies “have no intrinsic value” and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey said.\n\nDigital currencies like bitcoin, ether and even dogecoin have been on a tear this year, reminding some investors of the 2017 crypto bubble in which bitcoin blasted toward \$20,000, only to sink as low as \$3,122 a year later.\n\nAsked at a press conference Thursday about the rising value of cryptocurrencies, Bailey said: “They have no intrinsic value. That doesn’t mean to say people don’t put value on them, because they can have extrinsic value. But they have no intrinsic value.”\n\n“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”\n\nBailey’s comments echoed a similar warning from the U.K.’s Financial Conduct Authority.\n\n“Investing in cryptoassets, or investments and lending linked to them, generally involves taking very high risks with investors’ money,” the financial services watchdog said in January.\n\n“If consumers invest in these types of product, they should be prepared to lose all their money.”\n\nBailey, who was formerly the chief executive of the FCA, has long been a skeptic of crypto. In 2017, he warned: “If you want to invest in bitcoin, be prepared to lose all your money.”',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Color(0xFF2E0505),
                              fontFamily: 'Nunito',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 40.774227142333984, sigmaY: 40.774227142333984),
                child: Container(
                  padding: EdgeInsets.all(12),
                  height: 141 / screenH * responsevH,
                  width: 311 / screenW * responsevW,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromRGBO(245, 245, 245, 0.5),
                    backgroundBlendMode: BlendMode.luminosity,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Sunday, 9 May 2021',
                        style: TextStyle(
                          color: Color(0xFF2E0505),
                          fontFamily: 'Nunito',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          height: 1.73333,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Crypto investors should be prepared to lose all their money, BOE governor says',
                        style: TextStyle(
                          color: Color(0xFF2E0505),
                          fontFamily: 'New York Small',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          height: 1.2,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Published by Ryan Browne',
                        style: TextStyle(
                          color: Color(0xFF2E0505),
                          fontFamily: 'Nunito',
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => HomePag()),
                  ),
                );
              },
              child: Container(
                height: 32 / screenH * responsevH,
                width: 32 / screenW * responsevW,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset('assets/Group26.svg'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
