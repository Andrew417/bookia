class OtpVerifyParams {
  final String email;
  final String otp;

  OtpVerifyParams({required this.email, required this.otp});

  Map<String, dynamic> toJson() {
    return {"email": email, "otp": otp};
  }
}
