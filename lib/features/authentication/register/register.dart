import 'package:evently_app_online/core/resources/assets_manager.dart';
import 'package:evently_app_online/core/resources/colors_manager.dart';
import 'package:evently_app_online/core/resources/validators.dart';
import 'package:evently_app_online/core/routes_manager/app_routes.dart';
import 'package:evently_app_online/core/routes_manager/routes_manager.dart';
import 'package:evently_app_online/core/widgets/custom_elevated_button.dart';
import 'package:evently_app_online/core/widgets/custom_text_button.dart';
import 'package:evently_app_online/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool securePassword = true;
  bool secureRePassword = true;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _rePasswordController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose;
    _emailController.dispose;
    _passwordController.dispose;
    _rePasswordController.dispose;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).viewInsets.top);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          left: 8,
          right: 8,
          top: 47,
          bottom: MediaQuery.of(context).viewInsets.top,
        ),
        child: SingleChildScrollView(
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
                      controller: _nameController,
                      validator: Validator.validateName,
                      labelText: "Name",
                      prefixIcon: Icon(Icons.person),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: _emailController,
                      validator: Validator.validateEmail,
                      labelText: "E-mail",
                      prefixIcon: Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      controller: _passwordController,
                      validator: Validator.validatePassword,
                      isSecure: securePassword,
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      keyboardType: TextInputType.visiblePassword,
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
                    CustomTextFormField(
                      controller: _rePasswordController,
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return "Plz confirm password";
                        }
                        if (input != _passwordController.text) {
                          return "Password does't match";
                        }
                        return null;
                      },
                      isSecure: secureRePassword,
                      labelText: "Re-Password",
                      prefixIcon: Icon(Icons.lock),
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        onPressed: _onToggleRePasswordIconclicked,
                        icon: Icon(
                          secureRePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    CustomElevatedButton(
                      text: "Create Account",
                      onPress: _createAccount,
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have Account ? ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        CustomTextButton(
                          text: "Login",
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.login,
                            );
                          },
                        ),
                      ],
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
    setState(() {
      securePassword = !securePassword;
    });
  }

  void _onToggleRePasswordIconclicked() {
    setState(() {
      secureRePassword = !secureRePassword;
    });
  }

  void _createAccount() {
    /// اول حاجة هعمل check عليها انا المستخدم مدخل ايميل ولا لا
    /// ولو ال form هيبقى valid هقدر انشى ال account
    if (_formKey.currentState?.validate() == false) return;
  }
}
