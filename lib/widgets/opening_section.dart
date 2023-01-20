import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomisha_test_app/utils/responsive_check.dart';
import 'package:tomisha_test_app/widgets/registration_button.dart';

Widget openingSection(BuildContext context) {
    return Container(
                      height: 659,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color(0xffEBF4FF),
                        Color(0xffE6FFFA)
                      ])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex:
                                  ResponsiveWidget.isDesktop(context) ? 1 : 0,
                              child: Container()),
                          Expanded(
                            flex: ResponsiveWidget.isDesktop(context) ? 1 : 0,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Visibility(
                                    visible:
                                        ResponsiveWidget.isDesktop(context),
                                    child: Text(
                                      'Deine Job \nwebsite',
                                      style: GoogleFonts.lato(
                                          fontSize: 65,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 52,
                                  ),
                                  Visibility(
                                      visible:
                                          ResponsiveWidget.isDesktop(context),
                                      child: registrationButton())
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: ResponsiveWidget.isDesktop(context) ? 1 : 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 80),
                                  child: Visibility(
                                    visible:
                                        ResponsiveWidget.isMobile(context),
                                    child: Text(
                                      'Deine Job \nwebsite',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.lato(
                                          fontSize: 65,
                                          fontWeight:
                                              ResponsiveWidget.isDesktop(
                                                      context)
                                                  ? FontWeight.bold
                                                  : FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 80),
                                  child: Container(
                                    height:
                                        ResponsiveWidget.isDesktop(context)
                                            ? 255
                                            : 300,
                                    width: ResponsiveWidget.isDesktop(context)
                                        ? 455
                                        : MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      shape:
                                          ResponsiveWidget.isMobile(context)
                                              ? BoxShape.rectangle
                                              : BoxShape.circle,
                                      color:
                                          ResponsiveWidget.isMobile(context)
                                              ? Colors.transparent
                                              : Colors.white,
                                      image: DecorationImage(
                                        fit: ResponsiveWidget.isDesktop(
                                                context)
                                            ? BoxFit.contain
                                            : BoxFit.cover,
                                        image: const AssetImage(
                                          'assets/images/handshake.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(flex: 1, child: Container())
                        ],
                      ),
                    );
  }