
import 'package:app_ecommerce_api/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class search_widget extends StatelessWidget {
  const search_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            
            hintText: 'Search',
            filled: true, 
            hintStyle:const TextStyle(
              fontSize: 20,
              color: Colors.white
            ),
            fillColor: AppColors.colorIcon,
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: Colors.white,
            border: OutlineInputBorder(
              borderSide:const BorderSide(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
             enabledBorder: OutlineInputBorder(
              borderSide:const BorderSide(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:const BorderSide(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
