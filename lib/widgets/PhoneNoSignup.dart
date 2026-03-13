import 'package:flutter/material.dart';
import 'package:sss_stars_flutter_assessment/widgets/auth_field.dart';

class PhoneSignupTab extends StatefulWidget {
  const PhoneSignupTab({super.key});
 
  @override
  State<PhoneSignupTab> createState() => _PhoneSignupTabState();
}
 
class _PhoneSignupTabState extends State<PhoneSignupTab> {
  bool _obscurePassword = true;
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthField(
          icon: Icons.phone_outlined,
          hintText: 'Phone Number',
          placeholderText: '+92 300 0000000',
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 12),
 
        AuthField(
          icon: Icons.person_outline,
          hintText: 'Username',
          placeholderText: 'JohnApple',
        ),
        const SizedBox(height: 12),
 
        AuthField(
          icon: Icons.calendar_month_outlined,
          hintText: 'Birthday',
          placeholderText: '14/08/2020',
          readOnly: true,
        ),
        const SizedBox(height: 12),
 
        AuthField(
          icon: Icons.lock_outline,
          hintText: 'Password',
          placeholderText: '• • • • • • • • •',
          obscureText: _obscurePassword,
          suffixIcon: GestureDetector(
            onTap: () => setState(() => _obscurePassword = !_obscurePassword),
            child: Icon(
              _obscurePassword
                  ? Icons.remove_red_eye_outlined
                  : Icons.visibility_off_outlined,
              size: 18,
              color: const Color(0xFFAAAAAA),
            ),
          ),
        ),
      ],
    );
  }
}