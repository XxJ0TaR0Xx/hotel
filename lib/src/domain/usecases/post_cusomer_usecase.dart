import 'package:dartz/dartz.dart';
import 'package:hotel/core/failures/failure.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/core/usecase/usecase.dart';
import 'package:hotel/src/domain/entities/customer.dart';
import 'package:hotel/src/domain/repositories/customer_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class PostCustomerUseCase extends UseCase<Customer, Customer> {
  @override
  Future<Either<Failure, Customer>> call(Customer params) {
    final CustomerRepository customerRepository = servisec.get<CustomerRepository>();

    return customerRepository.postCustomer(customer: params);
  }
}
