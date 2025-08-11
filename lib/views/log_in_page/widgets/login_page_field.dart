import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_admin_app/constants/colors.dart';
import 'package:nest_admin_app/controllers/auth_bloc/auth_bloc.dart';
import 'package:nest_admin_app/views/side_bar/side_bar_main.dart';
import 'package:nest_admin_app/widgets/my_button.dart';
import 'package:nest_admin_app/widgets/my_custom_text_field.dart';

class LoginPageFields extends StatelessWidget {
  const LoginPageFields({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Form(
      key: formKey,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SideBarMain()),
            );
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              MyCustomTextFormField(
                controller: emailController,
                prefixIcon: const Icon(Icons.email),
                labelText: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  } else if (!RegExp(
                    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-z]{2,7}$',
                  ).hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              MyCustomTextFormField(
                controller: passwordController,
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

              // Remember me and Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle forgot password
                    },
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(color: Colors.grey[700], fontSize: 14),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // Login button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: MyCustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(
                        LoginRequested(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    }
                  },
                  backgroundcolor: AppColors.primary,
                  textcolor: AppColors.background,
                  text: state is AuthLoading ? 'Logging in...' : 'Log In',
                ),
              ),

              SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
