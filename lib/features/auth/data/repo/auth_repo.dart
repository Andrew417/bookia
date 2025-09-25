import 'dart:developer';

import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/features/auth/data/models/request/auth_params.dart';
import 'package:bookia/features/auth/data/models/request/otp_params.dart';
import 'package:bookia/features/auth/data/models/request/reset_pass.dart';
import 'package:bookia/features/auth/data/models/response/auth_response/auth_response.dart';

class AuthRepo {
  static Future<AuthResponse?> login(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.login,
        data: params.toJson(),
      );
      if (res.statusCode == 200) {
        var data = AuthResponse.fromJson(res.data);
        await LocalHelper.setUserData(data.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> register(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.register,
        data: params.toJson(),
      );
      if (res.statusCode == 201) {
        var data = AuthResponse.fromJson(res.data);
        await LocalHelper.setUserData(data.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> forgetPassword(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.forgetPassword,
        data: params.toJson(),
      );

      if (res.statusCode == 200) {
        var data = AuthResponse.fromJson(res.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> otpVerification(OtpVerifyParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.checkForgetPass,
        data: params.toJson(),
      );

      if (res.statusCode == 200) {
        var data = AuthResponse.fromJson(res.data);

        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> createNewPass(ResetPasswordParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.resetPassword,
        data: params.toJson(),
      );

      if (res.statusCode == 200) {
        var data = AuthResponse.fromJson(res.data);
        log(res.data.toString());
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
