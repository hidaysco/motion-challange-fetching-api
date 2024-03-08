import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: ()=>{},
      decoration: const InputDecoration(
          hoverColor: Color(0xFF62C172),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusColor: Color(0xFF62C172),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF62C172)))),
    );
  }
}
