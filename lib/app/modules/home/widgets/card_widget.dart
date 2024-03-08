import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_challange/app/data/model/request_vegetable_model.dart';
import 'package:motion_challange/app/shared/widgets/input_label.dart';

class CardWidget extends StatelessWidget {
  RequestVegetable requestVegetable;
  CardWidget(this.requestVegetable, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            child: Image.network(
              '${requestVegetable.foto_url}',
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelField('${requestVegetable.name}'),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${requestVegetable.currentStatus ?? 'Proses'}',
                  style: GoogleFonts.poppins(color: const Color(0xFFF99500)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                          // minimumSize: MaterialStatePropertyAll(Size(80, 50)),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 25)),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFF74DA74)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))))),
                      child: Text(
                        'Detail',
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
