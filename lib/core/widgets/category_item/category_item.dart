import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import '../../../model/categories.dart';
import '../../utils/shared/components/components.dart';

class CategoriesItems extends StatelessWidget {
  CategoriesItems({
    super.key,
    categories
  });

  List<Cat> categories = const[
  Cat(title: "Adventure",icon:Icon(Icons.travel_explore_outlined,color: Colors.white,),),
  Cat(title:"Beach" ,icon:Icon(Icons.beach_access,color: Colors.white),),
  Cat(title:"Cultural", icon:Icon(Icons.science,color: Colors.white),),
  Cat(title:"Ecotourism", icon:Icon(Icons.business_center,color: Colors.white),),
  Cat(title:"Family",icon:Icon(Icons.family_restroom,color: Colors.white)),
  ];
  @override
  Widget build(BuildContext context) {
  return SizedBox(
  height: 60,
  child: ListView.separated(
  scrollDirection: Axis.horizontal,
  separatorBuilder: (context, index) => const SizedBox(
  width: 10,
  ),
  itemCount: categories.length,
  shrinkWrap: true,
  itemBuilder: (context, index) {
  return Container(
  width: 150,
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
  child: categories[index].icon
  ),
  const SizedBox(
  width: 2,
  ),
  Expanded(
    child: Text(
    categories[index].title,
    style: GoogleFonts.inter(
    fontSize: 14, fontWeight: FontWeight.w600),
    ),
  ),
  ],
  ),
  );
  },
  ),
  );
  }
}
