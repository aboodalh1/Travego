import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/network/remote/service_locator.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/core/widgets/reservation/add_passenger_card/add_passenger_card.dart';
import 'package:travego/features/reservation/presentation/manger/reserve_trip_cubit.dart';
import 'package:travego/features/reservation/repo/reserve_trip_repo_impl.dart';

import '../../../../core/utils/shared/constant.dart';


class ReserveTripScreen extends StatelessWidget {
  const ReserveTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReserveTripCubit(getIt.get<ReserveTripRepoImpl>())..getAllPassengers(token: token),
      child: BlocConsumer<ReserveTripCubit, ReserveTripState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          ReserveTripCubit reserveTripCubit = BlocProvider.of<ReserveTripCubit>(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckboxListTile(onChanged: (value) {
                    reserveTripCubit.addClientToReserve();
                  },
                    value: false,
                    title: Text('Me',style: Theme.of(context).textTheme.headlineLarge,),
                  ),
                  const Divider(color: Colors.grey,),
                  SizedBox(
                    height: ScreenSizeUtil.screenHeight*reserveTripCubit.passengerInfoModel.body!.length * 0.08,
                    child: ListView.separated(itemBuilder: (context, index) {
                      return CheckboxListTile(onChanged: (value) {},
                        value: false,
                        title: Text(
                            style: Theme.of(context).textTheme.headlineLarge,
                            '${reserveTripCubit.passengerInfoModel.body![index].firstName!} ${reserveTripCubit.passengerInfoModel.body![index].lastName!}'),
                      );
                    },
                        separatorBuilder: (context, index) {
                          return const Divider(color: Colors.black54,);
                        },
                        itemCount: reserveTripCubit.passengerInfoModel.body!.length
                    ),
                  ),
                  Gap(10),
                  Text("Added Passenger:",style: Theme.of(context).textTheme.labelMedium,),
                  SizedBox(
                    height: ScreenSizeUtil.screenHeight*reserveTripCubit.personnes!.length * 0.05,
                    child: ListView.separated(itemBuilder: (context, index) {
                      return CheckboxListTile(onChanged: (value) {},
                        value: false,
                        title:  Text('passengerName'),
                      );
                    },
                        separatorBuilder: (context, index) {
                          return const Divider(color: Colors.black54,);
                        },
                        itemCount: reserveTripCubit.passengerInfoModel.body!.length
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(15),
                    child: DefaultElevated(
                        label: "Add Passenger", fill: false, onPressed: () {
                          print(reserveTripCubit.personnes?.length);
                      navigateTo(context,  AddPassengerCardToReserve(reserveTripCubit: reserveTripCubit,));
                    }),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
