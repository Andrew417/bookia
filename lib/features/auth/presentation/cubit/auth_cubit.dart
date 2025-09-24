import 'package:bookia/features/auth/data/models/request/auth_params.dart';
import 'package:bookia/features/auth/data/models/request/otp_params.dart';
import 'package:bookia/features/auth/data/models/request/reset_pass.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();
  var otpController = TextEditingController();

  login() async {
    emit(AuthLoadingState());

    var params = AuthParams(
      email: emailController.text,
      password: passwordController.text,
    );

    var response = await AuthRepo.login(params);
    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState("Login failed"));
    }
  }

  register() async {
    emit(AuthLoadingState());

    var params = AuthParams(
      name: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text,
    );

    var response = await AuthRepo.register(params);
    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState("Registration failed"));
    }
  }

  forgetPassword() async {
    var params = AuthParams(email: emailController.text);

    var response = await AuthRepo.forgetPassword(params);

    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState("Failed to send reset code"));
    }
  }

  otpVerification() async {
    emit(AuthLoadingState());

    var params = OtpVerifyParams(
      email: emailController.text,
      otp: int.parse(otpController.text),
    );

    var response = await AuthRepo.otpVerification(params);

    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState("Invalid or expired OTP"));
    }
  }

  resetPassword() async {
    emit(AuthLoadingState());

    var params = ResetPasswordParams(
      verifyCode: int.parse(otpController.text),
      newPassword: passwordController.text,
      newPasswordConfirmation: passwordConfirmationController.text,
    );

    var response = await AuthRepo.createNewPass(params);

    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState("Error in resetting password"));
    }
  }
}
