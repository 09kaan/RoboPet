import 'dart:ui';
 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 
class AppColors {
  static const bg = Color(0xFF05060A);
  static const surface = Color(0xFF0E1320);
  static const cyan = Color(0xFF22E1FF);
  static const magenta = Color(0xFFFF3CAC);
  static const green = Color(0xFF36F1A6);
  static const amber = Color(0xFFFFC24B);
  static const pink = Color(0xFFFF5C8A);
}
 
ThemeData buildCyberpunkTheme() {
  final base = ThemeData(brightness: Brightness.dark, useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: base.colorScheme.copyWith(
      primary: AppColors.cyan,
      secondary: AppColors.magenta,
      surface: AppColors.surface,
    ),
    textTheme: GoogleFonts.rajdhaniTextTheme(base.textTheme).copyWith(
      headlineSmall: GoogleFonts.orbitron(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        letterSpacing: 1.5,
      ),
      titleSmall: GoogleFonts.orbitron(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
        color: Colors.white70,
      ),
    ),
  );
}
 
/// Reusable glassmorphism container: blurred translucent fill + glowing border.
class GlassPanel extends StatelessWidget {
  const GlassPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.radius = 18,
    this.blur = 14,
    this.borderColor = Colors.white24,
    this.glow = false,
  });
 
  final Widget child;
  final EdgeInsets padding;
  final double radius;
  final double blur;
  final Color borderColor;
  final bool glow;
 
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.08),
                Colors.white.withOpacity(0.02),
              ],
            ),
            border: Border.all(color: borderColor, width: 1.2),
            boxShadow: glow
                ? [
                    BoxShadow(
                      color: borderColor.withOpacity(0.4),
                      blurRadius: 18,
                      spreadRadius: -2,
                    ),
                  ]
                : null,
          ),
          child: child,
        ),
      ),
    );
  }
}
