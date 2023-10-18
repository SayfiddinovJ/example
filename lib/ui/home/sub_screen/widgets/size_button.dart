import 'package:example/cubit/size_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeButton extends StatelessWidget {
  const SizeButton({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 40.w),
        decoration: BoxDecoration(
          color: context.read<SizeCubit>().state == text
              ? const Color(0xFFFFF5EE)
              : const Color(0xFFFFFFFF),
          border: Border.all(
            color: context.read<SizeCubit>().state == text
                ? const Color(0xFFC67C4E)
                : const Color(0xFFDEDEDE),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: context.read<SizeCubit>().state == text
                ? const Color(0xFFC67C4E)
                : const Color(0xFF2F2D2C),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
