import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travego/core/widgets/group_trip_item/group_trip_item.dart';
import 'package:travego/features/favorite/manger/favorite_cubit.dart';

import 'manger/favorite_state.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => FavoriteCubit(),
      child: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context,state){},
        builder: (context,state)=> Scaffold(
          appBar: AppBar(
            title:
                Text('Favorite'.tr, style: Theme.of(context).textTheme.bodyMedium),
          ),
          body: GroupTripItem()),
      ),
    );
  }
}
