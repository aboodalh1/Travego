import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/core/utils/shared/styles/colors.dart';
import 'package:travego/features/hotels/presentation/manger/hotel_cubit.dart';
import 'package:travego/features/hotels/repo/hotels_repo_impl.dart';

import '../../../../../core/utils/network/remote/service_locator.dart';
import '../../../../../core/utils/shared/components/components.dart';
import '../../../../../core/utils/shared/constant.dart';
import '../../../../../core/widgets/hotel/hotels_item/hotels_item.dart';
import '../../../../../core/widgets/hotel/top_hotel_item/top_hotel_item.dart';
import '../../../../../core/widgets/search_text_form/search_text_form_field.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelsCubit(getIt.get<HotelsRepoImpl>())..getAllHotels(token: token),
      child: BlocBuilder<HotelsCubit, HotelsState>(
        builder: (context, state) {
          HotelsCubit cubit = BlocProvider.of<HotelsCubit>(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('سفريات'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: RefreshIndicator(
                color: Colors.white,
                backgroundColor: defaultColor,
                onRefresh: () async {
                  cubit.getAllHotels(token: token);
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SearchTextField(
                              searchController: cubit.searchController,
                              label: 'Search for hotels_screen',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 45,
                              height: 44,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: defaultColor,
                              ),
                              child: const Icon(
                                Icons.filter_list_outlined,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('Top Hotels',
                              style: Theme.of(context).textTheme.bodyLarge),
                          const Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: Text("See All",
                                  style: Theme.of(context).textTheme.labelSmall)),
                        ],
                      ),
                       state is GetHotelsLoading ? SizedBox(
                        width: 20,
                        height: 20,
                        child:  CircularProgressIndicator(
                          color: defaultSecondColor,
                        ),
                      ):
                       state is GetHotelsFailure
                       ? SizedBox(
                        child: Text(state.error),
                      ):TopHotelItem(model: cubit.hotelModel),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text('Hotels',
                              style: Theme.of(context).textTheme.bodyLarge),
                          const Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: Text("See All",
                                  style: Theme.of(context).textTheme.labelSmall)),
                        ],
                      ),
                      state is GetHotelsLoading
                          ? SizedBox(
                        width: 20,
                        height: 20,
                        child:  CircularProgressIndicator(
                          color: defaultSecondColor,
                        ),
                      )
                          : state is GetHotelsFailure
                          ? SizedBox(
                        child: Text(state.error),
                      )
                          : HotelsItem(
                        model: cubit.hotelModel,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
