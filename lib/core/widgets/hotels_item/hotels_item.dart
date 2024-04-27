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
    return GestureDetector(
      onTap: () {
        navigateTo(context, HotelDetails());
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
              height: 133,
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
                            style: Theme.of(context).textTheme.bodyLarge),
                        Text(
                          'something',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
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
