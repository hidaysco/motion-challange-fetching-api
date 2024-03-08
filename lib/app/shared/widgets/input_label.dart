import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LabelField extends StatelessWidget {
  String title = '';
  LabelField(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold, color: const Color(0xFF333333)),
    );
  }
}
