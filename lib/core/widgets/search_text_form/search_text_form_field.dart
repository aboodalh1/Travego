import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.searchController,
    required this.label,
  });

  final TextEditingController searchController;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: label.tr,
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
