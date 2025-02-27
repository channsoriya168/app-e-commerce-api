
import 'package:app_ecommerce_api/features/presentations/controller/category_controller.dart';
import 'package:app_ecommerce_api/features/presentations/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class menu_widget extends StatelessWidget {
  const menu_widget({
    super.key,
    required this.categoryController,
    required this.productController,
  });

  final CategoryController categoryController;
  final ProductController productController;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Obx(() {
        if (categoryController.isLoading.value) {
          return const Center(        
          );
        } else {
          return SizedBox(
            height: 70,
            child: Container(
              padding: const EdgeInsets.only(right: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryController.categories.length,
                itemBuilder: (context, index) {
                  var category = categoryController.categories[index];
                  
                  // Wrap the Container in Obx for real-time updates
                  return GestureDetector(
                    onTap: () {
                      categoryController.setSelectIndex(index);
                      productController.getProudctByCategory(category.name);
                    },
                    child: Obx(() {
                      bool isSelected = categoryController.selectIndex.value == index;
                      

                  
                      return Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          category.name,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          );
        }
      }),
    );
  }
}
