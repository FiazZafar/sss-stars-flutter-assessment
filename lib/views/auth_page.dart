import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sss_stars_flutter_assessment/resources/app_colors.dart';
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
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _currentIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
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

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: AppTextStyles.customText14(
                  color: AppColors.textLightBlack,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
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
                  TextSpan(text: ' button'),
                ],
              ),
            ),
            SizedBox(height: 24.h),

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
              tabs: [
                Tab(text: 'Email Address'),
                Tab(text: 'Phone Number'),
              ],
            ),
            const SizedBox(height: 20),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  // ← sirf yeh animation wala part add kiya
                  KeyedSubtree(
                    key: ValueKey('email_$_currentIndex'),
                    child: EmailSignupTab()
                        .animate()
                        .fadeIn(duration: 400.ms)
                        .slideX(
                          begin: _currentIndex == 0 ? -0.2 : 0.2,
                          end: 0,
                          duration: 400.ms,
                          curve: Curves.easeOut,
                        ),
                  ),
                  // ← sirf yeh animation wala part add kiya
                  KeyedSubtree(
                    key: ValueKey('phone_$_currentIndex'),
                    child: PhoneSignupTab()
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

            Text(
              'Password must include a number, a letter, and\na special character.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF999999),
                letterSpacing: 0.8,
              ),
            ),
            SizedBox(height: 23.h),
            SSSStoreBtn(title: 'Next', onPressed: () {}, showGradient: true),
            SizedBox(height: 30.h),
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
