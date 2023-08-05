import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/screens/home_screen.dart';

import '../data/cubits/them/them_cubit.dart';
import '../data/model/news_app/article.dart';
import '../main.dart';

class NwesPage extends StatelessWidget {
  String content;
  String newsimage;
  String newsauthor;
  String newstitle;
  int index;
  NwesPage(
      {super.key,
      required this.index,
      required this.newsimage,
      required this.newsauthor,
      required this.content,
      required this.newstitle});

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
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight, image: NetworkImage(newsimage))),
              ),
            ),
            BlocBuilder<ThemeCubit, bool>(
              builder: (context, isDarkMode) {
                final ThemeData themeData = isDarkMode ? darkTheme : lightTheme;
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 400 / screenH * responsevH,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        color: themeData.primaryColor,
                      ),
                      child: Container(
                        // margin: EdgeInsets.all(15),
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 80 / screenH * responsevH,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Text(
                                  content,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: themeData.cardColor,
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
                );
              },
            ),
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 40.774227142333984, sigmaY: 40.774227142333984),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 141 / screenH * responsevH,
                    width: 311 / screenW * responsevW,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromRGBO(245, 245, 245, 0.5),
                      backgroundBlendMode: BlendMode.luminosity,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsauthor,
                          // 'Sunday, 9 May 2021',
                          style: const TextStyle(
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
                          newstitle,
                          style: const TextStyle(
                            color: Color(0xFF2E0505),
                            fontFamily: 'New York Small',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            height: 1.2,
                          ),
                        ),
                        Spacer(),
                        // Text(
                        //   newsauthor,
                        //   style: const TextStyle(
                        //     color: Color(0xFF2E0505),
                        //     fontFamily: 'Nunito',
                        //     fontSize: 10,
                        //     fontWeight: FontWeight.w800,
                        //     fontStyle: FontStyle.normal,
                        //   ),
                        // ),
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
        ));
  }
}
