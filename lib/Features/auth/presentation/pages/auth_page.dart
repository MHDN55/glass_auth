import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/glass_box_widget.dart';
import '../widgets/text_form_field_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/image2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: GlassBoxWidget(
              height: 500.0.h,
              width: 300.0.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  const Icon(
                    Icons.lock_rounded,
                    size: 100,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15.h, bottom: 15.h, right: 10.w, left: 10.w),
                    child: TextFormFieldAuthWidget(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required Email";
                        }
                        String pattern = r'\w+@\w+\.\w+';
                        RegExp regex = RegExp(pattern);
                        if (!regex.hasMatch(value)) {
                          return 'Invalid E-mail Address format.';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      fieldHint: "Email",
                      myController: emailController,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 10.h, right: 10.w, left: 10.w),
                    child: TextFormFieldAuthWidget(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required Password";
                        }
                        String pattern =
                            r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
                        RegExp regex = RegExp(pattern);
                        if (!regex.hasMatch(value)) {
                          return '''Password must be at least 8 characters,\ninclude an uppercase letter, number and symbol.''';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      fieldHint: "Password",
                      myController: passwordController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 140.h),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
