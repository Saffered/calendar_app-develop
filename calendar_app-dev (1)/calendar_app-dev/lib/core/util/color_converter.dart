import 'package:calendar_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class ColorConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      var hexColor = str.replaceAll("#", "");
      if (hexColor.length == 6) {
        hexColor = "FF$hexColor";
      }
      if (hexColor.length == 8) {
        return Right(int.parse("0x$hexColor"));
      }
      return Left(ColorFailure());
    } on FormatException {
      return Left(ColorFailure());
    }
  }
}

class ColorFailure extends Failure {
  @override
  List<Object?> get props => [];
}
