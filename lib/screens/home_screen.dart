import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'nwes_screen.dart';

class HomePag extends StatelessWidget {
  const HomePag({super.key});

  @override
  Widget build(BuildContext context) {
    double screenH = 812;
    double screenW = 375;
    double responsevW = MediaQuery.of(context).size.width;
    double responsevH = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        suffixIconColor: Colors.red,
                        suffixIcon: const Icon(Icons.search),
                        hintText: "Dogecoin to the Moon...",
                        hintStyle: const TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            height:
                                1 // assuming that line-height is equal to normal
                            ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0, horizontal: 12 / screenW * responsevW),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16 / screenW * responsevW,
                  ),
                  Container(
                    width: 36 / screenW * responsevW,
                    height: 36 / screenH * responsevH,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xffFF3A44),
                    ),
                    child: SvgPicture.asset(
                      "assets/Group.svg",
                      fit: BoxFit.scaleDown,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24 / screenH * responsevH,
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: 15 / screenW * responsevW),
              height: (21 / screenH) * responsevH,
              child: Row(
                children: [
                  const Text(
                    'Latest News',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'New York Small',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      height: 1.15556,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'See All',
                    style: TextStyle(
                      color: Color(0xFF0080FF),
                      fontFamily: 'Nunito',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      height: 1,
                    ),
                  ),
                  SizedBox(
                    width: 16 / screenW * responsevW,
                  ),
                  InkWell(
                    child: SvgPicture.asset('assets/arrow.svg'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16 / screenH * responsevH,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => NwesPage()),
                        ),
                      );
                    },
                    child: Container(
                      // color: Colors.black,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/man.png'))),
                      margin: EdgeInsets.all(15 / screenW * responsevW),
                      padding: EdgeInsets.all(15 / screenW * responsevW),
                      height: (240 / screenH) * responsevH,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 80 / screenH * responsevH,
                          ),
                          Text(
                            'by Ryan Browne',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Nunito',
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal,
                              height: 1,
                            ),
                          ),
                          Text(
                            'Crypto investors should be prepared to lose all their money, BOE governor says',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'New York Small',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              height: 1.3,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Nunito',
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              height: 1,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
