/* 
Purpose and Functionality:
Defines spacing constants and methods for responsive layout spacing based on screen size.
This includes gutters, margins, and padding that automatically adjust for:
- Mobile devices
- Tablet devices
- Desktop screens
*/

import 'breakpoints.dart';

class ResponsiveSpacing {
  // Mobile spacing
  static const double mobileGutter = 16.0;
  static const double mobileMargin = 16.0;
  static const double mobilePadding = 12.0;

  // Tablet spacing
  static const double tabletGutter = 24.0;
  static const double tabletMargin = 32.0;
  static const double tabletPadding = 16.0;

  // Desktop spacing
  static const double desktopGutter = 32.0;
  static const double desktopMargin = 48.0;
  static const double desktopPadding = 24.0;

  static double getGutter(double width) => Breakpoints.getResponsiveValue(
    width: width,
    mobile: mobileGutter,
    tablet: tabletGutter,
    desktop: desktopGutter,
  );

  static double getMargin(double width) => Breakpoints.getResponsiveValue(
    width: width,
    mobile: mobileMargin,
    tablet: tabletMargin,
    desktop: desktopMargin,
  );

  static double getPadding(double width) => Breakpoints.getResponsiveValue(
    width: width,
    mobile: mobilePadding,
    tablet: tabletPadding,
    desktop: desktopPadding,
  );
}
