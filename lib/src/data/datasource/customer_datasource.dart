import 'package:dio/dio.dart';
import 'package:hotel/core/services/servisec.dart';
import 'package:hotel/src/data/models/customer_model.dart';
import 'package:hotel/src/data/utils/api_config.dart';
import 'package:hotel/src/data/utils/status_code_hendler.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CustomerDatasource {
  final DioModule dio;
  CustomerDatasource({required this.dio});

  String httpCustomers = '${ApiConfig.apiUri}customers';

  Future<CustomerModel> postCustomer({required CustomerModel customerModel}) async {
    try {
      final Response response = await dio.clietn.request(
        httpCustomers,
        options: Options(
          method: 'POST',
        ),
        data: customerModel.toJson(),
      );

      StatusCodeHandler.check(response.statusCode.toString());

      return CustomerModel.fromMap(response.data['data']);
    } catch (_) {
      rethrow;
    }
  }
}
