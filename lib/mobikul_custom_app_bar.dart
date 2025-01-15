library mobikul_custom_app_bar;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Mobikul Custom App Bar

class MobikulCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String heading;
  final TextStyle? headingStyle;
  final bool showAppLogo;
  final BuildContext context;
  final bool isElevated;
  final bool isLeadingEnable;
  final bool isHomeEnable;
  final bool? isAppLogoForDarkmode;
  final List<Widget>? actions;
  final VoidCallback? onPressed;
  final String? appLogoUrl;
  final String? darkAppLogoUrl;
  final String? placeHolderImage;
  final Color? appBarBackgroundColor;
  final double? logoWidth;
  final double? logoHeight;

  MobikulCustomAppBar(
      this.heading,
      this.context,
      this.headingStyle, {
        super.key,
        this.isElevated = true,
        this.isLeadingEnable = false,
        this.isHomeEnable = false,
        this.isAppLogoForDarkmode = false,
        this.actions,
        this.onPressed,
        this.appLogoUrl,
        this.darkAppLogoUrl,
        this.placeHolderImage,
        this.appBarBackgroundColor = Colors.white,
        this.logoWidth = 30.0,
        this.logoHeight = 30.0,
        required this.showAppLogo,
      });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarBackgroundColor,
      leading: isLeadingEnable
          ? IconButton(
        onPressed: () {
          isLeadingEnable ? Navigator.pop(context) : onPressed?.call();
        },
        icon: const Icon(Icons.clear),
      )
          : null,
      elevation: isElevated ? null : 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isHomeEnable) ...[
            Visibility(
              visible: checkAppLogoVisibility(),
              child: SizedBox(
                height: (logoHeight != null && logoHeight != 0.0 && (logoHeight ?? 0) <= 300)
                    ? logoHeight
                    : AppBar().preferredSize.height / 2,
                width: (logoWidth != null && logoWidth != 0.0 && (logoWidth ?? 0) <= 300)
                    ? logoWidth
                    : AppBar().preferredSize.height / 2,
                child: Image.network(
                  isAppLogoForDarkmode == true && ((darkAppLogoUrl ?? "").isNotEmpty)
                      ? (darkAppLogoUrl ?? "")
                      : (appLogoUrl ?? ""),
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(placeHolderImage ?? ""),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                heading,
                style: headingStyle ?? Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  /// Method to check visibility of app logo
  bool checkAppLogoVisibility() {
    if (showAppLogo == true) {
      if (isAppLogoForDarkmode == true && (darkAppLogoUrl ?? "").isNotEmpty) {
        return true;
      } else if ((appLogoUrl ?? "").isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
