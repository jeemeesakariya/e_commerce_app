import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/widgets/big_text.dart';
import 'package:e_commerce_app/widgets/icon_and_text.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {

  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue= pageController.page!;
        print("Current value is "+_currPageValue.toString());
      });
    });
  }

  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }

// main item builder

  Widget _buildPageItem(int index){
    
    return Stack(
      children:[
        //main body big container
        Container(
        height: 220,
        margin: EdgeInsets.only(left: 5,right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/images 9.png"
             ),
            )
      
        ),
      ),

// main body small container overriding on the big container

      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 120,
          margin: EdgeInsets.only(left: 30,right: 30,bottom: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),

          //all the items in small container

          child: Container(
            padding: EdgeInsets.only(top: 15, left: 15,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: "Chines Side"),
                SizedBox(height: 10,),
                Row(
                  children: [

                    // star rating

                    Wrap(
                      children: List.generate(5, (index) => Icon(Icons.star,color: AppColors.mainColor,size: 15,)),

                    // tradditional way to writen this like == (index){return Icon(Icons.star,color:Appcolors.mainColor,size:15)}

                    ),

                    SizedBox(width: 10,),

                    SmallText(text: "4.5"),

                    SizedBox(width: 10,),

                    SmallText(text: "1287"),

                    SizedBox(width: 10,),

                    SmallText(text: "comments"),
                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  children: [
                    IconAndTextWidgets(
                      icon: Icons.circle_sharp, 
                      iconColor:AppColors.iconColor1 , 
                      text: "normal"
                      ),

                      IconAndTextWidgets(
                      icon: Icons.location_on, 
                      iconColor:AppColors.mainColor , 
                      text: "1.7km"
                      ),

                      IconAndTextWidgets(
                      icon: Icons.access_time_rounded, 
                      iconColor:AppColors.iconColor2 , 
                      text: "32min"
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      
      ] 
    );
  }

  @override
  Widget build(BuildContext context) {

    // main body perent container

    return Container(
      //color: Colors.red,
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position){
          return _buildPageItem(position);
 
      }),
    );
  }
}