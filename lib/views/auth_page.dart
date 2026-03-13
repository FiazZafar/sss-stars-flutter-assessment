import 'package:flutter/material.dart';
import 'package:sss_stars_flutter_assessment/resources/app_colors.dart';
import 'package:sss_stars_flutter_assessment/resources/app_text_style.dart';
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
      appBar: AppBar(),
      body: Container(
        color: const Color(0xFFF5F5F5),
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
            const SizedBox(height: 24),

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
                
                borderRadius: BorderRadius.circular(10)
              ),
              indicatorPadding: EdgeInsets.only(
                left: 12.0,
                top: 45,
                right: 12.0,
              ),

              dividerColor: AppColors.transparent,
              tabs: const [
                Tab(text: 'Email Address'),
                Tab(text: 'Phone Number'),
              ],
            ),
            const SizedBox(height: 20),

            SizedBox(
              height: 330,
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [EmailSignupTab(), PhoneSignupTab()],
              ),
            ),

            const Text(
              'Password must include a number, a letter, and\na special character.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF999999),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),

            const _NextButton(),
            const SizedBox(height: 16),

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
          ],
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFCECECE), Color(0xFFB0B0B0)],
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: const Text(
            'Next',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
