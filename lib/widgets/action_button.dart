import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Widget actionButton() {
    return OutlinedButton(
      onPressed: () {
        HapticFeedback.lightImpact();
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Text(
          'Kostenlos Registrieren',
          style: GoogleFonts.lato(
            fontSize: 14,
            color: const Color(0xff319795),
          ),
        ),
      ),
    );
  }