import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:aparna_pod/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';
import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/styles/icons.dart';
import 'package:aparna_pod/widgets/app_spacer.dart';
import 'package:aparna_pod/widgets/buttons/app_btn.dart';
import 'package:aparna_pod/widgets/dialogs/app_dialogs.dart';
import 'package:aparna_pod/widgets/inputs/app_text_field.dart';
import 'package:aparna_pod/widgets/spaced_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AuthenticationScrn extends StatefulWidget {
  const AuthenticationScrn({super.key});

  @override
  State<AuthenticationScrn> createState() => _AuthenticationScrnState();
}

class _AuthenticationScrnState extends State<AuthenticationScrn> {
  late final TextEditingController username;
  late final TextEditingController pswd;
  bool showPswd = true;

  @override
  void initState() {
    super.initState();
    username = TextEditingController();
    pswd = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: SpacedColumn(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              margin: const EdgeInsets.all(12.0),
              defaultHeight: 12.0,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    height: context.sizeOfHeight * 0.2,
                    width: context.sizeOfWidth,
                    child: Image.asset(AppIcons.aparnaLogo.path, fit: BoxFit.contain,),
                  ),
                ),
                Text('Login',
                  style: context.textTheme.labelLarge?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Please login to continue",
                  style: context.textTheme.labelLarge?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AppSpacer.p12(),
                AppTextField(
                  title: 'Email',
                  inputType: TextInputType.emailAddress,
                  controller: username,
                ),
                AppTextField(
                  title: 'Password',
                  controller: pswd,
                  obscureText: showPswd,
                 suffixIcon: InkWell(
                        onTap: togglePswd,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Icon(
                            showPswd
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey.shade600,
                            size: 20,
                          ),
                        ),
                      ),
                ),
                
                BlocConsumer<SignInCubit, SignInState>(
                  listener: (_, state) {
                    state.maybeWhen(
                      orElse: () {},
                      success: context.cubit<AuthCubit>().authCheckRequested,
                      failure: (failure) => AppDialog.showErrorDialog(
                        context, 
                        title: failure.title,
                        content: failure.error,
                        onTapDismiss: context.close,
                      ),
                    );
                  },
                  builder: (_, state) {
                    return AppButton(
                      label: 'Sign In',
                      bgColor: const Color(0xFF0072bc),
                      isLoading: state.isLoading,
                      margin: const EdgeInsets.all(12),
                      onPressed: () => context
                          .cubit<SignInCubit>()
                          .login(username.text, pswd.text),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void togglePswd() => setState(() {
        showPswd = !showPswd;
      });
}