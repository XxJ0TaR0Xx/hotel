// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hotel/core/services/servisec.dart' as _i8;
import 'package:hotel/src/data/datasource/booking_datasource.dart' as _i28;
import 'package:hotel/src/data/datasource/customer_datasource.dart' as _i31;
import 'package:hotel/src/data/datasource/hotel_datasource.dart' as _i15;
import 'package:hotel/src/data/datasource/room_datasource.dart' as _i21;
import 'package:hotel/src/data/datasource/tourist_datasource.dart' as _i24;
import 'package:hotel/src/data/repositories/booking_reposiytory_impl.dart'
    as _i30;
import 'package:hotel/src/data/repositories/customer_repository_impl.dart'
    as _i33;
import 'package:hotel/src/data/repositories/hotel_repository_impl.dart' as _i17;
import 'package:hotel/src/data/repositories/room_repository_impl.dart' as _i23;
import 'package:hotel/src/data/repositories/tourist_repository_impl.dart'
    as _i26;
import 'package:hotel/src/data/utils/api_config.dart' as _i5;
import 'package:hotel/src/domain/repositories/booking_repository.dart' as _i29;
import 'package:hotel/src/domain/repositories/customer_repository.dart' as _i32;
import 'package:hotel/src/domain/repositories/hotel_repository.dart' as _i16;
import 'package:hotel/src/domain/repositories/room_repository.dart' as _i22;
import 'package:hotel/src/domain/repositories/tourist_repository.dart' as _i25;
import 'package:hotel/src/domain/usecases/get_all_hotel_usecase.dart' as _i11;
import 'package:hotel/src/domain/usecases/get_all_rooms_usecase.dart' as _i12;
import 'package:hotel/src/domain/usecases/get_booking_usecase.dart' as _i13;
import 'package:hotel/src/domain/usecases/post_cusomer_usecase.dart' as _i19;
import 'package:hotel/src/domain/usecases/tourist_usecase/create_tourist_usecase.dart'
    as _i6;
import 'package:hotel/src/domain/usecases/tourist_usecase/delete_tourist_usecase.dart'
    as _i7;
import 'package:hotel/src/domain/usecases/tourist_usecase/find_all_tourist_usecase.dart'
    as _i9;
import 'package:hotel/src/domain/usecases/tourist_usecase/find_tourist_usecase.dart'
    as _i10;
import 'package:hotel/src/domain/usecases/tourist_usecase/update_tourist_usecase.dart'
    as _i27;
import 'package:hotel/src/domain/validator/add_email_validator.dart' as _i3;
import 'package:hotel/src/domain/validator/add_number_validator.dart' as _i4;
import 'package:hotel/src/presentation/controller/hotel_page_controller/hotel_controller.dart'
    as _i14;
import 'package:hotel/src/presentation/controller/number_page_controller/number_controller.dart'
    as _i18;
import 'package:hotel/src/presentation/controller/reservation_page_controlle/reservation_page_controller.dart'
    as _i20;
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
    gh.singleton<_i3.AddEmailValidator>(_i3.AddEmailValidator());
    gh.singleton<_i4.AddNumberValidator>(_i4.AddNumberValidator());
    gh.singleton<_i5.ApiConfig>(_i5.ApiConfig());
    gh.factory<_i6.CreateTouristUsecase>(() => _i6.CreateTouristUsecase());
    gh.factory<_i7.DeleteTouristUsecase>(() => _i7.DeleteTouristUsecase());
    gh.factory<_i8.DioModule>(() => _i8.DioModule());
    gh.factory<_i9.FindAllTouristUsecase>(() => _i9.FindAllTouristUsecase());
    gh.factory<_i10.FindTouristUsecase>(() => _i10.FindTouristUsecase());
    gh.factory<_i11.GetAllHotelUseCase>(() => _i11.GetAllHotelUseCase());
    gh.factory<_i12.GetAllRoomsUseCase>(() => _i12.GetAllRoomsUseCase());
    gh.factory<_i13.GetBookingUseCase>(() => _i13.GetBookingUseCase());
    gh.singleton<_i14.HotelController>(_i14.HotelController(
        getAllHotelUseCase: gh<_i11.GetAllHotelUseCase>()));
    gh.factory<_i15.HotelDatasource>(
        () => _i15.HotelDatasource(dio: gh<_i8.DioModule>()));
    gh.factory<_i16.HotelRepository>(() =>
        _i17.HotelRepositoryImpl(hotelDatasource: gh<_i15.HotelDatasource>()));
    gh.singleton<_i18.NumberController>(_i18.NumberController(
        getAllRoomsUseCase: gh<_i12.GetAllRoomsUseCase>()));
    gh.factory<_i19.PostCustomerUseCase>(() => _i19.PostCustomerUseCase());
    gh.singleton<_i20.ReservationController>(_i20.ReservationController(
      gh<_i6.CreateTouristUsecase>(),
      gh<_i13.GetBookingUseCase>(),
      gh<_i19.PostCustomerUseCase>(),
      gh<_i4.AddNumberValidator>(),
      gh<_i3.AddEmailValidator>(),
    ));
    gh.factory<_i21.RoomDatasour>(
        () => _i21.RoomDatasour(dio: gh<_i8.DioModule>()));
    gh.factory<_i22.RoomRepository>(
        () => _i23.RoomRepositoryImpl(roomDatasour: gh<_i21.RoomDatasour>()));
    gh.factory<_i24.TouristDatasource>(
        () => _i24.TouristDatasource(dio: gh<_i8.DioModule>()));
    gh.factory<_i25.TouristRepository>(() => _i26.TouristrepositoriImpl(
        touristDatasource: gh<_i24.TouristDatasource>()));
    gh.factory<_i27.UpdateTouristUsecase>(() => _i27.UpdateTouristUsecase());
    gh.factory<_i28.BookingDatasource>(
        () => _i28.BookingDatasource(dio: gh<_i8.DioModule>()));
    gh.factory<_i29.BookingRepository>(() => _i30.BookingRepositoryImpl(
        bookingDatasource: gh<_i28.BookingDatasource>()));
    gh.factory<_i31.CustomerDatasource>(
        () => _i31.CustomerDatasource(dio: gh<_i8.DioModule>()));
    gh.factory<_i32.CustomerRepository>(() => _i33.CustomerRepositoryImpl(
        customerDatasource: gh<_i31.CustomerDatasource>()));
    return this;
  }
}
