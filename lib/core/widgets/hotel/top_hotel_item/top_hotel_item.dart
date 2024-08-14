import 'package:flutter/material.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../features/hotels/presentation/views/hotel_details/hotel_details.dart';
import '../../../../model/remote/hotel/hotel_model.dart';
import '../../../utils/assets.dart';
import '../../../utils/shared/components/components.dart';
import '../../../utils/shared/constant.dart';

class TopHotelItem extends StatelessWidget {
  final HotelModel model;
  const TopHotelItem({
    super.key,
    required this.model
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSizeUtil.screenHeight *.003002 <250? 250: ScreenSizeUtil.screenHeight *.32,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              navigateTo(context,  HotelDetails(model:model.body![index]));
            },
            child: Container(
              width: 160,
              decoration: BoxDecoration(
                  color: isDark ? Colors.blueGrey[900] : Colors.white,
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          scale: 1.5,
                          AssetsData.hotel1,
                          fit: BoxFit.fill,
                        )),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width:ScreenSizeUtil.screenWidth*0.27,
                          child: Text(
                            softWrap: true,
                            model.body![index].hotelName!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color(0XFFE1D800),
                                size: 18,
                              ),
                              Expanded(
                                child: Text(
                                  '${model.body![index].stars!}',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_sharp,
                        size: 22,
                      ),
                      Expanded(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          model.body![index].country!,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      )
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            model.body![index].cityName! ,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          true? Icons.favorite:Icons.favorite_border,
                          size: 30,
                          color: defaultColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
