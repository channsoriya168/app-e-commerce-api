
import 'package:app_ecommerce_api/core/constants/app_colors.dart';
import 'package:app_ecommerce_api/features/presentations/controller/category_controller.dart';
import 'package:app_ecommerce_api/features/presentations/controller/product_controller.dart';
import 'package:app_ecommerce_api/features/presentations/widget/menu_widget.dart';
import 'package:app_ecommerce_api/features/presentations/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.find();
    final ProductController productController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              leading: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: AppColors.colorIcon,
                  size: 35,
                  ),
                onPressed: () {},
              ),
              floating: true,
              snap: true,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: AppColors.colorIcon,
                  size: 35,
                    ),
                  onPressed: () {},
                ),
              ],
              
            ),
            const search_widget(),
            menu_widget(categoryController: categoryController,productController: productController,),
          Obx(() {
            if(productController.isLoading.value){
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }else{
             return SliverGrid.builder(
                itemCount: productController.products.length,
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
                 itemBuilder: (context, index) {
                  var product = productController.products[index];
                  return Text(product.category);
                },);
            }
          },)
          ],
        ),
      ),
    );
  }
}
