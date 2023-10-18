import 'package:example/bloc/product_bloc.dart';
import 'package:example/bloc/product_event.dart';
import 'package:example/bloc/product_state.dart';
import 'package:example/data/models/product_model.dart';
import 'package:example/data/status.dart';
import 'package:example/ui/home/widgets/category_selector.dart';
import 'package:example/ui/home/widgets/product_container.dart';
import 'package:example/ui/home/widgets/top_side.dart';
import 'package:example/utils/app_images.dart';
import 'package:example/utils/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const TopSide(),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  debugPrint('Status: ${state.status}');
                  if (state.status == FormStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state.status == FormStatus.error) {
                    return const Center(
                      child: Text('Please check your internet connection'),
                    );
                  }
                  if (state.status == FormStatus.success) {
                    return Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(child: 105.ph),
                          SliverToBoxAdapter(
                            child: CategorySelector(
                              categories: state.categories,
                              onCategorySelected: (category) {
                                context
                                    .read<ProductBloc>()
                                    .add(ChangeCategory(category: category));
                                context
                                    .read<ProductBloc>()
                                    .add(GetProductByCategory());
                              },
                              selectedCategory: state.selectedCategory,
                            ),
                          ),
                          SliverPadding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            sliver: SliverGrid(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10.w,
                                crossAxisSpacing: 10.h,
                                childAspectRatio: 0.7,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  ProductModel product = state.products[index];
                                  return ProductContainer(product: product);
                                },
                                childCount: state.products.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const Center(child: Text('Something went wrong'));
                },
              ),
            ],
          ),
          Positioned(
            top: 236.h,
            right: 30.w,
            left: 30.w,
            child: Image.asset(
              AppImages.ad,
              height: 140.h,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
