import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({
    super.key,
    required this.categories,
    required this.onCategorySelected,
    required this.selectedCategory,
  });

  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          ...List.generate(
            categories.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12.r),
                  onTap: () {
                    onCategorySelected.call(categories[index]);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: selectedCategory == categories[index]
                          ? const Color(0xFFC67C4E)
                          : const Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      categories[index].toUpperCase(),
                      style: TextStyle(
                        color: selectedCategory == categories[index]
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF2F4B4E),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
