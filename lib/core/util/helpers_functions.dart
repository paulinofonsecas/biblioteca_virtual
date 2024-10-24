import 'package:bilioteca_virtual/core/util/constants.dart';

String getValidImagePath(String? photo) {
  return photo != null && photo.isNotEmpty && photo.contains('http')
      ? photo
      : kDefaultAuthorPhoto;
}
