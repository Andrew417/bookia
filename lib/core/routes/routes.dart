import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/pages/create_new_pass.dart';
import 'package:bookia/features/auth/presentation/pages/forget_password.dart';
import 'package:bookia/features/auth/presentation/pages/login.dart';
import 'package:bookia/features/auth/presentation/pages/otp_verification.dart';
import 'package:bookia/features/auth/presentation/pages/register.dart';
import 'package:bookia/features/auth/presentation/pages/success_page.dart';
import 'package:bookia/features/main/presentation/pages/book_description_screen.dart';
import 'package:bookia/features/main/presentation/pages/main_screen.dart';
import 'package:bookia/features/mycart/presentation/pages/order_screen.dart';
import 'package:bookia/features/mycart/presentation/pages/success_page.dart';
import 'package:bookia/features/wishlist/presentation/pages/wishlist_screen.dart';
import 'package:bookia/features/splash/splash_screen.dart';
import 'package:bookia/features/welcome/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String main = '/main';
  static const String forgetPassword = '/forgetPassword';
  static const String otpVerify = '/otpVerify';
  static const String createNewPass = '/createNewPass';
  static const String successPage = '/successPage';
  static const String bookDescription = '/bookDescription';
  static const String wishList = '/wishList';
  static const String orderScreen = '/orderScreen';
  static const String sucessOrder = '/sucessOrder';

  static final routes = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashScreen()),
      GoRoute(path: welcome, builder: (context, state) => WelcomeScreen()),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: RegisterScreen(),
        ),
      ),
      GoRoute(
        path: forgetPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: ForgetPassword(),
        ),
      ),
      GoRoute(
        path: otpVerify,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: OtpVerification(),
        ),
      ),
      GoRoute(
        path: createNewPass,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: CreateNewPass(otp: state.extra as String),
        ),
      ),
      GoRoute(path: successPage, builder: (context, state) => SuccessPage()),
      GoRoute(path: main, builder: (context, state) => MainScreen()),
      GoRoute(
        path: bookDescription,
        builder: (context, state) => BookDescriptionScreen(),
      ),
      GoRoute(path: wishList, builder: (context, state) => WishlistScreen()),
      GoRoute(path: orderScreen, builder: (context, state) => OrderScreen()),
      GoRoute(
        path: sucessOrder,
        builder: (context, state) => SuccessPageOrder(),
      ),
    ],
  );
}
