import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../model/category_model.dart';
import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import '../../widgets/search_field.dart';
import '../../widgets/text_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = '/HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomePageExploreBody(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
        ],
      ),
    );
  }
}

class HomePageExploreBody extends StatelessWidget {
  const HomePageExploreBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 75.h),
            const SearchField(),
            SizedBox(height: 44.h),
            const CategoriesBar(),
            SizedBox(height: 50.h),
            const HomePageBestSellingBar(),
          ],
        ),
      ),
    );
  }
}

class HomePageBestSellingBar extends StatelessWidget {
  const HomePageBestSellingBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextRegular(
              text: "Best Selling",
              textColor: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
            TextRegular(
              text: "See all",
              textColor: Colors.black,
              fontSize: 16.sp,
            ),
          ],
        ),
        SizedBox(height: 31.h),
        SizedBox(
          height: 319.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 15.w);
            },
            itemBuilder: (BuildContext context, int index) {
              return const HomePageBestSellingItem(
                isApiDate: false,
              );
            },
          ),
        ),
      ],
    );
  }
}

class HomePageBestSellingItem extends StatelessWidget {
  const HomePageBestSellingItem({
    Key? key,
    this.networkImgUrl,
    this.productName,
    this.productCategoryName,
    this.productPrice,
    this.isApiDate = false,
  }) : super(key: key);
  final bool isApiDate;
  final String? networkImgUrl;
  final String? productName;
  final String? productCategoryName;
  final String? productPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 319.h,
      width: 164.w,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 240.h,
            width: 164.w,
            decoration: BoxDecoration(
              image: isApiDate
                  ? DecorationImage(
                      image: NetworkImage(networkImgUrl!),
                      fit: BoxFit.cover,
                    )
                  : const DecorationImage(
                      image: AssetImage(mainPageBestSellingImg),
                      fit: BoxFit.cover,
                    ),
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          TextRegular(
            text: !isApiDate ? "BeoPlay Speaker" : productName!,
            textColor: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 3.h),
          TextRegular(
            text: !isApiDate ? "Bang and Olufsen" : productCategoryName!,
            textColor: const Color(0xff929292),
            fontSize: 12.sp,
          ),
          SizedBox(height: 3.h),
          TextRegular(
            text: !isApiDate ? "\$755" : productPrice!,
            textColor: premiumColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextRegular(
          text: "Categories",
          textColor: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 19.h),
        SizedBox(
          height: 89.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 19.w);
            },
            itemBuilder: (BuildContext context, int index) {
              return CategoryCardItem(
                categoryName: categories[index].categoryName,
                iconPath: categories[index].icon,
              );
            },
          ),
        ),
      ],
    );
  }
}

class CategoryCardItem extends StatelessWidget {
  const CategoryCardItem({
    Key? key,
    required this.iconPath,
    required this.categoryName,
  }) : super(key: key);

  final String iconPath;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: greyAppColor.withOpacity(0.03),
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: SvgPicture.asset(iconPath),
          ),
        ),
        SizedBox(height: 10.h),
        TextRegular(
          text: categoryName,
          textColor: Colors.black,
          fontSize: 12.sp,
        ),
      ],
    );
  }
}
