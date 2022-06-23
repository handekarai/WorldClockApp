import 'package:flutter/material.dart';
import 'package:worldclockapp/constant.dart';

// search bar in the home screen
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required homeViewModel,
  }) : _homeViewModel = homeViewModel, super(key: key);

  final _homeViewModel;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => value.length > 2 ? _homeViewModel.filterRegions(value) : _homeViewModel.getRegions(), // after 3 character, then filter method runs , i think it is more efficent for device
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          prefixIcon: Image.asset('assets/images/search.png'),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: strokeBlue),
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: strokeBlue),
            borderRadius: BorderRadius.circular(50.0),
          ),
          filled: true,
          hintStyle: const TextStyle(color: darkColor, fontFamily: 'Montserrat', fontWeight: FontWeight.w300, fontSize: 12),
          hintText: 'Arama',
          fillColor: whiteColor),
    );
  }
}
