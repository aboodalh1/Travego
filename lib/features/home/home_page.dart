// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travego/core/widgets/group_trip_item/group_trip_item.dart';
import 'package:travego/core/widgets/top_trip_item/top_trip_item.dart';
import 'package:travego/features/home/category_item/category_item.dart';
import '../../../core/utils/shared/components/components.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                        border: Border.all(color: HexColor('E9E9E9')),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child:
                          SearchTextField(searchController: searchController),
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
                      style: Theme.of(context).textTheme.bodyLarge),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text("See All",
                          style: Theme.of(context).textTheme.labelSmall)),
                ],
              ),
              const CategoriesItems(),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Top Trips',
                      style: Theme.of(context).textTheme.bodyLarge),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text("See All",
                          style: Theme.of(context).textTheme.labelSmall)),
                ],
              ),
              const TopTripsItem(),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Top Trips',
                      style: Theme.of(context).textTheme.bodyLarge),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text("See All",
                          style: Theme.of(context).textTheme.labelSmall)),
                ],
              ),
              const GroupTripItem(),
            ],
          ),
        ),
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
      decoration: InputDecoration(
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
