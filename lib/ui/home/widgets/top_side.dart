import 'package:example/utils/app_images.dart';
import 'package:example/utils/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopSide extends StatelessWidget {
  const TopSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 69.h),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF313131),
            Color(0xFF131313),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  4.ph,
                  Text(
                    'Bilzen,Tanjungbalai',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFFDDDDDD),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  AppImages.account,
                  height: 44.w,
                  width: 44.w,
                ),
              ),
            ],
          ),
          26.ph,
          InkWell(
            borderRadius: BorderRadius.circular(15.r),
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF313131),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                children: [
                  21.pw,
                  const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  12.pw,
                  Text(
                    'Search product',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFF989898),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFC67C4E),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: SvgPicture.asset(AppImages.settings),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
