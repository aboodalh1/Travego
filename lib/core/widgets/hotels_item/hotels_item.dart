import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/core/utils/shared/constant.dart';
import 'package:travego/features/hotels/hotel_details/hotel_details.dart';


class HotelsItem extends StatelessWidget {
  const HotelsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var verticalSize = mediaQueryData.size.height;
    var horizontalSize = mediaQueryData.size.width;
    return GestureDetector(
      onTap: () {
        navigateTo(context, const HotelDetails());
      },
      child: SizedBox(
        height: 600,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: verticalSize * 0.135,
              decoration: BoxDecoration(
                  color: isDark ? Colors.blueGrey[900] : Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Image.asset('assets/images/hotel.jpg'),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hotel name',
                            style: Theme.of(context).textTheme.headlineLarge),
                        SizedBox(height: verticalSize * .01,),
                        Expanded(
                          child: Text(
                            'something',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(height: verticalSize * .01,),
                        Row(
                          children: [
                            const Icon(
                              Icons.place,
                            ),
                            Text(
                              'location',
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
          },
        ),
      ),
    );
  }
}
