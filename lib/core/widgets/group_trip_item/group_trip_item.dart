import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
// ignore: depend_on_referenced_packages
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/utils/shared/constant.dart';

class GroupTripItem extends StatelessWidget {
  const GroupTripItem({
    super.key,
  });

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
        itemCount: 6,
        itemBuilder: (context, index) {
          return customGroupItem(context);
        },
      ),
    );
  }

  Container customGroupItem(context) {
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
                    Expanded(
                      child: Text('Mountain Trip',
                          overflow: TextOverflow.ellipsis,
                          style:  Theme.of(context).textTheme.headlineMedium),
                    ),
                    const Gap(5),
                    Expanded(
                      child: Text(
                        'Seelisburg',
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
  }
}
