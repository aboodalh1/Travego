// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travego/core/util/assets.dart';
import 'package:travego/shared/components/components.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

   HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('F7F7F7'),
      appBar: AppBar(
        backgroundColor: HexColor('F7F7F7'),
        title: const Text('سفريات'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: HexColor('E9E9E9')),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: SearchTextField(searchController: searchController),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 45,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: defaultColor,
                      ),
                      child: const Icon(
                        Icons.filter_list_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('Categories'.tr,
                      style: GoogleFonts.inter(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: GoogleFonts.inter(
                          color: Colors.grey,
                        ),
                      )),
                ],
              ),
              const CategoriesItems(),
               const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Top Trips',
                      style: GoogleFonts.inter(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: GoogleFonts.inter(
                          color: Colors.grey,
                        ),
                      )),
                ],
              ),
              const TopTripsItem(),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Top Trips',
                      style: GoogleFonts.inter(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: GoogleFonts.inter(
                          color: Colors.grey,
                        ),
                      )),
                ],
              ),
              const TopTripItem(),
            ],
          ),
        ),
      ),
    );
  }
}



class TopTripItem extends StatelessWidget {
  const TopTripItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 133,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Image.asset('assets/images/group1.png'),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mountain Trip',style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),),
                    Text('Seelisburg',style: GoogleFonts.inter(
                      color: const Color(0xff636363),
                      fontWeight: FontWeight.w400,
                      fontSize: 16
                    ),),
                    Row(
                      children: [
                        const Icon(Icons.place,color: Color(0xff636363),),
                        Text('Mountain Trip',style: GoogleFonts.inter(
                          color: const Color(0xff636363)
                        ),),
                      ],
                    ),

                  ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      decoration:  InputDecoration(
        hintText: 'Search by category'.tr,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
        alignLabelWithHint: true,
        border: InputBorder.none,
      ),
    );
  }
}

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: 15,
        itemBuilder: (context, index) {
          return Container(
            width: 140,
            decoration: BoxDecoration(
                border: Border.all(
                  color: defaultColor,
                ),
                borderRadius: BorderRadius.circular(40)),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 29,
                  backgroundColor: defaultColor,
                  child: const Icon(
                    Icons.access_alarm,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Lakes',
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TopTripsItem extends StatelessWidget {
  const TopTripsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: 15,
        itemBuilder: (context, index) {
          return Container(
            width: 160,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        AssetsData.trips,
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
                      Text(
                        'Lakes',
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: HexColor('E1D800'),
                            size: 20,
                          ),
                          Text(
                            '4.5',
                            style: GoogleFonts.inter(
                                color: Colors.black87,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_sharp,
                      color: Colors.grey,
                    ),
                    Text(
                      'location',
                      style: GoogleFonts.inter(color: Colors.black87),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Text('\$40/ visit'),
                      const Spacer(),
                      Icon(
                        Icons.favorite,
                        size: 30,
                        color: defaultColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
