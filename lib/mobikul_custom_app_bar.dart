library mobikul_custom_app_bar;

import 'package:flutter/material.dart';

/// Mobikul Custom App Bar
/// A customizable app bar widget for Flutter applications.
///
/// This widget supports dynamic headings, app logo customization (including
/// dark mode support), leading buttons, and action widgets. It also
/// includes options for background color and optimized visibility logic.
class MobikulCustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  /// The heading text to be displayed on the app bar.
  final String heading;

  /// The text style for the heading.
  final TextStyle? headingStyle;

  /// A flag to determine whether the app logo should be displayed.
  final bool showAppLogo;

  /// The BuildContext of the current widget.
  final BuildContext context;

  /// A flag to determine if the app bar should have elevation.
  final bool isElevated;

  /// A flag to enable the leading button (usually a back button).
  final bool isLeadingEnable;

  /// A flag to enable home button functionality.
  final bool isHomeEnable;

  /// A flag to enable dark mode logo support.
  final bool? isAppLogoForDarkmode;

  /// A list of action widgets displayed on the app bar.
  final List<Widget>? actions;

  /// Callback function for handling button presses.
  final VoidCallback? onPressed;

  /// The URL for the app's logo.
  final String? appLogoUrl;

  /// The URL for the dark mode app logo.
  final String? darkAppLogoUrl;

  /// The placeholder image to display when the logo fails to load.
  final String? placeHolderImage;

  /// The background color of the app bar.
  final Color? appBarBackgroundColor;

  /// The width of the logo image.
  final double? logoWidth;

  /// The height of the logo image.
  final double? logoHeight;

  /// Creates a customizable app bar.
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
