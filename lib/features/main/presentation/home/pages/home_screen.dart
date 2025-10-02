import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/features/main/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/main/presentation/cubit/home_states.dart';
import 'package:bookia/features/main/presentation/home/widgets/all_products_builder.dart';
import 'package:bookia/features/main/presentation/home/widgets/best_seller_builder.dart';
import 'package:bookia/features/main/presentation/home/widgets/home_slider.dart';
import 'package:bookia/features/main/presentation/home/widgets/new_arrovals_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: SvgPicture.asset(AppImages.logoSvg, height: 30),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppImages.searchSvg),
            ),
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            var cubit = context.read<HomeCubit>();
            if (state is HomeInitialState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeErrorState) {
              return const Center(child: Text("Something went wrong 😕"));
            }
            return Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeSlider(sliders: cubit.sliders),
                    Gap(10),
                    BestSellerBuilder(products: cubit.bestSellers),
                    Gap(20),
                    NewArrivalsBuilder(products: cubit.newArrivals),
                    Gap(20),
                    AllProducts(products: cubit.allBooks),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
