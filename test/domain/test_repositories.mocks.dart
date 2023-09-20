// Mocks generated by Mockito 5.4.2 from annotations
// in hotel/test/domain/test_repositories.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:hotel/core/failures/failure.dart' as _i5;
import 'package:hotel/src/domain/entities/booking.dart' as _i10;
import 'package:hotel/src/domain/entities/hotel.dart' as _i8;
import 'package:hotel/src/domain/entities/room.dart' as _i6;
import 'package:hotel/src/domain/repositories/booking_repository.dart' as _i9;
import 'package:hotel/src/domain/repositories/hotel_repository.dart' as _i7;
import 'package:hotel/src/domain/repositories/room_repository.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RoomRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockRoomRepository extends _i1.Mock implements _i3.RoomRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Room>>> getAllRooms() => (super.noSuchMethod(
        Invocation.method(
          #getAllRooms,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Room>>>.value(_FakeEither_0<_i5.Failure, List<_i6.Room>>(
          this,
          Invocation.method(
            #getAllRooms,
            [],
          ),
        )),
        returnValueForMissingStub: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Room>>>.value(_FakeEither_0<_i5.Failure, List<_i6.Room>>(
          this,
          Invocation.method(
            #getAllRooms,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Room>>>);
}

/// A class which mocks [HotelRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHotelRepository extends _i1.Mock implements _i7.HotelRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i8.Hotel>>> getAllHotel() => (super.noSuchMethod(
        Invocation.method(
          #getAllHotel,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i8.Hotel>>>.value(_FakeEither_0<_i5.Failure, List<_i8.Hotel>>(
          this,
          Invocation.method(
            #getAllHotel,
            [],
          ),
        )),
        returnValueForMissingStub: _i4.Future<_i2.Either<_i5.Failure, List<_i8.Hotel>>>.value(_FakeEither_0<_i5.Failure, List<_i8.Hotel>>(
          this,
          Invocation.method(
            #getAllHotel,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i8.Hotel>>>);
}

/// A class which mocks [BookingRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBookingRepository extends _i1.Mock implements _i9.BookingRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i10.Booking>> getBooking() => (super.noSuchMethod(
        Invocation.method(
          #getBooking,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i10.Booking>>.value(_FakeEither_0<_i5.Failure, _i10.Booking>(
          this,
          Invocation.method(
            #getBooking,
            [],
          ),
        )),
        returnValueForMissingStub: _i4.Future<_i2.Either<_i5.Failure, _i10.Booking>>.value(_FakeEither_0<_i5.Failure, _i10.Booking>(
          this,
          Invocation.method(
            #getBooking,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i10.Booking>>);
}