import 'dart:core';
import 'dart:ffi';
import 'package:intl/intl.dart';
import 'package:notas_fiscales/constants.dart';
import 'package:notas_fiscales/models/product_image.dart';

class Utils {
  static String setPrice(String price) {
    if (price == null) {
      return "";
    } else {
      //final oCcy = new NumberFormat("#,##0.00", "es_MX");
      return price;
    }
  }

  static String getURLImg(String url) {
    if (url == null) {
      return Constants.imgNotFound;
    }
    return url;
  }

  static String getURLListImg(List<ProductImage> images) {
    if (images != null) {
      if (images.length == 0) {
        return Constants.imgNotFound;
      }

      if (images.length > 0) {
        return images[0].src;
      }
    }

    return Constants.imgNotFound;
  }
}
