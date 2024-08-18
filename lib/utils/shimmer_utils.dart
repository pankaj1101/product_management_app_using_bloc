import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUtils extends StatelessWidget {
  final Widget child;
  const ShimmerUtils({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: child,
      ),
    );
  }
}