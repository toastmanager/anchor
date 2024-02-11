import 'package:flutter/material.dart';

class UniTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final bool enabled;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? errorMsg;
  final String? labelText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? onChanged;

  const UniTextField({
    super.key,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.enabled = true,
    this.keyboardType,
    this.suffixIcon,
    this.onTap,
    this.prefixIcon,
    this.validator,
    this.focusNode,
    this.errorMsg,
    this.labelText,
    this.onSaved,
    this.onChanged,
  });


  @override
  Widget build(BuildContext context) {
    Color iconColor = Theme.of(context).colorScheme.onSurface;
    Color labelColor = Theme.of(context).colorScheme.onSurface.withOpacity(0.5);
    if (enabled == false) {
      labelColor = Theme.of(context).colorScheme.onSurface.withOpacity(0.2);
      iconColor = Theme.of(context).colorScheme.onSurface.withOpacity(0.2);
    }
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onTap: onTap,
      onSaved: onSaved,
      focusNode: focusNode, 
      textInputAction: TextInputAction.next,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: iconColor,
        suffixIcon: suffixIcon,
        enabled: enabled,
        labelText: labelText,
        labelStyle: TextStyle(
          color: labelColor,
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1))
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1))
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)
        ),
        hintText: hintText,
        errorText: errorMsg,
        errorMaxLines: 2,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error)
        ), 
      ),
    );
  }
}
