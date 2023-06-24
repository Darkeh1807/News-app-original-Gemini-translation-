import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_app/constants/colors.dart';
import 'package:new_app/widgets/custom_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 45,
            left: 15,
            right: 15,
          ),
          child: ListView(
            children: [
              Image.asset(
                "assets/images/sign in.png",
                fit: BoxFit.cover,
                height: 340,
                width: 340,
              ),
              const Spacer(),
              const Text(
                "Sign in",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                        labelText: "Email",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.password,
                        ),
                        labelText: "Password",
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        context.push('/main');
                      },
                      child: const CustomButton(
                        title: "Sign up",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("New Here?"),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () => context.push('/signup'),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: AppColors.blueColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
