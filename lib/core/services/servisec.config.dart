// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hotel/src/domain/usecases/get_all_hotel_usecase.dart' as _i7;
import 'package:hotel/src/domain/usecases/get_all_rooms_usecase.dart' as _i8;
import 'package:hotel/src/domain/usecases/get_booking_usecase.dart' as _i9;
import 'package:hotel/src/domain/usecases/tourist_usecase/create_tourist_usecase.dart'
    as _i3;
import 'package:hotel/src/domain/usecases/tourist_usecase/delete_tourist_usecase.dart'
    as _i4;
import 'package:hotel/src/domain/usecases/tourist_usecase/find_all_tourist_usecase.dart'
    as _i5;
import 'package:hotel/src/domain/usecases/tourist_usecase/find_tourist_usecase.dart'
    as _i6;
import 'package:hotel/src/domain/usecases/tourist_usecase/update_tourist_usecase.dart'
    as _i10;
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
    gh.factory<_i3.CreateTouristUsecase>(() => _i3.CreateTouristUsecase());
    gh.factory<_i4.DeleteTouristUsecase>(() => _i4.DeleteTouristUsecase());
    gh.factory<_i5.FindAllTouristUsecase>(() => _i5.FindAllTouristUsecase());
    gh.factory<_i6.FindTouristUsecase>(() => _i6.FindTouristUsecase());
    gh.factory<_i7.GetAllHotelUseCase>(() => _i7.GetAllHotelUseCase());
    gh.factory<_i8.GetAllRoomsUseCase>(() => _i8.GetAllRoomsUseCase());
    gh.factory<_i9.GetBookingUseCase>(() => _i9.GetBookingUseCase());
    gh.factory<_i10.UpdateTouristUsecase>(() => _i10.UpdateTouristUsecase());
    return this;
  }
}
