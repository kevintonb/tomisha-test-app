import 'package:flutter/material.dart';
import 'package:tomisha_test_app/utils/responsive_check.dart';
import 'package:tomisha_test_app/widgets/registration_button.dart';

Widget bottomSheetWithRegistration(BuildContext context) {
    return Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, -1),
                                        blurRadius: 5,
                                        color: Colors.grey.withOpacity(0.5))
                                  ]),
                              child: Column(
                                children: [
                                  ResponsiveWidget.isMobile(context)
                                      ? Padding(
                                          padding: const EdgeInsets.only(top: 24),
                                          child: registrationButton(),
                                        )
                                      : Container(),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  const Divider(
                                    color: Color(0xff00000033),
                                  ),
                                ],
                              ),
                            );
  }