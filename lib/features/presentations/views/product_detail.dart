import 'package:app_ecommerce_api/features/presentations/controller/product_controller.dart';
import 'package:app_ecommerce_api/features/presentations/widget/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key,required this.productId});
  final int productId;
  @override
  Widget build(BuildContext context) {
     ProductController productController=Get.find();
     productController.getProductById(productId);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: Obx(() {
   
            var data=productController.product.value;
            if(data==null){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else{
              return Column(
              children: [
                Image.network(data.image),
                Rating_widget(product: data),
                Text(data.title),
                Text(data.price.toString()),
                Text(data.description),
              ],
            );
            }
            

      },)
    );
  }
}