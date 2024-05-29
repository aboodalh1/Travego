import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travego/core/widgets/group_trip_item/group_trip_item.dart';
import 'package:travego/core/widgets/top_trip_item/top_trip_item.dart';
import 'package:travego/core/widgets/category_item/category_item.dart';
import 'package:travego/features/wallet/wallet_screen/wallet_screen.dart';
import '../../../../core/utils/shared/components/components.dart';
import '../../../../core/widgets/search_text_form/search_text_form_field.dart';
import '../manger/home_cubit/home_cubit.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final homeCubit = BlocProvider.of<HomeCubit>(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('سفريات'),
              actions: [
                GestureDetector(
                  onTap: () {
                    navigateTo(context, WalletScreen());
                  },
                  child: const Icon(Icons.wallet),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('543543'),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: HexColor('E9E9E9')),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: SearchTextField(
                              searchController: homeCubit.searchController,
                              label: 'Search for Trip',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: SizedBox(
                                      width: 200,
                                      height: 200,
                                      child: Column(
                                        children: [
                                          Text('Search filtering'),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            width: 45,
                            height: 44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: defaultColor,
                            ),
                            child: const Icon(
                              Icons.filter_list_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    Text('Categories'.tr,
                        style: Theme.of(context).textTheme.bodyLarge),
                    const Gap(10),
                    CategoriesItems(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Top Trips',
                            style: Theme.of(context).textTheme.bodyLarge),
                        const Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: Text("See All",
                                style: Theme.of(context).textTheme.labelSmall)),
                      ],
                    ),
                    const TopTripsItem(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Top Trips',
                            style: Theme.of(context).textTheme.bodyLarge),
                        const Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: Text("See All",
                                style: Theme.of(context).textTheme.labelSmall)),
                      ],
                    ),
                    const GroupTripItem(),
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
