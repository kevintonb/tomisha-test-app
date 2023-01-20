import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomisha_test_app/utils/responsive_check.dart';
import 'package:tomisha_test_app/widgets/action_button.dart';

Widget customAppBar(BuildContext context) {
    return Positioned(
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
                        ResponsiveWidget.isDesktop(context)
                            ? Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  'Jetzt Klicken',
                                  style: GoogleFonts.lato(
                                    fontSize: 19,
                                    color: const Color(0xff4A5568),
                                  ),
                                ),
                              )
                            : Container(),
                        ResponsiveWidget.isDesktop(context)
                            ? Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: actionButton(),
                              )
                            : Container(),
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
        );
  }