import 'package:example/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF131313),
                  Color(0xFF313131),
                ],
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text('Location',style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),),
                        Text('Bilzen,Tanjungbalai',style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFFDDDDDD),
                          fontWeight: FontWeight.w400,
                        ),),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(AppImages.account,
                      height: 44.w,width: 44.w,),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
