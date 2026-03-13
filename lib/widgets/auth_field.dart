import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final String placeholderText;
  final bool obscureText;
  final bool readOnly;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final VoidCallback? onTap;

  const AuthField({
    super.key,
    required this.icon,
    required this.hintText,
    required this.placeholderText,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(70),
        border: const Border(
          bottom: BorderSide(color: Color(0xFFDDDDDD), width: 1),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 16, color: const Color(0xFF999999)),
            ),
          ),

          Container(width: 1, height: 22, color: const Color(0xFFDDDDDD)),

          Expanded(
            child: TextFormField(
              readOnly: readOnly,
              onTap: onTap,
              obscureText: obscureText,
              keyboardType: keyboardType,
              style: const TextStyle(fontSize: 14, color: Color(0xFF333333)),
              decoration: InputDecoration(
                labelText: hintText,
                labelStyle: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFAAAAAA),
                ),
                hintText: placeholderText,
                hintStyle: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFFCCCCCC),
                ),
                suffixIcon: suffixIcon,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
