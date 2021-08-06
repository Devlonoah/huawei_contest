///This add ellipsis to specified String

///Add three dots to specified string
extension StringExtension on String {
  // ignore: unused_element
  String addEllipsis() =>
      this.length > 25 ? " ${this.substring(0, 25)} + ..." : this;
}
