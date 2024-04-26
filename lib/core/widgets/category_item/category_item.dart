import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import '../../utils/shared/components/components.dart';

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: 15,
        itemBuilder: (context, index) {
          return Container(
            width: 140,
            decoration: BoxDecoration(
                border: Border.all(
                  color: defaultColor,
                ),
                borderRadius: BorderRadius.circular(40)),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 29,
                  backgroundColor: defaultColor,
                  child: const Icon(
                    Icons.access_alarm,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Lakes',
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
