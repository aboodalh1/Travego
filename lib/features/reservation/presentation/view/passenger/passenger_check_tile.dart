import 'package:flutter/material.dart';
import '../../../../../core/utils/shared/constant.dart';
import '../../manger/reserve_trip_cubit.dart';

class PassengerCheckTile extends StatefulWidget {
  const PassengerCheckTile({
    super.key,
    required this.reserveTripCubit,
    required this.index,
  });

  final int index;
  final ReserveTripCubit reserveTripCubit;

  @override
  State<PassengerCheckTile> createState() =>
      _PassengerCheckTileState();
}

class _PassengerCheckTileState extends State<PassengerCheckTile> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      onChanged: (value) async{
        setState(() {
          this.value = !this.value;
        });
        if(this.value==true){
          await widget.reserveTripCubit.getPassengerDetails(token: token, id: widget.reserveTripCubit.passengerInfoModel.body[widget.index].id!);
        }
        if(this.value==false){
          widget.reserveTripCubit.removePassengerFromReserve(widget.reserveTripCubit.passengerInfoModel.body[widget.index].firstName!);
        }
      },
      value: value,
      title: Text(
          style: Theme.of(context).textTheme.headlineLarge,
          '${widget.reserveTripCubit.passengerInfoModel.body[widget.index].firstName!} ${widget.reserveTripCubit.passengerInfoModel.body[widget.index].lastName!}'),
    );
  }
}

class AddedPassengerCheckTile extends StatefulWidget {
  const AddedPassengerCheckTile({
    super.key,
    required this.reserveTripCubit,
    required this.index,
  });

  final int index;
  final ReserveTripCubit reserveTripCubit;

  @override
  State<AddedPassengerCheckTile> createState() =>
      _AddedPassengerCheckTileState();
}

class _AddedPassengerCheckTileState extends State<AddedPassengerCheckTile> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      onChanged: (value) {
        setState(() {
          this.value = !this.value;
          if(this.value==true)widget.reserveTripCubit.addPassengersToReserve(personnes[widget.index]['firstname']!);
          if(this.value==false)widget.reserveTripCubit.removePassengerFromReserve(personnes[widget.index]['firstname']!);
        });
      },
      value: value,
      title: Text(
          style: Theme.of(context).textTheme.headlineLarge,
          '${personnes[widget.index]['firstname']} ${personnes[widget.index]['lastname']}'),
    );
  }
}
