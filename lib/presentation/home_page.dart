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
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
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
                                      fontSize: 65,
                                      fontWeight: FontWeight.bold),
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
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffCBD5E0)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DefaultTabController(
                      length: 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: TabBar(
                          controller: _tabController,
                          labelStyle: GoogleFonts.lato(
                              fontSize: 14, color: Color(0xffE6FFFA)),
                          unselectedLabelStyle: GoogleFonts.lato(
                              fontSize: 14, color: Color(0xff319795)),
                          indicatorColor: Color(0xff81E6D9),
                          indicator: BoxDecoration(
                              color: Color(0xff81E6D9),
                              // borderRadius:
                              //     BorderRadius.all(Radius.circular(12)),
                              border: Border.all(color: Color(0xffCBD5E0))),
                          unselectedLabelColor: Color(0xff319795),
                          // labelColor: Color(0xff81E6D9),
                          tabs: <Widget>[
                            Tab(
                              text: 'Arbeitnehmer',
                            ),
                            Tab(
                              text: 'Arbeitgeber',
                            ),
                            Tab(text: 'Temporärbüro'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 2,
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        tabView(
                            context,
                            'Erstellen dein Lebenslauf',
                            'Erstellen dein Lebenslauf',
                            'Mit nur einem Klick bewerben',
                            'assets/images/section-1-tab-1.png',
                            'assets/images/section-2-tab-1.png',
                            'assets/images/section-3-tab-1.png',
                            'Drei einfache Schritte \nzu deinem neuen Job'),
                        tabView(
                            context,
                            'Erstellen dein Unternehmensprofil',
                            'Erstellen ein Jobinserat',
                            'Wähle deinen neuen Mitarbeiter aus',
                            'assets/images/section-1-tab-1.png',
                            'assets/images/section-2-tab-2.png',
                            'assets/images/section-3-tab-2.png',
                            'Drei einfache Schritte \nzu deinem neuen Mitarbeiter'),
                        tabView(
                            context,
                            'Erstellen dein Unternehmensprofil',
                            'Erhalte Vermittlungs- angebot von Arbeitgeber',
                            'Vermittlung nach Provision oder Stundenlohn',
                            'assets/images/section-1-tab-1.png',
                            'assets/images/section-2-tab-3.png',
                            'assets/images/section-3-tab-3.png',
                            'Drei einfache Schritte zur \nVermittlung neuer Mitarbeiter'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
    );
  }

  Widget tabView(
      BuildContext context,
      String sectionOneText,
      String sectionTwoText,
      String sectionThreeText,
      String sectionOneImage,
      String sectionTwoImage,
      String sectionThreeImage,
      String tabTitle) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  tabTitle,
                  style:
                      GoogleFonts.lato(fontSize: 40, color: Color(0xff4A5568)),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              section1(sectionOneText, sectionOneImage),
              SizedBox(
                height: 180,
              ),
              Container(
                height: 370,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: const [
                  Color(0xffE6FFFA),
                  Color(0xffEBF4FF),
                ])),
                child: section2(sectionTwoText, sectionTwoImage),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                height: 700,
                child: Stack(
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                    section3(sectionThreeText, sectionThreeImage),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
            top: 500,
            left: 500,
            child: Image.asset('assets/images/curve-arrow-1.png')),
        Positioned(
            top: 1050,
            left: 600,
            child: Image.asset('assets/images/curve-arrow-2.png'))
      ],
    );
  }

  Widget section1(String text, String image) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 23),
          child: Text(
            '1.',
            style: GoogleFonts.lato(fontSize: 130, color: Color(0xff718096)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 60),
          child: Text(
            text,
            style: GoogleFonts.lato(fontSize: 30, color: Color(0xff718096)),
          ),
        ),
        Image.asset(
          image,
          height: 384,
        )
      ],
    );
  }

  Widget section2(String text, String image) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 120),
          child: Image.asset(
            image,
            height: 384,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 23),
          child: Text(
            '2.',
            style: GoogleFonts.lato(fontSize: 130, color: Color(0xff718096)),
          ),
        ),
        Text(
          text,
          style: GoogleFonts.lato(fontSize: 30, color: Color(0xff718096)),
        ),
      ],
    );
  }

  Widget section3(String text, String image) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 23),
          child: Text(
            '3.',
            style: GoogleFonts.lato(fontSize: 130, color: Color(0xff718096)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 60),
          child: Text(
            text,
            style: GoogleFonts.lato(fontSize: 30, color: Color(0xff718096)),
          ),
        ),
        Image.asset(
          image,
          height: 384,
        )
      ],
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