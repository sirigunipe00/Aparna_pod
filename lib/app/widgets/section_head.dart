// import 'package:aparna_pod/widgets/app_spacer.dart';
// import 'package:flutter/material.dart';

// class SectoinHead extends StatelessWidget {
//   const SectoinHead({super.key, required this.title});

//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         AppSpacer.p4(),
//         Text(title, style: const TextStyle(fontSize: 15,
//           fontWeight: FontWeight.bold,
//         ),),
//         AppSpacer.p8(),
//       ],
//     );
//   }
// }

import 'package:aparna_pod/styles/app_colors.dart';
import 'package:aparna_pod/widgets/app_spacer.dart';
import 'package:flutter/material.dart';


class SectionHead extends StatelessWidget {
  const SectionHead({
    super.key,
    required this.title,
    this.onCameraPressed,
  });

  final String title;
  final VoidCallback? onCameraPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpacer.p4(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (onCameraPressed != null)
              IconButton(
                icon: const Icon(
                  Icons.camera_alt_rounded,
                  color: AppColors.marigoldDDust,
                ),
                tooltip: 'Capture Invoice Image',
                onPressed: onCameraPressed,
              ),
          ],
        ),
        AppSpacer.p8(),
      ],
    );
  }
}
