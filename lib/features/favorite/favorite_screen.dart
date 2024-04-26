import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travego/core/widgets/group_trip_item/group_trip_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Favorite'.tr, style: Theme.of(context).textTheme.bodyMedium),
      ),
      body: ListView.builder(
          itemBuilder: ((context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                child: GroupTripItem(),
              )),
          itemCount: 10),
    );
  }
}
