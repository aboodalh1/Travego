import 'package:flutter/material.dart';
import 'package:travego/core/utils/screen_size_util.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/model/all_trips_model.dart';
import '../../../features/home/presentation/manger/trips_cubit/trips_cubit.dart';
import '../../../features/home/presentation/view/trip_details/trip_details.dart';
import '../../utils/assets.dart';
import '../../utils/shared/components/components.dart';
import '../../utils/shared/constant.dart';

class AvailableTripItems extends StatelessWidget {
  final bool isFavorite = false;
  final AllTripsModel model;
  final TripsCubit tripCubit;

  const AvailableTripItems(
      {super.key, required this.tripCubit, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSizeUtil.screenHeight * .003002 < 250
          ? 250
          : ScreenSizeUtil.screenHeight * .32,
      child: model.body.isNotEmpty
          ? ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: model.body.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    navigateTo(
                        context,
                        TripDetailScreen(
                          model: model.body[index],
                        ));
                  },
                  child: Container(
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
                                scale: 0.85,
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
                                  model.body[index].tripName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Color(0XFFE1D800),
                                    size: 18,
                                  ),
                                  Text(
                                    model.body[index].isPrivate,
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_sharp,
                              size: 22,
                            ),
                            Text(
                              model.body[index].country,
                              style: Theme.of(context).textTheme.labelSmall,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5),
                          child: Row(
                            children: [
                              Text(
                                '${model.body[index].price.toString()} \$',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const Spacer(),
                              GestureDetector(
                                child: Icon(
                                  size: 30,
                                  model.body[index].isFavourite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: defaultColor,
                                ),
                                onTap: () {
                                  if (model.body[index].isFavourite) {
                                    tripCubit.removeTripFromFavorite(
                                        token: token,
                                        id: model.body[index].tripId);
                                    tripCubit.getAllTrips();
                                  } else {
                                    tripCubit.addTripToFavorite(
                                        token: token,
                                        id: model.body[index].tripId);
                                    tripCubit.getAllTrips();
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Sorry we don\'t have Available Trip now \n \n Let\'s create your own trip (:',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 30,
                    width: 80,
                    child: DefaultElevated(
                        label: 'Create', fill: false, onPressed: () {}))
              ],
            )),
    );
  }
}
