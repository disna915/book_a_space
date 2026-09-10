import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller_app/constants/app_assets.dart';
import 'package:traveller_app/config/color.dart';
import 'package:traveller_app/core/auth/login/controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final LoginController controller = Get.put(LoginController());
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _emailFadeAnimation;
  late Animation<Offset> _emailSlideAnimation;
  late Animation<double> _passwordFadeAnimation;
  late Animation<Offset> _passwordSlideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // Screen entry animation
    _fadeAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    // Staggered Email Animation
    _emailFadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.3, 0.6, curve: Curves.easeIn),
    );
    _emailSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.3, 0.6, curve: Curves.easeOut),
    ));

    // Staggered Password Animation
    _passwordFadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.5, 0.8, curve: Curves.easeIn),
    );
    _passwordSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.5, 0.8, curve: Curves.easeOut),
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget buildTextField(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(
          color: AppColor.primary,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primary, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),

                  // 🌈 Header
                  Text(
                    "Welcome Back 👋",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColor.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Login to continue your journey",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // 🖼 Image
                  Center(
                    child: Hero(
                      tag: "loginImage",
                      child: Image.asset(
                        AppAssets.login_image,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // ✉️ Email Field with animation
                  FadeTransition(
                    opacity: _emailFadeAnimation,
                    child: SlideTransition(
                      position: _emailSlideAnimation,
                      child: buildTextField("Email", controller.emailController),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 🔒 Password Field with animation
                  FadeTransition(
                    opacity: _passwordFadeAnimation,
                    child: SlideTransition(
                      position: _passwordSlideAnimation,
                      child: buildTextField(
                        "Password",
                        controller.passwordController,
                        isPassword: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // 🔘 Login Button
                  GestureDetector(
                    onTap: () => controller.fetchLoginApi(context: context),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColor.primary,
                            AppColor.primary.withOpacity(0.8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.primary.withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // 🔗 Forgot Password
                  Center(
                    child: TextButton(
                      onPressed: () => Get.toNamed('/forgot_password'),
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.poppins(
                          color: AppColor.primary,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // 🆕 Create Account
                  Center(
                    child: GestureDetector(
                      onTap: () => Get.toNamed('/createaccount'),
                      child: Text(
                        "Create an Account",
                        style: GoogleFonts.poppins(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
