import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/network/remote/service_locator.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/widgets/group_trip_item/group_trip_item.dart';
import 'package:travego/core/widgets/top_trip_item/available_trip_item.dart';
import 'package:travego/core/widgets/category_item/category_item.dart';
import 'package:travego/features/home/presentation/manger/trips_cubit/trips_cubit.dart';
import 'package:travego/features/home/presentation/view/widgets/filter_button.dart';
import 'package:travego/features/home/presentation/view/widgets/home_app_bar.dart';
import 'package:travego/features/home/repo/trips_repo/trips_repo_impl.dart';
import 'package:travego/translations/locale_keys.g.dart';
import '../../../../core/utils/shared/components/components.dart';
import '../../../../core/widgets/search_text_form/search_text_form_field.dart';
import '../manger/home_cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => TripsCubit(getIt.get<TripsRepoImpl>())
            ..getAllTrips()
            ..getAvailableTrip(),
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final homeCubit = BlocProvider.of<HomeCubit>(context);
          final tripsCubit = BlocProvider.of<TripsCubit>(context);
          return RefreshIndicator(
            color: defaultColor,
            onRefresh: () async {
              tripsCubit.getAllTrips();
              tripsCubit.getAvailableTrip();
            },
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const HomeAppBar(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: SearchTextField(
                                  searchController: homeCubit.searchController,
                                  label: LocaleKeys.SearchForDestination.tr(),
                                ),
                              ),
                              FilterButton(homeCubit1: homeCubit),
                            ],
                          ),
                          const Gap(10),
                          Text(LocaleKeys.Categories.tr(),
                              style: Theme.of(context).textTheme.headlineLarge),
                          const Gap(10),
                          CategoriesItems(
                            cubit: tripsCubit,
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              Text(LocaleKeys.availableTrip.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge),
                              const Spacer(),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(LocaleKeys.seeAll.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall)),
                            ],
                          ),
                          BlocBuilder<TripsCubit, TripsState>(
                              builder: (context, state) {
                            if (state is GetAvailableTripLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is GetAvailableTripFailure) {
                              return TryAgainWidget(
                                  tripsCubit: tripsCubit,
                                  error: state.errMessage);
                            } else {
                              return AvailableTripItems(
                                tripCubit: tripsCubit,
                                model: tripsCubit.availableTripModel,
                              );
                            }
                          }),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(LocaleKeys.topTrips.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge),
                              const Spacer(),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(LocaleKeys.seeAll.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall)),
                            ],
                          ),
                          BlocBuilder<TripsCubit, TripsState>(
                              builder: (context, state) {
                            if (state is GetAvailableTripLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is GetAvailableTripFailure) {
                              return TryAgainWidget(
                                  tripsCubit: tripsCubit,
                                  error: state.errMessage);
                            } else {
                              return TopTripsItem(
                                tripsCubit: tripsCubit,
                                model: tripsCubit.allTripModel,
                              );
                            }
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TryAgainWidget extends StatelessWidget {
  const TryAgainWidget({
    super.key,
    required this.tripsCubit,
    required this.error,
  });

  final TripsCubit tripsCubit;
  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            error,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10),
            child: DefaultElevated(
              onPressed: () {
                tripsCubit.getAllTrips();
              },
              label: "Try again",
              fill: true,
            ),
          )
        ],
      ),
    );
  }
}
