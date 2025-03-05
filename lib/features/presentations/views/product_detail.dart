import 'package:app_ecommerce_api/features/data/models/product_model.dart';
import 'package:app_ecommerce_api/features/presentations/controller/product_controller.dart';
import 'package:app_ecommerce_api/features/presentations/widget/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
           
              var data=productController.product.value;
              if(data==null){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else{
                return SingleChildScrollView(
                  child: Hero(
                    tag: data.image,
                    child: Column(
                    children: [
                      Image.network(data.image,height: 300,),
                      const SizedBox(height: 10,),
                       Column(
                        children: [
                          Row(
                            children: [
                              Text(data.title),
                              const Spacer(),
                              Row(
                                children: [
                                  const Icon(Icons.star,color: Colors.amber,),
                                   Text(data.rating.rate.toString(),style: const TextStyle(color: Colors.grey),),
                                ],
                              )
                            ],
                          )
                        ],
                       )
                    ],
                                  ),
                  ),
                );
              }
        },
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
           children: [
             Container(
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     border: Border.all(color:const Color.fromARGB(255, 109, 120, 195), width: 3), // Red border with 3px width
                   ),
                   child: const CircleAvatar(
                     backgroundColor: Colors.white,
                     child: Icon(Icons.favorite_border, color: Color.fromARGB(255, 109, 120, 195)), // Icon with red color
                   ),
                 ),
                 const SizedBox(width: 10),
             Expanded(
               child: ElevatedButton( 
                 style: ElevatedButton.styleFrom( 
                  textStyle:const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor:const Color.fromARGB(255, 109, 120, 195),
                  minimumSize: const Size(double.infinity, 70),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Optional: Rounded corners
                ),
                            
                 ),
                 onPressed: (){},
                 child: const Text('Add to Cart',style: TextStyle(color: Colors.white),),
               ),
             ),
           ],
          ),
        ),
      ),
    );
  }
}