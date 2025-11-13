import 'package:evently_app_online/core/resources/assets_manager.dart';
import 'package:evently_app_online/core/resources/colors_manager.dart';
import 'package:evently_app_online/core/resources/validators.dart';
import 'package:evently_app_online/core/routes_manager/routes_manager.dart';
import 'package:evently_app_online/core/ui_utils.dart';
import 'package:evently_app_online/core/widgets/custom_elevated_button.dart';
import 'package:evently_app_online/core/widgets/custom_text_button.dart';
import 'package:evently_app_online/core/widgets/custom_text_form_field.dart';
import 'package:evently_app_online/firebase/firebase_service.dart';
import 'package:evently_app_online/l10n/app_localizations.dart';
import 'package:evently_app_online/models/login_request.dart';
import 'package:evently_app_online/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool securePassword = true;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose;
    _passwordController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //MediaQuery.of(context).viewInsets.bottom;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.only(
            left: 8,
            right: 8,
            top: 47,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(ImageAssets.eventlyLogo),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 24.h),
                    CustomTextFormField(
                      controller: _emailController,
                      validator: Validator.validateEmail,
                      labelText: appLocalizations.email,///email
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.email),
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: _passwordController,
                      validator: Validator.validatePassword,
                      isSecure: securePassword,
                      labelText: appLocalizations.password,///Password
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: _onTogglePasswordIconclicked,
                        icon: Icon(
                          securePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    CustomTextButton(
                      text: "${appLocalizations.forget_password}؟",/// Forget password
                      onTap: () {},
                      alignment: Alignment.centerRight,
                    ),
                    SizedBox(height: 24.h),
                    CustomElevatedButton(text: appLocalizations.login, onPress: _login),/// Login
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${appLocalizations.dont_have_account}",/// don't have account
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        CustomTextButton(
                          text: appLocalizations.create_account,///Create account
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.register,
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            indent: 42.w,
                            endIndent: 16.w,
                            thickness: 1,
                            color: ColorsManager.blue,
                          ),
                        ),
                        Text(
                          appLocalizations.or,/// or
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ColorsManager.blue,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            indent: 16.w,
                            endIndent: 42.w,
                            thickness: 1,
                            color: ColorsManager.blue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/google_icon.svg"),
                          SizedBox(width: 4.w),
                          Text(
                            appLocalizations.login_with_google,///Login With Google
                            style: GoogleFonts.inter(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorsManager.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTogglePasswordIconclicked() {
    ///كدا انا بدات ب true يعنى هتبقى بى secure
    /// اول ما دوس على ال Icon هتبقى
    //#################################################
    /// ال securePassword بى false يعنى الباسورد هيبقى متشاف
    ///FirebaseAuth.instance.currentUser;
    /// يعنى انت لو عملت login ال currentUser هيبقى بيشاور على ال user فعلا
    setState(() {
      securePassword = !securePassword;
    });
  }

  void _login() async{
    if(_formKey.currentState?.validate() == false )return;
    try{
      UIUtils.showLoading(context, isDismissible: false);
      UserCredential userCredential = await FirebaseService.login(LoginRequest(email: _emailController.text, password: _passwordController.text));
      UserModel.currentUser =await FirebaseService.getUserFromFireStore(userCredential.user!.uid);

      UIUtils.hideDialog(context);
      UIUtils.showToastMessage("User Logged-In Successfully", Colors.green);
      Navigator.pushReplacementNamed(context, AppRoutes.mainLayout);
    } on FirebaseAuthException catch(exception){
      UIUtils.hideDialog(context);
      UIUtils.showToastMessage("Invalid email or password", Colors.red);
    }catch(exception){
      UIUtils.hideDialog(context);
      UIUtils.showToastMessage("Failed to login", Colors.red);
    }
  }
}
