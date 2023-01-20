import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget registrationButton() {
    return Container(
      // height: 40,
      width: 320,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
              colors: [Color(0xff319795), Color(0xff3182CE)])),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 17),
        child: Center(
          child: Text(
            'Kostenlos Registrieren',
            style: GoogleFonts.lato(
              fontSize: 17,
              color: const Color(0xffE6FFFA),
            ),
          ),
        ),
      ),
    );
  }