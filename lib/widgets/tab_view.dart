import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomisha_test_app/utils/responsive_check.dart';

Widget tabView(
      BuildContext context,
      String sectionOneText,
      String sectionTwoText,
      String sectionThreeText,
      String sectionOneImage,
      String sectionTwoImage,
      String sectionThreeImage,
      String tabTitle) {
        Widget section1(String text, String image) {
    return Column(
      children: [
        ResponsiveWidget.isMobile(context)
            ? Image.asset(
                image,
                height: 144,
              )
            : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 23),
              child: Text(
                '1.',
                style:
                    GoogleFonts.lato(fontSize: 130, color: const Color(0xff718096)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60),
              child: Text(
                text,
                style: GoogleFonts.lato(
                    fontSize: ResponsiveWidget.isDesktop(context) ? 30 : 16,
                    color: const Color(0xff718096)),
              ),
            ),
            ResponsiveWidget.isDesktop(context)
                ? Image.asset(
                    image,
                    height: 384,
                  )
                : Container()
          ],
        ),
      ],
    );
  }

  Widget section2(String text, String image) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResponsiveWidget.isDesktop(context)
                ? Padding(
                    padding: const EdgeInsets.only(right: 120),
                    child: Image.asset(
                      image,
                      height: 384,
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.only(right: 23),
              child: Text(
                '2.',
                style:
                    GoogleFonts.lato(fontSize: 130, color: const Color(0xff718096)),
              ),
            ),
            Text(
              text,
              style: GoogleFonts.lato(
                  fontSize: ResponsiveWidget.isDesktop(context) ? 30 : 16,
                  color: const Color(0xff718096)),
            ),
          ],
        ),
        ResponsiveWidget.isMobile(context)
            ? Image.asset(
                image,
                height: 144,
              )
            : Container(),
      ],
    );
  }

  Widget section3(String text, String image) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 23),
              child: Text(
                '3.',
                style:
                    GoogleFonts.lato(fontSize: 130, color: const Color(0xff718096)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60),
              child: Text(
                text,
                style: GoogleFonts.lato(
                    fontSize: ResponsiveWidget.isDesktop(context) ? 30 : 16,
                    color: const Color(0xff718096)),
              ),
            ),
            ResponsiveWidget.isDesktop(context)
                ? Image.asset(
                    image,
                    height: 384,
                  )
                : Container()
          ],
        ),
        ResponsiveWidget.isMobile(context)
            ? Image.asset(
                image,
                height: 144,
              )
            : Container(),
      ],
    );
  }
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
                  style: GoogleFonts.lato(
                      fontSize: ResponsiveWidget.isDesktop(context) ? 40 : 21,
                      color: const Color(0xff4A5568)),
                ),
              ),
              SizedBox(
                height: ResponsiveWidget.isDesktop(context) ? 100 : 20,
              ),
              section1(sectionOneText, sectionOneImage),
              SizedBox(
                height: ResponsiveWidget.isDesktop(context) ? 180 : 60,
              ),
              Container(
                height: 370,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xffE6FFFA),
                  Color(0xffEBF4FF),
                ])),
                child: section2(sectionTwoText, sectionTwoImage),
              ),
              SizedBox(
                height: ResponsiveWidget.isDesktop(context) ? 100 : 40,
              ),
              SizedBox(
                height: 700,
                child: Stack(
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.1),
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

  