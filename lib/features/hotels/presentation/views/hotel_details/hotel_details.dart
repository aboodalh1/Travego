import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/features/hotels/presentation/manger/hotel_cubit.dart';
import 'package:travego/features/hotels/presentation/manger/hotel_states.dart';

class HotelDetails extends StatelessWidget {
  const HotelDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    final horizontalPadding = mediaQueryData.size.width;
    final verticalPadding = mediaQueryData.size.height;

    return BlocConsumer<HotelsCubit, HotelsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'hotel name',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Stack(
        children: [
          ClipRect(
            child: Image.asset(
              'assets/images/hotel.jpg',
              fit: BoxFit.cover,
              height: verticalPadding * .45,
              width: horizontalPadding,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: verticalPadding * .42),
            child: Container(
                height: verticalPadding * .6,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child:
                              BarStick(horizontalPadding: horizontalPadding)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Hotel name',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                                SizedBox(
                                  height: 2,
                                ),
                                Text('Hotel name',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium),
                                SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: defaultColor),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text('Category',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text('4.5',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('432 Reviews',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              height: verticalPadding * .07,
                              width: verticalPadding * .07,
                              decoration: BoxDecoration(
                                  color: defaultColor.withOpacity(.4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  '15 \$ / Night',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5),
                        child: Text('Description',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        child: Text(
                          'Hotel abn aalam o nas ipsum iuldoa dgjr quirey, ggdfgposdf',
                          style: GoogleFonts.inter(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5),
                        child: Text('Amenities',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: verticalPadding * .07,
                                width: verticalPadding * .07,
                                decoration: BoxDecoration(
                                    color: defaultColor.withOpacity(.4),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Icon(
                                  Icons.local_taxi_sharp,
                                  color: Colors.black45,
                                  size: 40,
                                )),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: verticalPadding * .07,
                                width: verticalPadding * .07,
                                decoration: BoxDecoration(
                                    color: defaultColor.withOpacity(.4),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Icon(
                                  Icons.wifi,
                                  color: Colors.black45,
                                  size: 40,
                                )),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: verticalPadding * .07,
                                width: verticalPadding * .07,
                                decoration: BoxDecoration(
                                    color: defaultColor.withOpacity(.4),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Icon(
                                  Icons.restaurant,
                                  color: Colors.black45,
                                  size: 40,
                                )),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: verticalPadding * .07,
                                width: verticalPadding * .07,
                                decoration: BoxDecoration(
                                    color: defaultColor.withOpacity(.4),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Icon(
                                  Icons.add_call,
                                  color: Colors.black45,
                                  size: 40,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: horizontalPadding * .08,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: DefaultElevated(
                                    label: 'Book now',
                                    fill: true,
                                    onPressed: () {})),
                          ],
                        ),
                      )
                    ])),
          ),
        ],
      ),
    );
  },
);
  }
}

class BarStick extends StatelessWidget {
  const BarStick({
    super.key,
    required this.horizontalPadding,
  });

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 8,
      width: horizontalPadding * .4,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(20)),
    );
  }
}
