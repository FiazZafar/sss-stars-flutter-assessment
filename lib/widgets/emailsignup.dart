import 'package:flutter/material.dart';
import 'package:sss_stars_flutter_assessment/widgets/auth_field.dart';
class EmailSignupTab extends StatefulWidget {
  const EmailSignupTab({super.key});
 
  @override
  State<EmailSignupTab> createState() => _EmailSignupTabState();
}
 
class _EmailSignupTabState extends State<EmailSignupTab> {
  bool _obscurePassword = true;
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthField(
          icon: Icons.email_outlined,
          hintText: 'E-mail',
          placeholderText: 'email@example.com',
          keyboardType: TextInputType.emailAddress,
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
          onTap: () async {
          },
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