import 'dart:developer';

import 'package:bookia/features/main/data/models/book_product_response/book_product_response.dart';
import 'package:bookia/features/main/data/models/book_product_response/product.dart';
import 'package:bookia/features/main/data/models/slides_response/slider.dart';
import 'package:bookia/features/main/data/models/slides_response/slides_response.dart';
import 'package:bookia/features/main/data/repo/home_repo.dart';
import 'package:bookia/features/main/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  List<SliderModel> sliders = [];
  List<Product> bestSellers = [];
  List<Product> newArrivals = [];
  List<Product> allBooks = [];

  Future<void> getHomeData() async {
    emit(HomeLoadingState());

    try {
      var res = await Future.wait([
        HomeRepo.getSliders(), 
        HomeRepo.getBestSellers(), 
        HomeRepo.getNewArrivals(), 
        HomeRepo.getAllProducts(), 
      ]);

      sliders = (res[0] as SlidesResponse).data?.sliders ?? [];
      bestSellers = (res[1] as BookProductResponse).data?.products ?? [];
      newArrivals = (res[2] as BookProductResponse).data?.products ?? [];
      allBooks = (res[3] as BookProductResponse).data?.products ?? [];

      emit(HomeSuccuessState());
    } catch (e, s) {
      log("❌ HomeCubit Error: $e", stackTrace: s);
      emit(HomeErrorState());
    }
  }
}
