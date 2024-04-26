// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travego/core/widgets/group_trip_item/group_trip_item.dart';
import 'package:travego/core/widgets/top_trip_item/top_trip_item.dart';
import 'package:travego/core/widgets/category_item/category_item.dart';
import '../../../core/utils/shared/components/components.dart';
import '../../../core/widgets/hotels_item/hotels_item.dart';
import '../../../core/widgets/search_text_form/search_text_form_field.dart';

// ignore: must_be_immutable
class HotelsScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  HotelsScreen({super.key});
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
              const HotelsItem(),
            ],
          ),
        ),
      ),
    );
  }
}
