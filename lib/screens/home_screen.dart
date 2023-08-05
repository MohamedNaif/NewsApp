import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:myapp/data/model/news_app/article.dart';

import '../data/cubits/home_screen_cubit/news_app_cubit.dart';
import '../data/cubits/them/them_cubit.dart';
import '../main.dart';
import 'nwes_screen.dart';

class HomePag extends StatelessWidget {
  const HomePag({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchText = TextEditingController(text: '');

    double screenH = 812;
    double screenW = 375;
    double responsevW = MediaQuery.of(context).size.width;
    double responsevH = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ThemeCubit, bool>(
          builder: (context, isDarkMode) {
            final ThemeData themeData = isDarkMode ? darkTheme : lightTheme;
            return Theme(
              data: isDarkMode ? darkTheme : lightTheme,
              child: Container(
                color: themeData.primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                              controller: searchText,
                              cursorColor: Colors.red,
                              decoration: InputDecoration(
                                suffixIconColor: Colors.red,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    context
                                        .read<NewsAppCubit>()
                                        .getNewsApp(searchText.text);
                                  },
                                  child: const Icon(Icons.search),
                                ),
                                hintText: "Search for Latest News...",
                                hintStyle: TextStyle(
                                    color:
                                        isDarkMode ? Colors.white : Colors.grey,
                                    fontFamily: 'Nunito',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    height:
                                        1 // assuming that line-height is equal to normal
                                    ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 12 / screenW * responsevW),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16 / screenW * responsevW,
                          ),
                          InkWell(
                            onTap: () {
                              context.read<ThemeCubit>().toggleTheme();
                            },
                            child: Container(
                              width: 40,
                              height: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: isDarkMode
                                    ? const Color.fromARGB(255, 37, 34, 34)
                                    : const Color.fromARGB(255, 234, 99, 105),
                              ),
                              child: Stack(
                                children: [
                                  // Moon icon
                                  Visibility(
                                    visible: !isDarkMode,
                                    child: const Positioned(
                                      left: 2,
                                      top: 2,
                                      child: Icon(
                                        Icons.nightlight_round,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  // Sun icon
                                  Visibility(
                                    visible: isDarkMode,
                                    child: const Positioned(
                                      right: 2,
                                      top: 2,
                                      child: Icon(
                                        Icons.wb_sunny,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18 / screenH * responsevH,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 15 / screenW * responsevW),
                      height: (21 / screenH) * responsevH,
                      child: Center(
                        child: Text(
                          'Latest News',
                          style: TextStyle(
                            color: themeData.cardColor,
                            fontFamily: 'New York Small',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            height: 1.15556,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16 / screenH * responsevH,
                    ),
                    Expanded(
                      child: BlocBuilder<NewsAppCubit, NewsAppState>(
                        builder: (context, state) {
                          if (state is NewsAppInitial) {
                            return const Center(
                                child: Text('press to get news'));
                          } else if (state is NewsAppLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is NewsAppSucsess) {
                            return Container(
                              child: ListView.builder(
                                // itemCount: state.ourResponse.articles?.length ?? 0,
                                itemCount: state.ourResponse.articles != null
                                    ? state.ourResponse.articles!.length
                                    : 0,
                                // itemCount: state.ourResponse.articles!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: ((context) => NwesPage(
                                                index: index,
                                                content: (state
                                                        .ourResponse
                                                        .articles![index]
                                                        .content ??
                                                    ''),
                                                newsauthor: (state
                                                        .ourResponse
                                                        .articles![index]
                                                        .author ??
                                                    ''),
                                                newsimage: (state
                                                        .ourResponse
                                                        .articles![index]
                                                        .urlToImage ??
                                                    ''),
                                                newstitle: (state
                                                        .ourResponse
                                                        .articles![index]
                                                        .title ??
                                                    ''),
                                              )),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      // color: Colors.black,
                                      decoration: BoxDecoration(
                                        // color: Colors.black,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(state
                                                  .ourResponse
                                                  .articles![index]
                                                  .urlToImage ??
                                              "https://cdn4.vectorstock.com/i/1000x1000/85/43/error-page-not-found-vector-27898543.jpg"),
                                          // image: AssetImage('assets/man.png'),
                                        ),
                                      ),
                                      margin: EdgeInsets.all(
                                          15 / screenW * responsevW),
                                      // padding:
                                      //     EdgeInsets.all(15 / screenW * responsevW),
                                      height: (240 / screenH) * responsevH,
                                      child: Stack(children: [
                                        Container(
                                          color: const Color.fromARGB(
                                              124, 36, 37, 57),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(
                                              15 / screenW * responsevW),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height:
                                                    80 / screenH * responsevH,
                                              ),
                                              Text(
                                                // "momo",
                                                state
                                                        .ourResponse
                                                        .articles![index]
                                                        .author ??
                                                    '',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Nunito',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w800,
                                                  fontStyle: FontStyle.normal,
                                                  height: 1,
                                                ),
                                              ),
                                              Text(
                                                // 'lkjhgftyuiopoiuytfghujikolkjhgfr',
                                                state
                                                        .ourResponse
                                                        .articles![index]
                                                        .title ??
                                                    '',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'New York Small',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  fontStyle: FontStyle.normal,
                                                  height: 1.3,
                                                ),
                                              ),
                                              // Spacer(),
                                              // Text(
                                              //   // 'momomomomomomomo',
                                              //   state.ourResponse.articles![index].content ??
                                              //       '',
                                              //   style: const TextStyle(
                                              //     color: Colors.white,
                                              //     fontFamily: 'Nunito',
                                              //     fontSize: 10,
                                              //     fontWeight: FontWeight.w400,
                                              //     fontStyle: FontStyle.normal,
                                              //     height: 1,
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        ),
                                      ]),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return const Center(
                              child: Text('Erorr'),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
