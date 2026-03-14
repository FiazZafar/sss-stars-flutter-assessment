import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sss_stars_flutter_assessment/mvvm/viewModel/auth_view_model.dart';
import 'package:sss_stars_flutter_assessment/resources/app_assets.dart';
import 'package:sss_stars_flutter_assessment/resources/app_colors.dart';
import 'package:sss_stars_flutter_assessment/widgets/auth_field.dart';

class PhoneSignupTab extends StatefulWidget {
  final TextEditingController phoneNoController;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController birthDateController;
  final GlobalKey<FormState> formKey;

  const PhoneSignupTab({
    super.key,
    required this.phoneNoController,
    required this.nameController,
    required this.passwordController,
    required this.birthDateController,
    required this.formKey,
  });

  @override
  State<PhoneSignupTab> createState() => _PhoneSignupTabState();
}

class _PhoneSignupTabState extends State<PhoneSignupTab> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AuthViewModel>();

    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          AuthField(
            icon: Icons.phone_outlined,
            hintText: 'Phone Number',
            placeholderText: '+92 300 0000000',
            // onlyNumbers: true,
            keyboardType: TextInputType.phone,
            controller: widget.phoneNoController,
            imagePath: AppAssets.emailIcon,
            isValid: vm.phoneValid,
            validator: vm.formValidatePhone,
            onChanged: vm.validatePhone,
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
            onChanged: vm.validateUsername,
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
            controller: widget.passwordController,
            imagePath: AppAssets.passwordIcon,
            inputAction: TextInputAction.done,
            obscureText: _obscurePassword,
            isValid: vm.passwordValid,
            validator: vm.formValidatePassword,
            onChanged: vm.validatePassword,
            suffixIcon: GestureDetector(
              onTap: () => setState(() => _obscurePassword = !_obscurePassword),
              child: Icon(
                _obscurePassword
                    ? Icons.remove_red_eye_outlined
                    : Icons.visibility_off_outlined,
                size: 18,
                color: vm.passwordValid
                    ? AppColors.primary
                    : const Color(0xFFAAAAAA),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
