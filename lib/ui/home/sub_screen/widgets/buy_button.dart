import 'package:example/utils/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({super.key, required this.price});

  final num price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 39.w, right: 18.w, top: 23.h, bottom: 17),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        border: Border.all(
          color: const Color(0xFF9B9B9B),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF9B9B9B),
                  fontWeight: FontWeight.w400,
                ),
              ),
              8.ph,
              Text(
                "\$ $price",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: const Color(0xFFC67C4E),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 55.h,
            width: 217.w,
            decoration: BoxDecoration(
              color: const Color(0xFFC67C4E),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Center(
              child: Text(
                "Buy now",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
