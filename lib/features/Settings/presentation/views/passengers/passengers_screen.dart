import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/core/widgets/passenger_card/passenger_card.dart';
import 'package:travego/core/widgets/person_card/person_card.dart';
import 'package:travego/features/Settings/presentation/manger/settings_cubit.dart';

import '../../../../../core/utils/network/remote/service_locator.dart';
import '../../../repo/passengers_repo/passengers_repo_impl.dart';
import '../../manger/passenger/passenger_cubit.dart';

class PassengersScreen extends StatelessWidget {
  const PassengersScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PassengerCubit(getIt.get<PassengersRepoImpl>()),
      child: BlocConsumer<PassengerCubit, PassengerStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final passengerCubit = BlocProvider.of<PassengerCubit>(context);
          return Scaffold(
              appBar: AppBar(
                title: Text('Add Passengers information'.tr),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => const PassengerCard(),
                        separatorBuilder: (context, index) =>
                            SizedBox(
                              height: ScreenSizeUtil.screenHeight * .01,
                            ),
                        itemCount: passengerCubit.personNumber,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                passengerCubit.addPassenger();
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey,
                                          style: BorderStyle.solid)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Add person'.tr,
                                        textAlign: TextAlign.center,
                                      ),
                                      const Icon(Icons.add)
                                    ],
                                  )),
                            ),
                          ),
                          Spacer(),
                          Container(
                              color: defaultColor,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Text(
                                    'Save',
                                    style: TextStyle(color: Colors.white),
                                  )))
                        ],
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
