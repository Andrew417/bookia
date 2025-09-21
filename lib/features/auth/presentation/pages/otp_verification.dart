import 'package:bookia/components/appBar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/extensions/dialogs.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: BlocListener<AuthCubit, AuthState>(
        listener: _blocListener,
        child: _otpVerificationBody(),
      ),
      bottomNavigationBar: _resendOtp(context),
    );
  }

  void _blocListener(BuildContext context, AuthState state) {
    if (state is AuthSuccessState) {
      pushTo(context, Routes.createNewPass);
    } else if (state is AuthErrorState) {
      pop(context);
      showMyDialog(context, state.error);
    } else {
      showLoadingDialog(context);
    }
  }

  Padding _otpVerificationBody() {
    var cubit = context.read<AuthCubit>();
    return Padding(
      padding: const EdgeInsets.all(22),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('OTP Verification', style: TextStyles.getSize30()),
              Gap(10),
              Text(
                'Enter the verification code we just sent on your email address.',
                style: TextStyles.getSize16(color: AppColors.grey),
              ),
              Gap(30),
              Pinput(
                length: 6,
                controller: cubit.otpController,
                defaultPinTheme: PinTheme(
                  width: 70,
                  height: 60,
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                submittedPinTheme: PinTheme(
                  width: 70,
                  height: 60,
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                onCompleted: (pin) {
                  context.read<AuthCubit>().otpVerification(pin);
                },
              ),

              Gap(38),
              MainButton(
                text: 'Verify',
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    pushTo(context, Routes.createNewPass);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SafeArea _resendOtp(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Ddidn't receive code ?", style: TextStyles.getSize16()),
          TextButton(
            onPressed: () {},
            child: Text(
              'Resend',
              style: TextStyles.getSize16(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
