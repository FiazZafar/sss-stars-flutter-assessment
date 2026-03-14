import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sss_stars_flutter_assessment/mvvm/viewModel/auth_view_model.dart';
import 'package:sss_stars_flutter_assessment/resources/app_colors.dart';
import 'package:sss_stars_flutter_assessment/resources/app_routes.dart';
import 'package:sss_stars_flutter_assessment/widgets/button_container.dart';
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
    _phoneNoController.dispose();
    _nameController.dispose();
    _birthDateController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      // appBar: AppBar(
      //   backgroundColor: AppColors.white,

      //   surfaceTintColor: AppColors.transparent,
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: .start,
                children: [
                  SizedBox(height: 20.sp),
                  Text(
                    'Welcome!',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDarkColor,
                      fontSize: 33.sp,
                    ),
                  ),
                  SizedBox(height: 18.h),

                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        color: AppColors.textLightBlack,
                        fontWeight: FontWeight.w500,
                        height: 1.5.h,
                        letterSpacing: 0.9,
                      ),
                      children: [
                        const TextSpan(
                          text:
                              'Please complete the required\ninformation, and then press the ',
                        ),
                        TextSpan(
                          text: 'Next',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDarkColor,
                          ),
                        ),
                        const TextSpan(text: '\nbutton'),
                      ],
                    ),
                  ),

                  SizedBox(height: 15.h),

                  TabBar(
                    controller: _tabController,
                    labelColor: AppColors.textDarkColor,
                    unselectedLabelColor: AppColors.textGreyColor,
                    labelStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp,
                    ),
                    unselectedLabelStyle: GoogleFonts.poppins(
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

                  SizedBox(height: 30.h),

                  SizedBox(
                    height: 310.h,
                    child: TabBarView(
                      controller: _tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
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
                              begin: -0.2,
                              end: 0,
                              duration: 400.ms,
                              curve: Curves.easeOut,
                            ),
                        PhoneSignupTab(
                              phoneNoController: _phoneNoController,
                              nameController: _nameController,
                              birthDateController: _birthDateController,
                              passwordController: _passwordController,
                              formKey: _phoneFormKey,
                            )
                            .animate()
                            .fadeIn(duration: 400.ms)
                            .slideX(
                              begin: 0.2,
                              end: 0,
                              duration: 400.ms,
                              curve: Curves.easeOut,
                            ),
                      ],
                    ),
                  ),

                  Text(
                    'Password must include a number, a letter, and\na special character.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF61636F),
                      letterSpacing: 1,
                    ),
                  ),

                  SizedBox(height: 34.h),

                  Consumer<AuthViewModel>(
                    builder: (context, value, child) => SSSStoreBtn(
                      title: 'Next',
                      isEnabled: value.allFieldsValid,
                      showGradient: true,
                      showShadow: value.allFieldsValid ? true : false,
                      padding: 0,
                      onPressed: () async {
                        final activeKey = value.activeTab == 0
                            ? _emailFormKey
                            : _phoneFormKey;

                        if (activeKey.currentState?.validate() ?? false) {
                          final identifier = value.activeTab == 0
                              ? _emailController.text
                              : _phoneNoController.text;

                          await value.registerUser(
                            identifier,
                            _passwordController.text,
                          );

                          if (!context.mounted) return;

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
                        } else if(value.activeTab == 1){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Firebase services for contact authentication is paid!'),
                            ),
                          );
                        }
                      },
                    ),
                  ),

                  SizedBox(height: 20.h),

                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 13, color: Color(0xFF888888)),
                      children: [
                        TextSpan(text: 'Already have an account? '),
                        WidgetSpan(
                          child: Text(
                            'Signin',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
