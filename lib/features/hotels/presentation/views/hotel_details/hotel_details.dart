import 'package:flutter/material.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelDetails extends StatelessWidget {
  final dynamic model;
  const HotelDetails({super.key,required this.model});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.hotelName!,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Stack(
        children: [
          ClipRect(
            child: Image.asset(
              'assets/images/hotel.jpg',
              fit: BoxFit.cover,
              height: ScreenSizeUtil.screenHeight  * .45,
              width: ScreenSizeUtil.screenWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenSizeUtil.screenHeight  * .37 <=290?ScreenSizeUtil.screenHeight  * .37 :290  ),
            child: Container(
                height: ScreenSizeUtil.screenHeight  * .6,
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
                              BarStick(horizontalPadding: ScreenSizeUtil.screenWidth)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(model.hotelName!,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(model.hotelName!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: defaultColor),
                                      child: const Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text('Category',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white)),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(model.stars!.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(model.country!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              height: ScreenSizeUtil.screenHeight * .07,
                              width: ScreenSizeUtil.screenHeight  * .07,
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
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5),
                        child: Text('Description',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        child: Text(
                          model.description!,
                          style: GoogleFonts.inter(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(
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
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                height: ScreenSizeUtil.screenHeight * .07,
                                width: ScreenSizeUtil.screenHeight * .07,
                                decoration: BoxDecoration(
                                    color: defaultColor.withOpacity(.4),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                    child: Icon(
                                  Icons.local_taxi_sharp,
                                  color: Colors.black45,
                                  size: 40,
                                )),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                height: ScreenSizeUtil.screenHeight  * .07,
                                width: ScreenSizeUtil.screenHeight  * .07,
                                decoration: BoxDecoration(
                                    color: defaultColor.withOpacity(.4),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                    child: Icon(
                                  Icons.wifi,
                                  color: Colors.black45,
                                  size: 40,
                                )),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                height: ScreenSizeUtil.screenHeight * .07,
                                width: ScreenSizeUtil.screenHeight * .07,
                                decoration: BoxDecoration(
                                    color: defaultColor.withOpacity(.4),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                    child: Icon(
                                  Icons.restaurant,
                                  color: Colors.black45,
                                  size: 40,
                                )),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                height: ScreenSizeUtil.screenHeight * .07,
                                width: ScreenSizeUtil.screenHeight * .07,
                                decoration: BoxDecoration(
                                    color: defaultColor.withOpacity(.4),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
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
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: ScreenSizeUtil.screenWidth * .08,
                            ),
                            const SizedBox(
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
