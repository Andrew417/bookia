import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/features/home/presentation/pages/home_screen.dart';
import 'package:bookia/features/mycart/presentation/pages/cart_screen.dart';
import 'package:bookia/features/profile/presentation/pages/profile_screen.dart';
import 'package:bookia/features/wishlist/presentation/pages/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  Color getIconColor(int index) {
    return currentIndex == index ? AppColors.primary : Colors.black;
  }

  List<Widget> screens = [
    HomeScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: _bottmNavigationBarBuilder(),
    );
  }

  BottomNavigationBar _bottmNavigationBarBuilder() {
    return BottomNavigationBar(
      backgroundColor: AppColors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppImages.homeSvg,
            colorFilter: ColorFilter.mode(getIconColor(0), BlendMode.srcIn),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppImages.wishlistSvg,
            colorFilter: ColorFilter.mode(getIconColor(1), BlendMode.srcIn),
          ),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppImages.cartSvg,
            colorFilter: ColorFilter.mode(getIconColor(2), BlendMode.srcIn),
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppImages.profileSvg,
            colorFilter: ColorFilter.mode(getIconColor(3), BlendMode.srcIn),
          ),
          label: 'profile',
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
    );
  }
}
