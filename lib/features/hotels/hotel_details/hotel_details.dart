import 'package:flutter/material.dart';

class HotelDetails extends StatelessWidget {
  const HotelDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    final horizontalPadding = mediaQueryData.size.width;
    final verticalPadding = mediaQueryData.size.height;

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
                  children:[
                BarStick(horizontalPadding: horizontalPadding),

              ])
            ),
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
    return Container(margin: EdgeInsets.all(10),height: 8,width: horizontalPadding*.4,decoration: BoxDecoration(
      color: Colors.grey,borderRadius: BorderRadius.circular(20)
    ),);
  }
}
