import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';

class TripDetailScreen extends StatelessWidget {
  const TripDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    final horizontalPadding = mediaQueryData.size.width;

    final verticalPadding = mediaQueryData.size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Trip details',
              style: GoogleFonts.inter(fontWeight: FontWeight.w500)),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: verticalPadding * 0.5,
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
                    Text('Lake',
                        style: GoogleFonts.inter(fontWeight: FontWeight.bold,
                        fontSize: 20)),
                    Spacer(),
                    Icon(Icons.star, color: Color(0XFFE1D800)),
                    Text('4.5',style: GoogleFonts.inter(color:Color(0xff636363),fontSize: 15,fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.place,color: Color(0xff636363),),
                  Text('location',style: GoogleFonts.inter(color:Color(0xff636363),
                  fontWeight: FontWeight.w500,fontSize:15),),
                ],
              ),
              Container(
                height: 200,
                child: Text('description',style:GoogleFonts.inter(fontSize: 20),),
              ),
              Spacer(),
              Row(
                children: [
                DefaultElevated(label: 'Booking now \$40', fill: false, onPressed:(){})
                  ]
                  ),)
                ],
              )
            ],
          ),
        ));
  }
}
