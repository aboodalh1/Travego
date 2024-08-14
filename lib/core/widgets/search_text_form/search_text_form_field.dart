import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:travego/core/utils/network/remote/service_locator.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/features/search/presentation/manger/search_cubit.dart';
import 'package:travego/features/search/repo/search_repo_impl.dart';
import 'package:travego/model/remote/search/trip_search_model.dart';

import '../../utils/shared/constant.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.searchController,
    required this.label,
  });

  final TextEditingController searchController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
          return Column(
            children: [
              TextFormField(
                controller: searchController,
                style: Theme.of(context).textTheme.headlineMedium,
                cursorErrorColor: defaultColor,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.headlineLarge,
                  hintText: label.tr,
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                ),
                onChanged: (String val) {
                  searchCubit.searchByTrip(text: val);
                },
              ),
              if (state is SearchLoadingState && searchController.text.isNotEmpty)
                SizedBox(
                    height: ScreenSizeUtil.screenHeight * 0.4,
                    child: const Center(child: CircularProgressIndicator())),
              if (state is SearchSuccessState && searchController.text.isNotEmpty)
                SizedBox(
                  height: ScreenSizeUtil.screenHeight * 0.4,
                  child: ListView.separated(
                      itemBuilder: (context, index) => SearchItems(
                            model: searchCubit.tripSearchModel,
                            searchController: searchController,
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: searchCubit.tripSearchModel.body.length),
                ),
              if (state is SearchFailureState)
                SizedBox(
                  height: ScreenSizeUtil.screenHeight * 0.4,
                  child: Center(child: Text(state.errMessage)),
                )
            ],
          );
        },
      ),
    );
  }
}

class SearchItems extends StatelessWidget {
  const SearchItems({
    super.key,
    required this.model,
    required this.searchController,
  });

  final TripSearchModel model;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: model.body.isEmpty
          ? const Text('No Data Found', style: TextStyle(color: Colors.grey),)
          : ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: model.body.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      // navigateTo(context, TripDetailScreen(model: model.body[index],));
                      // searchController.clear();
                    },
                    child: customGroupItem(context, model, index));
              },
            ),
    );
  }

  Container customGroupItem(context, TripSearchModel model, index) {
    return Container(
      width: double.infinity,
      height: ScreenSizeUtil.screenHeight * 0.13 < 90
          ? 90
          : ScreenSizeUtil.screenHeight * 0.13,
      decoration: BoxDecoration(
          color: isDark ? Colors.blueGrey[900] : Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Image.asset('assets/images/group1.png', scale: 1.4),
          const Gap(5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: ScreenSizeUtil.screenWidth * 0.35,
                  child: Text(model.body[index].tripName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
                const Gap(5),
                Expanded(
                  child: Text(
                    model.body[index].country,
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
                      width: ScreenSizeUtil.screenWidth * 0.30,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        model.body[index].tripDescription,
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
