import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sss_stars_flutter_assessment/mvvm/viewModel/auth_view_model.dart';
import 'package:sss_stars_flutter_assessment/resources/app_assets.dart';
import 'package:sss_stars_flutter_assessment/resources/app_colors.dart';
import 'package:sss_stars_flutter_assessment/widgets/auth_field.dart';

class EmailSignupTab extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController birthDateController;
  final GlobalKey<FormState> formKey;

  const EmailSignupTab({
    super.key,
    required this.emailController,
    required this.nameController,
    required this.passwordController,
    required this.birthDateController,
    required this.formKey,
  });

  @override
  State<EmailSignupTab> createState() => _EmailSignupTabState();
}

class _EmailSignupTabState extends State<EmailSignupTab> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AuthViewModel>();

    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          AuthField(
            icon: Icons.email_outlined,
            hintText: 'E-mail',
            placeholderText: 'email@example.com',
            keyboardType: TextInputType.emailAddress,
            controller: widget.emailController,
            imagePath: AppAssets.emailIcon,
            isValid: vm.emailValid,
            validator: vm.formValidateEmail,
            onChanged: (v) => vm.validateEmail(v), // ✅ live update
          ),
          const SizedBox(height: 12),

          AuthField(
            icon: Icons.person_outline,
            hintText: 'Username',
            placeholderText: 'JohnApple',
            controller: widget.nameController,
            imagePath: AppAssets.userIcon,
            isValid: vm.nameValid,
            validator: vm.formValidateUsername,
            onChanged: (v) => vm.validateUsername(v), // ✅ live update
          ),
          const SizedBox(height: 12),
          AuthField(
            icon: Icons.calendar_month_outlined,
            hintText: 'Birthday',
            placeholderText: '14/08/2020',
            readOnly: true,
            controller: widget.birthDateController,
            imagePath: AppAssets.calenderIcon,
            isValid: vm.birthValid,
            validator: vm.formValidateBirthDate,
            onChanged: (_) {},
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime(2000),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: AppColors.primary,
                        onPrimary: Colors.white,
                        onSurface: const Color(0xFF333333),
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (picked != null) {
                final formatted =
                    '${picked.day.toString().padLeft(2, '0')}/'
                    '${picked.month.toString().padLeft(2, '0')}/'
                    '${picked.year}';

                widget.birthDateController.text = formatted;
                vm.validateBirthDate(formatted);
              }
            },
          ),
          const SizedBox(height: 12),

          AuthField(
            icon: Icons.lock_outline,
            hintText: 'Password',
            placeholderText: '• • • • • • • • •',
            obscureText: _obscurePassword,
            controller: widget.passwordController,
            imagePath: AppAssets.passwordIcon,
            isValid: vm.passwordValid,
            validator: vm.formValidatePassword,
            onChanged: (v) => vm.validatePassword(v), // ✅ live update
            suffixIcon: GestureDetector(
              onTap: () => setState(() => _obscurePassword = !_obscurePassword),
              child: Icon(
                _obscurePassword
                    ? Icons.remove_red_eye_outlined
                    : Icons.visibility_off_outlined,
                size: 18,
                color: vm.passwordValid
                    ? const Color(0xFF4A90D9)
                    : const Color(0xFFAAAAAA),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
