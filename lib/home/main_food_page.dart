import 'package:e_commerce_app/home/food_page_body.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/widgets/big_text.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          // showing hade of main page
          Container(
            child: Container(
              margin: const EdgeInsets.only(top: 45,bottom: 15),
              padding: const EdgeInsets.only(left: 20,right: 20),

              // first raw in mainfoodpage

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //country and city 
                  Column(
                     children: [
                      BigText(text: "india",color: AppColors.mainColor,),
                      Row(
                        children: [
                          SmallText(text: "city",color:Colors.black54),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                      
                     ],
                  ),

                  //serch box tope right

                  Center(
                    child: Container(
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                        ),
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

//food page main body in Food_Page_body.dart file

          const FoodPageBody(),

        ],

        
      ),
    
    );
  }
}