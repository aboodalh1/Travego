import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/network/remote/service_locator.dart';
import 'package:travego/core/widgets/custom_progress_indicator/custom_progress_indicator.dart';
import 'package:travego/features/home/presentation/manger/trips_cubit/trips_cubit.dart';
import 'package:travego/features/home/repo/trips_repo/trips_repo_impl.dart';
import 'package:travego/model/remote/trip/trips_cat_model.dart';

import '../../../../../core/utils/screen_size_util.dart';
import '../../../../../core/utils/shared/components/components.dart';
import '../../../../../core/utils/shared/constant.dart';
import '../../../../../core/widgets/loading_failure_widget/loading_failure_widget.dart';
import '../trip_details/trip_details.dart';

class CategoryTripScreen extends StatelessWidget {
  const CategoryTripScreen({super.key,required this.category,required this.tripsCubit});
 final String category;
 final TripsCubit tripsCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => TripsCubit(getIt.get<TripsRepoImpl>())..getTripByCat(category: category),
  child: BlocBuilder<TripsCubit, TripsState>(
    builder: (context, state) {
      TripsCubit tripsCubit = BlocProvider.of<TripsCubit>(context);
      if(state is GetAllTripsFailure){
      return ErrorLoadingScreen(
        centerTitle: state.error,
        appBarTitle: 'Category Trip',
        buttonTitle: 'Try again',
        onButtonPressed: () {
          tripsCubit.getTripByCat(category: category);
        },
        refreshFunction: () async{
          tripsCubit.getTripByCat(category: category);
        },
      );
      }
      if(state is GetTripByCatLoading){
        return const CustomProgressIndicator();
      }
      return Scaffold(
        appBar: AppBar(
          title: const Text('Category Trip'),
        ),
        body: CategoryTripList(model: tripsCubit.tripByCatModel,),
      );
    },
    ),
);
  }
}


class CategoryTripList extends StatelessWidget {
  const CategoryTripList({
    super.key,
    required this.model,
    
  });

  final TripByCatModel model;

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
        itemCount:  model.body.length ,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                navigateTo(
                    context,  TripDetailScreen(model: model.body[index]));
              },
              child: customGroupItem(context, model, index));
        },
      ),
    );
  }

  Container customGroupItem(context, TripByCatModel model,int index) {
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
              child: Image.asset('assets/images/group1.png')),
          const Gap(5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(model.body[index].tripName,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
                const Gap(5),
                Expanded(
                  child: Text(
                    model.body[index].country ,
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
                         model.body[index].tripDescription ,
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
