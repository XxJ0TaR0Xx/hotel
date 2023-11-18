import 'package:dartz/dartz.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/src/domain/entities/customer.dart';

abstract class CustomerRepository {
  Future<Either<Failure, Customer>> postCustomer({required Customer customer});
}
