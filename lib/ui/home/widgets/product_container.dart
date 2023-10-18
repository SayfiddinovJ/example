import 'package:cached_network_image/cached_network_image.dart';
import 'package:example/data/models/product_model.dart';
import 'package:example/ui/home/sub_screen/product_detail.dart';
import 'package:example/utils/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetail(product: product),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Stack(
                children: [
                  Hero(
                    tag: product.id.toString(),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: product.image,
                    ),
                  ),
                  Positioned(
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 14.w,
                          color: Colors.yellow,
                        ),
                        10.pw,
                        Text(
                          product.ranking.rate.toString(),
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            6.ph,
            Text(
              product.title,
              maxLines: 1,
              style: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xFF2F2D2C),
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            4.ph,
            Text(
              product.category,
              maxLines: 1,
              style: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xFF9B9B9B),
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            15.ph,
            Row(
              children: [
                Text(
                  '\$ ${product.price}',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: const Color(0xFF2F4B4E),
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFC67C4E),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 16.w,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            12.ph,
          ],
        ),
      ),
    );
  }
}
