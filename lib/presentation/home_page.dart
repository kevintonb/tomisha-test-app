import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomisha_test_app/utils/responsive_check.dart';
import 'dart:math' as math;

import 'package:tomisha_test_app/widgets/action_button.dart';
import 'package:tomisha_test_app/widgets/custom_appbar.dart';
import 'package:tomisha_test_app/widgets/opening_section.dart';
import 'package:tomisha_test_app/widgets/registration_bottom_sheet.dart';
import 'package:tomisha_test_app/widgets/registration_button.dart';
import 'package:tomisha_test_app/widgets/tab_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
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
        TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    print(math.pi / 12 * 12);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: Colors.white),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      openingSection(context),
                      ResponsiveWidget.isMobile(context)
                          ? Positioned(
                              bottom: 0,
                              child: bottomSheetWithRegistration(context),
                            )
                          : Container()
                    ],
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  tabbarSection(),
                  const SizedBox(
                    height: 55,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 2,
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        tabView(
                            context,
                            'Erstellen dein Lebenslauf',
                            'Erstellen dein Lebenslauf',
                            ResponsiveWidget.isDesktop(context)
                                ? 'Mit nur einem Klick bewerben'
                                : 'Mit nur einem Klick \nbewerben',
                            'assets/images/section-1-tab-1.png',
                            'assets/images/section-2-tab-1.png',
                            'assets/images/section-3-tab-1.png',
                            'Drei einfache Schritte \nzu deinem neuen Job'),
                        tabView(
                            context,
                            ResponsiveWidget.isDesktop(context)
                                ? 'Erstellen dein Unternehmensprofil'
                                : 'Erstellen dein \nUnternehmensprofil',
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
                            ResponsiveWidget.isDesktop(context)
                                ? 'Drei einfache Schritte zur \nVermittlung neuer Mitarbeiter'
                                : 'Drei einfache Schritte zur \nVermittlung neuer \nMitarbeiter'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          customAppBar(context)
        ],
      ),
    );
  }

  Widget tabbarSection() {
    return Container(
                  width: 480,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffCBD5E0)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DefaultTabController(
                    length: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: TabBar(
                        controller: _tabController,
                        labelStyle: GoogleFonts.lato(
                            fontSize: 14, color: const Color(0xffE6FFFA)),
                        unselectedLabelStyle: GoogleFonts.lato(
                            fontSize: 14, color: const Color(0xff319795)),
                        indicatorColor: const Color(0xff81E6D9),
                        indicator: BoxDecoration(
                            color: const Color(0xff81E6D9),
                            // borderRadius:
                            //     BorderRadius.all(Radius.circular(12)),
                            border: Border.all(color: const Color(0xffCBD5E0))),
                        unselectedLabelColor: const Color(0xff319795),
                        // labelColor: Color(0xff81E6D9),
                        tabs: const <Widget>[
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