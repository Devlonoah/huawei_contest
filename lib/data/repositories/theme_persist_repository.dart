import 'package:dartz/dartz.dart';
import 'package:huawei_contest/core/error/exceptions.dart';
import 'package:huawei_contest/core/error/failures.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String diskKey = 'DISK_KEY';

abstract class ThemePersistRepository {
  Future<Either<AppFailure, void>> saveThemeState(bool value);

  Future<bool> fetchThemeState();
}

class ThemePersistRepositoryImpl implements ThemePersistRepository {
  final SharedPreferences sharedPreference;

  ThemePersistRepositoryImpl(this.sharedPreference);

  @override
  Future<Either<AppFailure, void>> saveThemeState(bool value) async {
    try {
      await sharedPreference.setBool(diskKey, value);

      return Right(Future.value());
    } catch (e) {
      await Future.value();
      return Left(PersistentFailure());
    }
  }

  @override
  Future<bool> fetchThemeState() async {
    var value = sharedPreference.getBool(diskKey);

    return value != null ? await Future.value(value) : await Future.value(true);
  }
}
