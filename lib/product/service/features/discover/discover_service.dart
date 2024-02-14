import 'dart:developer';

import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:movitty/product/service/index.dart';
import 'package:movitty/product/service/interface/discover_operation.dart';
import 'package:vexana/vexana.dart';

final class DiscoverService extends DiscoverOperation {
  DiscoverService(INetworkManager<EmptyModel> networkManager)
      : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<DiscoverSections> discoverSections() async {
    final response = await _networkManager.send<
        BaseResponseModel<DiscoverSections>,
        BaseResponseModel<DiscoverSections>>(
      ProductServicePath.discover.rawValue,
      parseModel: BaseResponseModel<DiscoverSections>(data: DiscoverSections()),
      method: RequestType.POST,
      onReceiveProgress: (progress, total) {
        Logger().i('progress: $progress, total: $total');
      },
      data: {
        'user_id': 'user id',
        'language': 'language',
        'region': 'region',
        'type_id': 'type id',
      },
    );
    warningManager.handleResponse(response.data);
    log(
      'SUCCESS: ${response.data?.success}',
      name: 'HomeService.header',
    );
    log(
      'MESSAGE: ${response.data?.message}',
      name: 'HomeService.header',
    );
    log(
      'DATA-Object: ${response.data}',
      name: 'HomeService.header',
    );
    log(
      'DATA-Object2: ${response.data?.data}',
      name: 'HomeService.header',
    );
    log(
      'ERROR-StatusCode: ${response.error?.statusCode}',
      name: 'HomeService.header',
    );
    log(
      'ERROR-Description: ${response.error?.description}',
      name: 'HomeService.header',
    );

    if (response.error?.statusCode == null && response.data?.data != null) {
      return response.data!.data!;
    } else {
      throw Exception(response.error?.description ?? response.data?.message);
    }
  }
}
