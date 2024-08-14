import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/core/utils/shared/constant.dart';
import 'package:travego/features/home/presentation/view/trip_details/trip_details.dart';
import 'package:travego/features/hotels/presentation/views/hotel_details/hotel_details.dart';

import '../../../../../model/remote/favorite/favorite_model.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({
    super.key,
    required this.model,
    required this.isTrip,
  });

  final FavoriteModel model;
  final bool isTrip;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        itemCount: isTrip ? model.body.trips.length : model.body.hotels.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                navigateTo(
                    context, isTrip ? TripDetailScreen(model: model.body.trips[index]): HotelDetails(model: model.body.hotels[index]));
                },
              child: customGroupItem(context, model, index,isTrip));
        },
      ),
    );
  }

  Container customGroupItem(context, FavoriteModel model,int index,bool isTrip) {
    return Container(
      width: double.infinity,
      height: ScreenSizeUtil.screenHeight * 0.135 < 125
          ? 125
          : ScreenSizeUtil.screenHeight * 0.135,
      decoration: BoxDecoration(
          color: isDark ? Colors.blueGrey[900] : Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
              child: Image.asset(isTrip?'assets/images/group1.png':'assets/images/hotel.jpg')),
          const Gap(5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(isTrip? model.body.trips[index].tripName:model.body.hotels[index].hotelName,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
                const Gap(5),
                Expanded(
                  child: Text(
                    isTrip? model.body.trips[index].country : model.body.hotels[index].country,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const Gap(12),
                Row(
                  children: [
                    const Icon(
                      Icons.place,
                    ),
                    SizedBox(
                      width: ScreenSizeUtil.screenWidth * 0.45,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        isTrip? model.body.trips[index].tripDescription : model.body.hotels[index].description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
