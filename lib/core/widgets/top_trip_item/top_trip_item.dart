import 'package:flutter/material.dart';
import 'package:travego/features/home/trip_details/trip_details.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import '../../utils/assets.dart';
import '../../utils/shared/components/components.dart';
import '../../utils/shared/constant.dart';

class TopTripsItem extends StatelessWidget {
  const TopTripsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, const TripDetailScreen());
      },
      child: SizedBox(
        height: 260,
        width: double.infinity,
        child: ListView.separated(
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
                        Text(
                          'Lakes',
                          style: GoogleFonts.inter(
                              fontSize: 15, fontWeight: FontWeight.w600),
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
                              style: Theme.of(context).textTheme.bodyMedium,
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
                      ),
                      Text(
                        'location',
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const Text('\$40/ visit'),
                        const Spacer(),
                        Icon(
                          Icons.favorite,
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
