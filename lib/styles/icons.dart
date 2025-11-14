import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart';

class AppIcons {
  static const basePath = 'assets';
  static const imagesPath = '$basePath/images';
  static const iconsPath = '$basePath/icons';
  static const info = AppIcon('$iconsPath/info.png');
  static const confirm = AppIcon('$iconsPath/confirm.png');

  static const aparnaLogo = AppIcon('$basePath/logo/aparna_pod.png');
  static const vechileEntry = AppIcon('$basePath/logo/vehicle_entry.png');
  static const vehcileExit = AppIcon('$basePath/logo/vehicle_exit.png');
  static const helloCuate = AppIcon('$basePath/logo/hello_cuate.svg');
  static const bgFrame1 = AppIcon('$basePath/logo/bg_frame_1.png');
  static const bgFrame2 = AppIcon('$basePath/logo/bg_frame_2.png');
  static const bgFrame3 = AppIcon('$basePath/logo/incident_curves.png');
  static const bgFrame4 = AppIcon('$basePath/logo/invite_visitor.png');
  static const bgFrame5 = AppIcon('$basePath/logo/in_out.png');
  static const gateExitCurves = AppIcon('$basePath/logo/gate_exit_1.png');
  static const gateEntryCurves = AppIcon('$basePath/logo/gate_entry_1.png');
  static const settingsCuate = AppIcon('$basePath/logo/settings_cuate.svg');
  static const incidentRegistration = AppIcon('$basePath/logo/register.png');
  static const inviteVisitor = AppIcon('$basePath/logo/invite.png');
  static const visitorInOut = AppIcon('$basePath/logo/visitor_in_out.png');
}

class AppIcon {
  const AppIcon(this.path);

  final String path;

  Widget toWidget({
    double width = 30,
    double height = 30,
    Color? color,
    BoxFit fit = BoxFit.contain,
  }) {
    final fileextension = extension(path);
    if (fileextension == '.svg') {
      return SvgPicture.asset(path,
          width: width, height: height, color: color, fit: fit);
    }
    return Image.asset(path,
        width: width, height: height, color: color, fit: fit);
  }
}
