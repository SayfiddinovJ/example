import 'package:example/bloc/product_bloc.dart';
import 'package:example/bloc/product_event.dart';
import 'package:example/ui/tabs_box.dart';
import 'package:example/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            AppImages.image,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            right: 20.w,
            left: 20.w,
            bottom: 181.h,
            child: Text(
              'Coffee so good, your taste buds will love it.',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 34.sp,
              ),
            ),
          ),
          Positioned(
            right: 50.w,
            left: 50.w,
            bottom: 100.h,
            child: Text(
              'The best grain, the finest roast, the powerful flavor.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFFA9A9A9),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
          ),
          Positioned(
            right: 30.w,
            left: 30.w,
            bottom: 10.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  )),
              onPressed: () {
                context.read<ProductBloc>().add(GetAll());
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabsBox(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                child: Row(
                  children: [
                    SvgPicture.asset(AppImages.google),
                    SizedBox(width: 15.w),
                    Text(
                      'Continue with Google',
                      style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
