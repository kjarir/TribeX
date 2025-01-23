import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingStep {
  final String title;
  final String description;
  final String image;

  OnboardingStep({
    required this.title,
    required this.description,
    required this.image,
  });

  Widget buildImage() {
    return SvgPicture.asset(
      image,
      fit: BoxFit.contain,
    );
  }
}
