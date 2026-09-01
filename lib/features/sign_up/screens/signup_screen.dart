import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_back, size: 30),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  'assets/logo/signup.svg',
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Create Your Account',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Join us and start your journey today',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Full Name',
                    labelText: 'Full Name',
                    floatingLabelStyle: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: AppColors.fontgroundBlack.withOpacity(0.3),
                        width: 1.2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: AppColors.fontgroundBlack.withOpacity(0.3),
                        width: 1.2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: AppColors.primaryColor,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 15,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Full Name is required';
                    }
                    if (value.length < 3) {
                      return 'Full Name must be at least 3 characters';
                    }
                    if (value.length > 50) {
                      return 'Full Name must not exceed 50 characters';
                    }
                    if (!RegExp(r"^[a-zA-Z\s'-]+$").hasMatch(value)) {
                      return 'Full Name can only contain letters, spaces, hyphens, and apostrophes';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Email',
                    labelText: 'Email',
                    floatingLabelStyle: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: AppColors.fontgroundBlack.withOpacity(0.3),
                        width: 1.2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: AppColors.fontgroundBlack.withOpacity(0.3),
                        width: 1.2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors.primaryColor,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 15,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    final emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    );
                    if (!emailRegex.hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Password',
                    labelText: 'Password',
                    floatingLabelStyle: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: AppColors.fontgroundBlack.withOpacity(0.3),
                        width: 1.2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: AppColors.fontgroundBlack.withOpacity(0.3),
                        width: 1.2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: AppColors.primaryColor,
                    ),
                    suffixIcon: Icon(
                      CupertinoIcons.eye_slash,
                      color: AppColors.fontgroundBlack,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 15,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    if (!RegExp(r'\d').hasMatch(value)) {
                      return 'Password must include a number';
                    }
                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      return 'Password must include an uppercase letter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Confirm Password',
                    labelText: 'Confirm Password',
                    floatingLabelStyle: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: AppColors.fontgroundBlack.withOpacity(0.3),
                        width: 1.2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: AppColors.fontgroundBlack.withOpacity(0.3),
                        width: 1.2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: AppColors.primaryColor,
                    ),
                    suffixIcon: Icon(
                      CupertinoIcons.eye_slash,
                      color: AppColors.fontgroundBlack,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 15,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: AppColors.fontgroundBlack.withOpacity(0.15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            _passwordController.text.length >= 8
                                ? Icons.check_circle_rounded
                                : Icons.circle_outlined,
                            size: 18,
                            color: _passwordController.text.length >= 8
                                ? Colors.green
                                : Colors.grey,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'At least 8 characters long',
                            style: TextStyle(
                              fontSize: 13,
                              color: _passwordController.text.length >= 8
                                  ? Colors.green
                                  : AppColors.fontgroundBlack,
                              fontWeight: _passwordController.text.length >= 8
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            RegExp(r'\d').hasMatch(_passwordController.text)
                                ? Icons.check_circle_rounded
                                : Icons.circle_outlined,
                            size: 18,
                            color:
                                RegExp(r'\d').hasMatch(_passwordController.text)
                                ? Colors.green
                                : Colors.grey,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Include a number',
                            style: TextStyle(
                              fontSize: 13,
                              color:
                                  RegExp(
                                    r'\d',
                                  ).hasMatch(_passwordController.text)
                                  ? Colors.green
                                  : AppColors.fontgroundBlack,
                              fontWeight:
                                  RegExp(
                                    r'\d',
                                  ).hasMatch(_passwordController.text)
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            RegExp(r'[A-Z]').hasMatch(_passwordController.text)
                                ? Icons.check_circle_rounded
                                : Icons.circle_outlined,
                            size: 18,
                            color:
                                RegExp(
                                  r'[A-Z]',
                                ).hasMatch(_passwordController.text)
                                ? Colors.green
                                : Colors.grey,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Include an uppercase letter',
                            style: TextStyle(
                              fontSize: 13,
                              color:
                                  RegExp(
                                    r'[A-Z]',
                                  ).hasMatch(_passwordController.text)
                                  ? Colors.green
                                  : AppColors.fontgroundBlack,
                              fontWeight:
                                  RegExp(
                                    r'[A-Z]',
                                  ).hasMatch(_passwordController.text)
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Account created successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        AppColors.primaryColor,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Create Account', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.fontgroundBlack.withOpacity(0.4),
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'or continue with',
                        style: TextStyle(
                          color: AppColors.fontgroundBlack.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.fontgroundBlack.withOpacity(0.4),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: BorderSide(
                        color: AppColors.fontgroundBlack.withOpacity(0.2),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    icon: SizedBox(
                      width: 22,
                      height: 22,
                      child: Image.network(
                        'https://img.icons8.com/color/480/google-logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    label: const Text(
                      'Sign up with Google',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: BorderSide(
                        color: AppColors.fontgroundBlack.withOpacity(0.2),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    icon: const Icon(
                      Icons.apple,
                      color: Colors.black,
                      size: 30,
                    ),
                    label: const Text(
                      'Sign up with Apple',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.login);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
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
}
