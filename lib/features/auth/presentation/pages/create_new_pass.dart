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

class CreateNewPass extends StatefulWidget {
  final String otp;
  const CreateNewPass({super.key, required this.otp});

  @override
  State<CreateNewPass> createState() => _CreateNewPassState();
}

class _CreateNewPassState extends State<CreateNewPass> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<AuthCubit>();
    cubit.otpController.text = widget.otp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: BlocListener<AuthCubit, AuthState>(
        listener: _blocListener,
        child: _createNewPassBody(),
      ),
    );
  }

  void _blocListener(BuildContext context, AuthState state) {
    if (state is AuthSuccessState) {
      pushAndRemoveUntil(context, Routes.successPage);
    } else if (state is AuthErrorState) {
      pop(context);
      showMyDialog(context, state.error);
    } else {
      showLoadingDialog(context);
    }
  }

  Padding _createNewPassBody() {
    var cubit = context.read<AuthCubit>();
    return Padding(
      padding: const EdgeInsets.all(22),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create new password', style: TextStyles.getSize30()),
              Gap(10),
              Text(
                "Your new password must be unique from those previously used.",
                style: TextStyles.getSize16(color: AppColors.grey),
              ),
              Gap(30),
              CustomTextField(
                controller: cubit.passwordController,
                hintText: 'New Password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your new password';
                  }
                  return null;
                },
              ),
              Gap(15),
              CustomTextField(
                controller: cubit.passwordConfirmationController,
                hintText: 'Confirm Password',
                validator: (value) {
                  if ((value == null || value.isEmpty)) {
                    return 'Please confirm your new password';
                  } else if (cubit.passwordConfirmationController.text !=
                      cubit.passwordController.text) {
                    return 'Passwords don\'t match';
                  }
                  return null;
                },
              ),
              Gap(38),
              MainButton(
                text: 'Reset Password',
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.resetPassword();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
