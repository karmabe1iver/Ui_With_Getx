abstract class AssetHelper {
  static String images(String imagename) {
    return 'asset/images/$imagename';
  }

  static String icons(String imageName) {
    return 'assets/icons/$imageName';
  }

  static get inventoryIcon => icons("");

  static get customersIcon => icons("");

  //---------------------------------------------

  // static get appImageUrl => ApiPaths.baseUrl + ApiPaths.imagePath;
//---------------------------------------------
  static get splashImag => images('splash.png');

  static get logoImag => images('logo.png');

  static get component => images('Component.png');

  static get EmailIcon => images('EmailIcon.png');

  static get password => images('Vector.png');

  static get leave => images('leave.png');

  static get leaverwquest => images('leaverequest.png');

  static get noticeboard => images('noticeboard.png');

  static get Calender => images('AlternateCalendar.png');

  static get userSm => images('UserCircle.png');

  static get profileIMAGE => images('Ellipse.png');

  static get pending => images('clockPending.png');

  static get approved => images('clockApproved.png');

  static get cancel => images('clockDenied.png');

  static get leaveBox => images('leavebox.png');

  static get Delete => images('DeleteIcon.png');

  static get Edit => images('ReWriteIcon.png');
  static get svg => images('image.svg');
}
