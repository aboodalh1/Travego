import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/core/widgets/custom_progress_indicator/custom_progress_indicator.dart';
import 'package:travego/core/widgets/passenger_card/passenger_card.dart';
import '../../../../../core/utils/network/remote/service_locator.dart';
import '../../../../../core/utils/shared/constant.dart';
import '../../../../../core/widgets/alert_dialog/loading_alert_dialog.dart';
import '../../../../../core/widgets/loading_failure_widget/loading_failure_widget.dart';
import '../../../repo/passengers_repo/passengers_repo_impl.dart';
import '../../manger/passenger/passenger_cubit.dart';
import 'add_passenger.dart';

class PassengersScreen extends StatelessWidget {
  const PassengersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PassengerCubit(getIt.get<PassengersRepoImpl>())
        ..getAllPassengers(token: token),
      child: BlocConsumer<PassengerCubit, PassengerStates>(
        listener: (context, state) {
          if (state is PassengersErrorState) {
            BlocProvider.of<PassengerCubit>(context).isError = true;
          }
          if (state is GetPassengersSuccess) {
            BlocProvider.of<PassengerCubit>(context).isError = false;
          }
          if (state is RemovePassenger) {
            BlocProvider.of<PassengerCubit>(context)
                .getAllPassengers(token: token);
          }
        },
        builder: (context, state) {
          final passengerCubit = BlocProvider.of<PassengerCubit>(context);
          if (state is PassengersErrorState && state.error == '404') {
            return ErrorLoadingScreen(
              refreshFunction: () async {
                passengerCubit.getAllPassengers(token: token);
              },
              appBarTitle: 'Add Passengers information'.tr,
              centerTitle: 'There is No passenger yet!',
              buttonTitle: 'Add Passenger',
              onButtonPressed: () {
                navigateTo(context, AddPassengerScreen());
              },

            );
          }
          if(state is RemovePassengerLoading){
            return const Scaffold(body: LoadingAlertDialog(),);
          }
          if (state is PassengersErrorState && state.error != '404') {
            return PassengerErrorLoading(passengerCubit: passengerCubit,error: state.error,);
          }
          if (state is GetPassengerLoading) {
            return const CustomProgressIndicator();
          }
          return Scaffold(
              appBar: AppBar(
                title: Text('Add Passengers information'.tr),
              ),
              body: RefreshIndicator(
                color: Colors.white,
                backgroundColor: defaultColor,
                onRefresh: () async {
                  passengerCubit.getAllPassengers(token: token);
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => PassengerCard(
                              passengerFirstName: passengerCubit
                                  .passengersModel!.body[index].firstName!,
                              passengerLastName: passengerCubit
                                  .passengersModel!.body[index].lastName!,
                              fatherName: passengerCubit
                                  .passengersModel!.body[index].fatherName!,
                              motherName: passengerCubit
                                  .passengersModel!.body[index].motherName!,
                              birthDate: passengerCubit
                                  .passengersModel!.body[index].birthdate!,
                              passengerGender: passengerCubit
                                  .passengersModel!.body[index].gender!,
                              id: passengerCubit
                                  .passengersModel!.body[index].id!,
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: ScreenSizeUtil.screenHeight * .01,
                            ),
                            itemCount:
                                passengerCubit.passengersModel!.body.length,
                          ),
                        ),
                        SizedBox(
                          width: ScreenSizeUtil.screenWidth*0.8,
                          child: DefaultElevated(
                            onPressed: () {
                              navigateTo(context, AddPassengerScreen());
                            },
                            fill: false,
                            label: "Add Peron",
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}

class PassengerErrorLoading extends StatelessWidget {
  const PassengerErrorLoading({
    super.key,
    required this.passengerCubit,
    required this.error,
  });

  final PassengerCubit passengerCubit;
  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Passengers information'.tr),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RefreshIndicator(
            color: Colors.white,
            backgroundColor: defaultColor,
            onRefresh: () async {
              passengerCubit.getAllPassengers(token: token);
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                height: ScreenSizeUtil.screenHeight*0.7,
                child: Center(
                  child: Column(
                    children: [
                      Text(error),
                      TextButton(
                        onPressed: () {
                          navigateTo(context, AddPassengerScreen());
                        },
                        child: Text(
                          'Add Passenger',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
