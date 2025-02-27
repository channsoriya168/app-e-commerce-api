
import 'package:app_ecommerce_api/features/domain/entities/product_entity.dart';
import 'package:app_ecommerce_api/features/presentations/binding/category_binding.dart';
import 'package:app_ecommerce_api/features/presentations/binding/product_binding.dart';
import 'package:app_ecommerce_api/features/presentations/views/home_view.dart';
import 'package:app_ecommerce_api/features/presentations/views/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/',
         page: () => const HomeView(),
         bindings:[
           CategoryBinding() , ProductBinding()
         ]
         ),
        GetPage(name: '/productDetail/:id',
         page: () => ProductDetail(productId: int.parse(Get.parameters['id']!),),
      
         ),
      ],
      debugShowCheckedModeBanner: false,
    );
    
  }
}
