import 'package:bookia/components/appBar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_form.dart';
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

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: BlocListener<AuthCubit, AuthState>(
        listener: _blocListener,
        child: _forgetPasswordBody(),
      ),
      bottomNavigationBar: _goToSignUp(context),
    );
  }

  void _blocListener(BuildContext context, AuthState state) {
    if (state is AuthSuccessState) {
      pushTo(context, Routes.otpVerify);
    } else if (state is AuthErrorState) {
      pop(context);
      showMyDialog(context, state.error);
    } else {
      showLoadingDialog(context);
    }
  }

  Padding _forgetPasswordBody() {
    var cubit = context.read<AuthCubit>();
    return Padding(
      padding: const EdgeInsets.all(22),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Forgot Password?', style: TextStyles.getSize30()),
              Gap(10),
              Text(
                'Don\'t worry! It occurs. Please enter the email address linked with your account.',
                style: TextStyles.getSize16(color: AppColors.grey),
              ),
              Gap(30),
              CustomTextField(
                controller: cubit.emailController,
                hintText: 'Enter your email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),

              Gap(38),
              MainButton(
                text: 'Send Code',
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.forgetPassword();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SafeArea _goToSignUp(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account? ", style: TextStyles.getSize16()),
          TextButton(
            onPressed: () {
              pushWithReplacement(context, Routes.login);
            },
            child: Text(
              'Login',
              style: TextStyles.getSize16(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
