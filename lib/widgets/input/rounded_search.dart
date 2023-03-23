import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:flutter_ui_realestate/global/sizing.dart';

class RoundedSearch extends StatelessWidget {
  final String? placeholder;
  const RoundedSearch({super.key, this.placeholder});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: darkSecond,
          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.transparent, width: 1),
          //   borderRadius: BorderRadius.circular(radius * 5),
          // ),
          hintText: placeholder ?? "",
          hintStyle: TextStyle(color: lightGrey500),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: lightGrey500,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1),
            borderRadius: BorderRadius.circular(radius * 5),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1),
            borderRadius: BorderRadius.circular(radius * 5),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: spacing)),
      style:
          Theme.of(context).textTheme.bodyMedium!.copyWith(color: lightGrey500),
      textInputAction: TextInputAction.done,
    );
  }
}
