/* 
Purpose and Functionality:
Defines screen size breakpoints and provides utilities for responsive design.
This includes:
- Screen size breakpoint constants
- Device type detection methods
- Generic responsive value selection
*/

class Breakpoints {
  // Screen size breakpoints
  static const double mobile = 600;
  static const double tablet = 1024;
  static const double desktop = 1440;

  // Device type detection methods
  static bool isMobile(double width) => width < mobile;
  static bool isTablet(double width) => width >= mobile && width < tablet;
  static bool isDesktop(double width) => width >= tablet;

  // Get responsive value based on screen size
  static T getResponsiveValue<T>({
    required double width,
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(width)) {
      return desktop ?? tablet ?? mobile;
    }
    if (isTablet(width)) {
      return tablet ?? mobile;
    }
    return mobile;
  }
}
