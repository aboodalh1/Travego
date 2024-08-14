import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/core/utils/shared/constant.dart';
import 'package:travego/model/remote/hotel/hotel_model.dart';

import '../../../../features/hotels/presentation/views/hotel_details/hotel_details.dart';



class HotelsItem extends StatelessWidget {
  final HotelModel model;
  const HotelsItem({
    super.key,
    required this.model
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: model.body!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              navigateTo(context,  HotelDetails(model: model.body![index],));

            },
            child: Container(
              width: double.infinity,
              height: ScreenSizeUtil.screenHeight * 0.135 <125?125 : ScreenSizeUtil.screenHeight * 0.135,
              decoration: BoxDecoration(
                  color: isDark ? Colors.blueGrey[900] : Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      child: Image.asset('assets/images/hotel.jpg')),
                  const Gap(5),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(model.body![index].hotelName!,
                            style: Theme.of(context).textTheme.headlineMedium),
                        const Gap(10),
                        SizedBox(width: ScreenSizeUtil.screenWidth*0.5,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            model.body![index].description!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const Gap(12),
                        Row(
                          children: [
                            const Icon(
                              Icons.place,
                            ),
                            Text(
                              model.body![index].country!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
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
