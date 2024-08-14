import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:travego/core/utils/network/remote/service_locator.dart';
import 'package:travego/core/widgets/alert_dialog/loading_alert_dialog.dart';
import 'package:travego/features/favorite/presentation/view/widgets/favorite_list.dart';
import 'package:travego/features/favorite/presentation/manger/favorite_cubit.dart';
import 'package:travego/features/favorite/presentation/manger/favorite_state.dart';
import 'package:travego/features/favorite/repo/favorite_repo_impl.dart';

import '../../../../core/widgets/loading_failure_widget/loading_failure_widget.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => FavoriteCubit(getIt.get<FavoriteRepoImpl>())..getFavorite(),
      child: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context,state){
          if(state is FavoriteLoading){
          showDialog(context: context, builder: (context) => const LoadingAlertDialog());
          }

        },
        builder: (context,state){
          FavoriteCubit cubit = BlocProvider.of<FavoriteCubit>(context);
          if(state is GetFavoriteError){
            Get.snackbar('Error'.tr, state.error.tr);
            return ErrorLoadingScreen(
                centerTitle: state.error,
                appBarTitle: 'Favorite Screen',
                buttonTitle: 'Try again',
                onButtonPressed: (){
                  cubit.getFavorite();
                },
                refreshFunction: ()async{
                  cubit.getFavorite();
                });
          }
          return Scaffold
        (
          appBar: AppBar(
            title:
                Text('Favorite Trips & Hotels'.tr, style: Theme.of(context).textTheme.headlineLarge),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Favorite Trips",style: Theme.of(context).textTheme.headlineLarge,),
                const Gap(10),
                FavoriteList(model: cubit.favoriteModel,isTrip: true,),
                Text("Favorite Hotels",style: Theme.of(context).textTheme.headlineLarge,),
                const Gap(10),
                FavoriteList(model: cubit.favoriteModel,isTrip: false,),
              ],
            ),
          )
        );
        }
      ),
    );
  }
}
