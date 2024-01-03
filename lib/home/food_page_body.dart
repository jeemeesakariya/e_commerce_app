import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
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
  double _scaleFactor=0.8;
  double _height= Dimensions.pageViewContainer;


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

  @override
  Widget build(BuildContext context) {

    // main body big(perent) container

    return Column(
      children: [
        Container(
          //color: Colors.red,
          height: Dimensions.pageView,
        
          //pageview builder
        
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position){
              return _buildPageItem(position);
         
          }),
        ),

        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue.floor(),
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }

// main item builder

  Widget _buildPageItem(int index){

    // main body container slider matrix

    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      var currTrans = _height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }
    
    return Transform(
      transform: matrix,
      child: Stack(
        children:[
          //main body big container
          Container(
          height: Dimensions.pageViewContainer,
          margin: const EdgeInsets.only(left: 5,right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: index.isEven?const Color(0xFF69c5df):const Color(0xFF9294cc),
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
            height: Dimensions.pageViewTextContainer,
            margin: const EdgeInsets.only(left: 30,right: 30,bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFfe8e8e8),
                  blurRadius: 5.0,
                  offset: Offset(0, 5)
                  
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, 0)
                ),
                 BoxShadow(
                  color: Colors.white,
                  offset: Offset(5, 0)
                 )
              ]
            ),
      
            //all the items in small container
      
            child: Container(
              padding: EdgeInsets.only(top: Dimensions.height15, left: 15,right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Chines Side"),
                  SizedBox(height: Dimensions.height10,),
                  Row(
                    children: [
      
                      // star rating
      
                      Wrap(
                        children: List.generate(5, (index) => Icon(Icons.star,color: AppColors.mainColor,size: 15,)),
      
                      // tradditional way to writen this like == (index){return Icon(Icons.star,color:Appcolors.mainColor,size:15)}
      
                      ),
      
                      const SizedBox(width: 10,),
      
                      SmallText(text: "4.5"),
      
                      const SizedBox(width: 10,),
      
                      SmallText(text: "1287"),
      
                      const SizedBox(width: 10,),
      
                      SmallText(text: "comments"),
                    ],
                  ),
      
                  SizedBox(height: Dimensions.height20,),
      
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ),
    );
  }

}