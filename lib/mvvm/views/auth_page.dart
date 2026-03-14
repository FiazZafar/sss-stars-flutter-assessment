import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sss_stars_flutter_assessment/mvvm/viewModel/auth_view_model.dart';
import 'package:sss_stars_flutter_assessment/resources/app_colors.dart';
import 'package:sss_stars_flutter_assessment/resources/app_routes.dart';
import 'package:sss_stars_flutter_assessment/resources/app_text_style.dart';
import 'package:sss_stars_flutter_assessment/resources/button_container.dart';
import 'package:sss_stars_flutter_assessment/widgets/PhoneNoSignup.dart';
import 'package:sss_stars_flutter_assessment/widgets/emailsignup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  late final TextEditingController _emailController;
  late final TextEditingController _phoneNoController;
  late final TextEditingController _nameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _birthDateController;

  late final GlobalKey<FormState> _emailFormKey;
  late final GlobalKey<FormState> _phoneFormKey;

  final int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _phoneNoController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    _birthDateController = TextEditingController();

    _emailFormKey = GlobalKey();
    _phoneFormKey = GlobalKey();

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        context.read<AuthViewModel>().setActiveTab(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _emailController.dispose();
    _phoneNoController.dispose(); // ✅ was missing
    _nameController.dispose();
    _birthDateController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      appBar: AppBar(backgroundColor: AppColors.white),
      body: Container(
        color: AppColors.white,
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome!',
              style: AppTextStyles.customText28(
                fontWeight: FontWeight.bold,
                color: AppColors.textDarkColor,
              ),
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: AppTextStyles.customText14(
                    color: AppColors.textLightBlack,
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(
                      text:
                          'Please complete the required information, and then press the ',
                    ),
                    TextSpan(
                      text: 'Next',
                      style: AppTextStyles.customText14(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDarkColor,
                      ),
                    ),
                    const TextSpan(text: ' button'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),

            TabBar(
              controller: _tabController,
              labelColor: AppColors.textDarkColor,
              unselectedLabelColor: AppColors.textGreyColor,
              labelStyle: AppTextStyles.customText14(
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: AppTextStyles.customText14(
                fontWeight: FontWeight.w500,
              ),
              indicator: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              indicatorPadding: EdgeInsets.only(
                left: 20.0.w,
                top: 43.h,
                right: 25.w,
              ),
              dividerColor: AppColors.transparent,
              tabs: const [
                Tab(text: 'Email Address'),
                Tab(text: 'Phone Number'),
              ],
            ),
            const SizedBox(height: 20),

            SizedBox(
              height: 324.h,
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  KeyedSubtree(
                    key: ValueKey('email_$_currentIndex'),
                    child:
                        EmailSignupTab(
                              emailController: _emailController,
                              nameController: _nameController,
                              birthDateController: _birthDateController,
                              passwordController: _passwordController,
                              formKey: _emailFormKey,
                            )
                            .animate()
                            .fadeIn(duration: 400.ms)
                            .slideX(
                              begin: _currentIndex == 0 ? -0.2 : 0.2,
                              end: 0,
                              duration: 400.ms,
                              curve: Curves.easeOut,
                            ),
                  ),
                  KeyedSubtree(
                    key: ValueKey('phone_$_currentIndex'),
                    child:
                        PhoneSignupTab(
                              phoneNoController: _phoneNoController,
                              nameController: _nameController, 
                              birthDateController:
                                  _birthDateController, 
                              passwordController:
                                  _passwordController, 
                              formKey: _phoneFormKey,
                            )
                            .animate()
                            .fadeIn(duration: 400.ms)
                            .slideX(
                              begin: _currentIndex == 1 ? 0.2 : -0.2,
                              end: 0,
                              duration: 400.ms,
                              curve: Curves.easeOut,
                            ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),

            Text(
              'Password must include a number, a letter, and\na special character.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF999999),
                letterSpacing: 0.8,
              ),
            ),
            SizedBox(height: 12.h),

            Consumer<AuthViewModel>(
              builder: (context, value, child) => SSSStoreBtn(
                title: 'Next',
                showGradient: true,
                isEnabled: value.allFieldsValid,
                onPressed: () async {
                  final activeKey = _currentIndex == 0
                      ? _emailFormKey
                      : _phoneFormKey;

                  if (activeKey.currentState!.validate()) {
                    final identifier = _currentIndex == 0
                        ? _emailController.text
                        : _phoneNoController.text;

                    await value.registerUser(
                      identifier,
                      _passwordController.text,
                    );

                    if (!context.mounted) return; // ✅ safety check

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          value.isSuccess
                              ? value.message ?? 'Account created'
                              : value.message ?? 'Signup failed',
                        ),
                      ),
                    );

                    if (value.isSuccess) {
                      context.go(AppRoutes.homePage);
                    }
                  }
                },
              ),
            ),
            SizedBox(height: 12.h),

            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 13, color: Color(0xFF888888)),
                children: [
                  const TextSpan(text: 'Already have an account? '),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Signin',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}
