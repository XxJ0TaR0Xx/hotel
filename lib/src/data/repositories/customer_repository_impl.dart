import 'package:dartz/dartz.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/src/data/data_errors/data_errors.dart';
import 'package:hotel/src/data/datasource/customer_datasource.dart';
import 'package:hotel/src/data/failures/trace_failures.dart';
import 'package:hotel/src/data/models/customer_model.dart';
import 'package:hotel/src/domain/entities/customer.dart';
import 'package:hotel/src/domain/repositories/customer_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CustomerRepository)
class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerDatasource customerDatasource;

  CustomerRepositoryImpl({required this.customerDatasource});

  @override
  Future<Either<Failure, Customer>> postCustomer({required Customer customer}) async {
    try {
      CustomerModel customerModel = CustomerModel(id: 0, email: customer.email, number: customer.number);
      Customer customers = await customerDatasource.postCustomer(customerModel: customerModel);

      return Right(customers);
    } on BadRequestError {
      return const Left(BadRequestFailure(StackTrace.empty));
    } on UnauthorizedError {
      return const Left(UnauthorizedFailure(StackTrace.empty));
    } on (
      ForbiddenError,
      NotFoundError,
      InternalServerError,
      UndefiendError,
    ) {
      return const Left(ExtraFailure(StackTrace.empty));
    } catch (_) {
      rethrow;
    }
  }
}
