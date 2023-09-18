// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hotel/src/domain/usecases/get_all_hotel_usecase.dart' as _i3;
import 'package:hotel/src/domain/usecases/get_all_rooms_usecase.dart' as _i4;
import 'package:hotel/src/domain/usecases/get_booking_usecase.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt generate({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.GetAllHotelUseCase>(() => _i3.GetAllHotelUseCase());
    gh.factory<_i4.GetAllRoomsUseCase>(() => _i4.GetAllRoomsUseCase());
    gh.factory<_i5.GetBookingUseCase>(() => _i5.GetBookingUseCase());
    return this;
  }
}
