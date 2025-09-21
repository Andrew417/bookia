class OtpVerifyParams {
  final String email;
  final int otp;

  OtpVerifyParams({required this.email, required this.otp});

  Map<String, dynamic> toJson() {
    return {"email": email, "verify_code": otp};
  }
}
