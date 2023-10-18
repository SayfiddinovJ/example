import 'package:cached_network_image/cached_network_image.dart';
import 'package:example/cubit/size_cubit.dart';
import 'package:example/data/models/product_model.dart';
import 'package:example/ui/home/sub_screen/widgets/buttons.dart';
import 'package:example/ui/home/sub_screen/widgets/size_button.dart';
import 'package:example/utils/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailFields extends StatelessWidget {
  const DetailFields(this.product, {super.key});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.ph,
        Center(
          child: Hero(
            tag: product.id.toString(),
            child: CachedNetworkImage(
              imageUrl: product.image,
              fit: BoxFit.fill,
              height: 226.h,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        20.ph,
        Text(
          product.title,
          style: TextStyle(
            color: const Color(0xFF2F2D2C),
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        8.ph,
        Text(
          product.category,
          style: TextStyle(
            color: const Color(0xFF9B9B9B),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 20.sp,
            ),
            4.pw,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: product.ranking.rate.toString(),
                    style: TextStyle(
                      color: const Color(0xFF2F2D2C),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: '(${product.ranking.count})',
                    style: TextStyle(
                      color: const Color(0xFF808080),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const DetailButton(icon: Icons.coffee),
            15.pw,
            const DetailButton(icon: Icons.backpack),
          ],
        ),
        28.ph,
        const Divider(
          height: 1,
          color: Color(0xFFEAEAEA),
        ),
        20.ph,
        Text(
          'Description',
          style: TextStyle(
            color: const Color(0xFF2F2D2C),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        15.ph,
        Text(
          product.description,
          style: TextStyle(
            color: const Color(0xFF9B9B9B),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        22.ph,
        Text(
          'Size',
          style: TextStyle(
            color: const Color(0xFF2F2D2C),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        12.ph,
        BlocBuilder<SizeCubit, String>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizeButton(
                  text: 'S',
                  onTap: () {
                    context.read<SizeCubit>().setSize('S');
                  },
                ),
                SizeButton(
                  text: 'M',
                  onTap: () {
                    context.read<SizeCubit>().setSize('M');
                  },
                ),
                SizeButton(
                  text: 'L',
                  onTap: () {
                    context.read<SizeCubit>().setSize('L');
                  },
                ),
              ],
            );
          },
          buildWhen: (oldState, newState) => oldState != newState,
        ),
      ],
    );
  }
}
