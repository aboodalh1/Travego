import 'package:flutter/material.dart';
import 'package:travego/core/utils/screen_size_util.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import '../../../features/home/presentation/view/trip_details/trip_details.dart';
import '../../utils/assets.dart';
import '../../utils/shared/components/components.dart';
import '../../utils/shared/constant.dart';

class TopTripsItem extends StatelessWidget {
  final bool isFavorite= false;
  const TopTripsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ScreenSizeUtil.initSize(context);
    return GestureDetector(
      onTap: () {
        navigateTo(context, const TripDetailScreen());
      },
      child: SizedBox(
        height: ScreenSizeUtil.screenHeight *.28,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          itemCount: 15,
          itemBuilder: (context, index) {
            return Container(
              width: 160,
              decoration: BoxDecoration(
                  color: isDark ? Colors.blueGrey[900] : Colors.white,
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          AssetsData.trips,
                          fit: BoxFit.fill,
                        )),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Lakesfdfddffdfs',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0XFFE1D800),
                              size: 20,
                            ),
                            Text(
                              '4.5',
                              style: Theme.of(context).textTheme.labelMedium,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_sharp,
                        size: 22,
                      ),
                      Text(
                        'location',
                        style: Theme.of(context).textTheme.labelSmall,
                      )
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                    child: Row(
                      children: [
                        Text(
                          '\$40/ visit',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const Spacer(),
                        Icon(
                          isFavorite? Icons.favorite:Icons.favorite_border,
                          size: 30,
                          color: defaultColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
