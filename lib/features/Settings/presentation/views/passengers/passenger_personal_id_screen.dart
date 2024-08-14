import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/widgets/circled_form_field/circled_form_field.dart';
import 'package:travego/features/Settings/presentation/manger/passenger/passenger_cubit.dart';


import '../../../../../core/utils/network/remote/service_locator.dart';
import '../../../../../core/utils/shared/constant.dart';
import '../../../repo/passengers_repo/passengers_repo_impl.dart';

class PassengerPersonalIdScreen extends StatelessWidget {
  const PassengerPersonalIdScreen({super.key, required this.id,required this.name});
  final num id;
  final String name;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PassengerCubit(getIt.get<PassengersRepoImpl>())..getPassengerPersonalId(token: token, id: id),
      child: BlocConsumer<PassengerCubit, PassengerStates>(
        listener: (context, state) {
          if(state is PassengerAddInfoSuccess){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message)));
          }
        },
        builder: (context, state) {
          PassengerCubit passengerCubit =
          BlocProvider.of<PassengerCubit>(context);
          if(state is PassengerAddInfoError){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AlertDialog(
                  title: Text(state.error =='404' ? '$name didn\'t add Personal ID yet' : 'something went wrong'),
                  content: Center(child: DefaultElevated(label: 'add Personal ID', fill: true, onPressed:(){
                    showDialog(context: context, builder: (context)=>AddPersonalIDWidget(id:id,name: name, passengerCubit: passengerCubit));
                  }),),
                ),
              ],
            );
          }
          return AddPersonalIDWidget(name: name, passengerCubit: passengerCubit, id: id);
        },
      ),
    );
  }
}

class AddPersonalIDWidget extends StatelessWidget {
  const AddPersonalIDWidget({
    super.key,
    required this.name,
    required this.passengerCubit,
    required this.id,
  });

  final String name;
  final PassengerCubit passengerCubit;
  final num id;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlertDialog(
          title: Row(
            children: [
              Text('$name Personal id'),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: (){
                  passengerCubit.deletePassengerPersonalID(token: token, id: id);
                  if(Navigator.canPop(context)) {Navigator.pop(context);}

                },
              )
            ],
          ),
          content: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text(
                  'Id first name',
                ),
                const Gap(5),
                defaultCircleTextField(
                    controller: passengerCubit.idFirstName,
                    fill: false,
                    hintText: 'id first name',
                    secure: false),
                const Gap(15),
                const Text(
                  'Id last name',
                ),
                const Gap(5),
                defaultCircleTextField(
                    controller: passengerCubit.idLastName,
                    fill: false,
                    hintText: 'id last name',
                    secure: false),
                const Gap(15),
                const Text(
                  'Id birthday',
                ),
                const Gap(5),
                defaultCircleTextField(
                    controller: passengerCubit.idBirthDate,
                    fill: false,
                    hintText: 'id birthday',
                    secure: false),
                const Gap(15),
                const Text(
                  'Id nationality',
                ),
                const Gap(5),
                defaultCircleTextField(
                    controller: passengerCubit.idNationality,
                    fill: false,
                    hintText: 'nationality',
                    secure: false),
                const Gap(15),

                DefaultElevated(label: 'save', fill: true, onPressed: () {
                  passengerCubit.addPassengerPersonalId(
                      idfirstName: passengerCubit.idFirstName.text,
                      idlastName: passengerCubit.idLastName.text,
                      idBirthDate: passengerCubit.idBirthDate.text,
                      nationality: passengerCubit.idNationality.text,
                      passengerId: id,
                      token: token);
                })
              ],
            ),
          ),
        ),
      ],
    );
  }
}
