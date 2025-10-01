import 'package:bookia/features/main/data/models/book_product_response/book_product_response.dart';
import 'package:bookia/features/main/data/models/book_product_response/product.dart';
import 'package:bookia/features/main/data/repo/home_repo.dart';
import 'package:bookia/features/main/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  List<Product> bestSellers = [];
  List<Product> newArrivals = [];
  List<Product> allbooks = [];

  Future<void> getHomeData() async {
    emit(HomeLoadingState());

    var res = Future.value([
      HomeRepo.getBestSellers(),
      HomeRepo.getNewArrivals(),
      HomeRepo.getAllProducts(),
    ]);

    res
        .then((res) {
          bestSellers = (res[0] as BookProductResponse).data?.products ?? [];
          newArrivals = (res[1] as BookProductResponse).data?.products ?? [];
          allbooks = (res[2] as BookProductResponse).data?.products ?? [];
          emit(HomeSuccuessState());
        })
        .catchError((e) {
          emit(HomeErrorState());
        });
  }
}
