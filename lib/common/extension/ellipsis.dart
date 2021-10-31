///This add ellipsis to String

extension StringExtension on String {
  // ignore: unused_element
  String addEllipsis() =>
      this.length > 25 ? " ${this.substring(0, 25)} + ..." : this;
}
