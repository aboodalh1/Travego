import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/core/utils/shared/constant.dart';

class GroupTripItem extends StatelessWidget {
  const GroupTripItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var verticalSize = mediaQueryData.size.height;
    var horizontalSize = mediaQueryData.size.width;
    return SizedBox(
      width: double.infinity,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
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
                Image.asset('assets/images/group1.png'),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mountain Trip',
                          style:  Theme.of(context).textTheme.headlineLarge),
                      SizedBox(height: verticalSize*0.01),
                      Expanded(
                        child: Text(
                          'Seelisburg',
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
                            'Mountain Trip',
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
    );
  }
}
