import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/features/home/presentation/manger/trips_cubit/trips_cubit.dart';
import 'package:travego/features/home/presentation/view/category_trip/category_trip_screen.dart';
import '../../../model/categories.dart';
import '../../../translations/locale_keys.g.dart';
import '../../utils/shared/components/components.dart';

class CategoriesItems extends StatelessWidget {
   CategoriesItems({super.key, categories,required this.cubit});
  final TripsCubit cubit;
  final List<Cat> categories =  [
    Cat(
      title: "Adventure",
      showTitle: LocaleKeys.Adventure.tr(),
      icon: const Icon(
        Icons.travel_explore_outlined,
        color: Colors.white,
      ),
    ),
    Cat(
      showTitle: LocaleKeys.Beach.tr(),
      title: "Beach",
      icon: const Icon(Icons.beach_access, color: Colors.white),
    ),
    Cat(
      showTitle: LocaleKeys.Cultural.tr(),
      title: "Cultural",
      icon: const Icon(Icons.science, color: Colors.white),
    ),
    Cat(
      showTitle: LocaleKeys.Ecotourism.tr(),
      title: "Ecotourism",
      icon: const Icon(Icons.business_center, color: Colors.white),
    ),
    Cat(
      showTitle: LocaleKeys.Family.tr(),
        title: "Family",
        icon: const Icon(Icons.family_restroom, color: Colors.white)),
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
          return GestureDetector(
            onTap: (){
              navigateTo(context, CategoryTripScreen(category: categories[index].title,tripsCubit: cubit,));
            },
            child: Container(
              width: ScreenSizeUtil.screenWidth*0.37,
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
                      child: categories[index].icon),
                  const SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      categories[index].showTitle,
                      style: GoogleFonts.inter(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
