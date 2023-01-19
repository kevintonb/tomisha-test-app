import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomisha_test_app/utils/responsive_check.dart';
import 'package:tomisha_test_app/widgets/header_gradient.dart';
import 'dart:math' as math;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 3, vsync: this); // initialise it here
  }

  @override
  Widget build(BuildContext context) {
    print(math.pi / 12 * 12);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 659,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: const [
                    Color(0xffEBF4FF),
                    Color(0xffE6FFFA)
                  ])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: ResponsiveWidget.isDesktop(context) ? 1 : 0,
                          child: Container()),
                      Expanded(
                        flex: ResponsiveWidget.isDesktop(context) ? 1 : 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: ResponsiveWidget.isDesktop(context),
                              child: Text(
                                'Deine Job \nwebsite',
                                style: GoogleFonts.lato(
                                    fontSize: 65, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 52,
                            ),
                            Visibility(
                                visible: ResponsiveWidget.isDesktop(context),
                                child: registrationButton())
                          ],
                        ),
                      ),
                      Expanded(
                        flex: ResponsiveWidget.isDesktop(context) ? 1 : 0,
                        child: Container(
                          height: 455,
                          width: 455,
                          decoration: BoxDecoration(
                            shape: ResponsiveWidget.isMobile(context)
                                ? BoxShape.rectangle
                                : BoxShape.circle,
                            color: ResponsiveWidget.isMobile(context)
                                ? Colors.transparent
                                : Colors.white,
                            image: DecorationImage(
                              fit: ResponsiveWidget.isDesktop(context)
                                  ? BoxFit.contain
                                  : BoxFit.cover,
                              image: AssetImage(
                                'assets/images/handshake.png',
                              ),
                            ),
                          ),
                        ),
                        // CircleAvatar(
                        //   backgroundColor: Colors.white,
                        //   radius: 400,
                        //   child: const CircleAvatar(
                        //     backgroundColor: Colors.white,
                        //     radius: 200,
                        //     backgroundImage: AssetImage(
                        //       'assets/images/handshake.png',

                        //       // fit: BoxFit.cover,
                        //       // height: 455,
                        //       // width: 455,
                        //     ),
                        //   ),
                        // ),
                      ),
                      Expanded(flex: 1, child: Container())
                    ],
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                Container(
                  width: 480,
                  child: DefaultTabController(
                    length: 3,
                    child: TabBar(
                      controller: _tabController,
                      labelStyle: GoogleFonts.lato(
                          fontSize: 14, color: Color(0xffE6FFFA)),
                      unselectedLabelStyle: GoogleFonts.lato(
                          fontSize: 14, color: Color(0xff319795)),
                      indicatorColor: Color(0xff81E6D9),
                      indicator: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: Colors.green,
                                width: 1,
                                style: BorderStyle.solid)),
                        color: Color(0xff81E6D9),
                      ),
                      unselectedLabelColor: Color(0xff319795),
                      // labelColor: Color(0xff81E6D9),
                      tabs: const <Widget>[
                        Tab(
                          text: '0',
                        ),
                        Tab(
                          text: '1',
                        ),
                        Tab(text: '2'),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      Container(),
                      Container(),
                      Container(),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              child: Stack(
                children: [
                  Container(
                    height: 67,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000029),
                            offset: Offset(0, -6),
                            blurRadius: 6,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                'Jetzt Klicken',
                                style: GoogleFonts.lato(
                                  fontSize: 19,
                                  color: const Color(0xff4A5568),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: OutlinedButton(
                                onPressed: () {
                                  HapticFeedback.lightImpact();
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0))),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 16),
                                  child: Text(
                                    'Kostenlos Registrieren',
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      color: const Color(0xff319795),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: TextButton(
                                onPressed: () {
                                  HapticFeedback.lightImpact();
                                },
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.lato(
                                    fontSize: 14,
                                    color: const Color(0xff319795),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 5,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff319795), Color(0xff3182CE)])),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget registrationButton() {
    return Container(
      // height: 40,
      width: 320,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
              colors: const [Color(0xff319795), Color(0xff3182CE)])),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 17),
        child: Center(
          child: Text(
            'Kostenlos Registrieren',
            style: GoogleFonts.lato(
              fontSize: 17,
              color: Color(0xffE6FFFA),
            ),
          ),
        ),
      ),
    );
  }
}

// Container(
                //   height: 200,
                //   width: MediaQuery.of(context).size.width,
                //   child: Transform.rotate(
                //     angle: math.pi / 12 * 12,
                //     child: CustomPaint(
                //       painter: HeaderGradient(),
                //     ),
                //   ),
                // ),