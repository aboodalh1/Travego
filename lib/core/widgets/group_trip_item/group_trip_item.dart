import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
// ignore: depend_on_referenced_packages
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/core/utils/shared/constant.dart';
import 'package:travego/features/home/presentation/manger/trips_cubit/trips_cubit.dart';
import 'package:travego/features/home/presentation/view/trip_details/trip_details.dart';

import '../../../model/all_trips_model.dart';

class TopTripsItem extends StatelessWidget {
  const TopTripsItem({
    super.key,
    required this.tripsCubit,
    required this.model
  });
  final TripsCubit tripsCubit;
  final AllTripsModel model;
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
        itemCount: model.body.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: (){navigateTo(context, TripDetailScreen(model: model.body[index]));},
              child: customTripItem(context,model,index));
        },
      ),
    );
  }

  Container customTripItem(context,AllTripsModel model,int index) {
    return Container(
          width: double.infinity,
          height: ScreenSizeUtil.screenHeight * 0.135 <125?125 : ScreenSizeUtil.screenHeight * 0.135,
          decoration: BoxDecoration(
              color: isDark ? Colors.blueGrey[900] : Colors.white,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Image.asset('assets/images/group1.png'),
              const Gap(5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width:ScreenSizeUtil.screenWidth*0.5 < 200?200 : ScreenSizeUtil.screenWidth*0.5,
                      child: Text(model.body[index].tripName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style:  Theme.of(context).textTheme.headlineMedium),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: ScreenSizeUtil.screenWidth * 0.5 < 200?200 : ScreenSizeUtil.screenWidth * 0.5,
                      child: Text(
                        model.body[index].tripCategory,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.place,
                        ),
                        Text(
                          model.body[index].country,
                          style: Theme.of(context).textTheme.bodyMedium,
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
