import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/features/home/presentation/manger/trips_cubit/trips_cubit.dart';
import 'package:travego/features/reservation/presentation/view/reserve_trip_screen.dart';

import '../../../../../core/utils/network/remote/service_locator.dart';
import '../../../../../core/utils/shared/constant.dart';
import '../../../repo/trips_repo/trips_repo_impl.dart';

class TripDetailScreen extends StatelessWidget {
  final dynamic model;

  const TripDetailScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripsCubit(getIt.get<TripsRepoImpl>()),
      child: BlocConsumer<TripsCubit, TripsState>(
        listener: (context, state) {
          if (state is AddToFavoritesFailure) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }
          if (state is AddToFavoritesSuccess) {
            showToast(text: state.message, state: ToastStates.SUCCESS);
          }
        },
        builder: (context, state) {
          TripsCubit cubit = BlocProvider.of<TripsCubit>(context);
          return Scaffold(
              appBar: AppBar(
                title: Text('Trip details',
                    style: GoogleFonts.inter(fontWeight: FontWeight.w500)),
              ),
              body: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: ScreenSizeUtil.screenHeight * 0.5,
                      child: ClipRect(
                          child: Image.asset(
                            'assets/images/lake_view.png',
                            scale: .5,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: ScreenSizeUtil.screenWidth * 0.65,
                            child: Text(model.tripName!,
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                          const Spacer(),
                          const Icon(Icons.star, color: Color(0XFFE1D800)),
                          Text(
                            model.status!,
                            style: GoogleFonts.inter(
                                color: const Color(0xff636363),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.place,
                          color: Color(0xff636363),
                        ),
                        Text(
                          model.country!,
                          style: GoogleFonts.inter(
                              color: const Color(0xff636363),
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      child: Text(
                        model.tripDescription!,
                        style: GoogleFonts.inter(fontSize: 20),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                Text(model.tripServices![index] +' | '),

                            itemCount: model.tripServices!.length)),
                    const Spacer(),
                    Row(children: [
                      Expanded(
                        child: DefaultElevated(
                            label: 'Booking now \$ ${model.price}',
                            fill: true,
                            onPressed: () {
                              navigateTo(context, const ReserveTripScreen());
                            }),
                      ),
                      IconButton(
                          onPressed: () {
                            cubit.isTripFavorite
                                ? cubit.removeTripFromFavorite(
                                token: token, id: model.tripId) : cubit
                                .addTripToFavorite(
                                token: token, id: model.tripId);
                          },
                          icon: Icon(
                            true ? Icons.favorite : Icons
                                .favorite_border,
                            size: 35,
                            color: defaultColor,
                          ))
                    ]),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
