
import 'package:app_ecommerce_api/core/constants/app_colors.dart';
import 'package:app_ecommerce_api/features/domain/entities/product_entity.dart';
import 'package:app_ecommerce_api/features/presentations/controller/category_controller.dart';
import 'package:app_ecommerce_api/features/presentations/controller/product_controller.dart';
import 'package:app_ecommerce_api/features/presentations/widget/menu_widget.dart';
import 'package:app_ecommerce_api/features/presentations/widget/rating_widget.dart';
import 'package:app_ecommerce_api/features/presentations/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
             return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10), 
               sliver: SliverGrid.builder( 
                  itemCount: productController.products.length,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  mainAxisSpacing: 10, 
                  crossAxisSpacing: 10,
                  mainAxisExtent: 300
                  ),
                   itemBuilder: (context, index) {
                    var product = productController.products[index];
                    return GestureDetector(
                      onTap: () {
                         productController.product.value=product;
                        Get.toNamed('/productDetail/${product.id}');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                       decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius:2,
                            offset: const Offset(0, 1),
                          ),
                        ]
                       ),
                        child: Column(
                         children: [
                           Expanded(child: Image.network(product.image)),
                           Text(product.title),
                           Text(product.price.toString()),
                          Rating_widget(product: product)
                         ],
                        ),
                      ),
                    );
                  },),
             );
            }
          },)
          ],
        ),
      ),
    );
  }
}
