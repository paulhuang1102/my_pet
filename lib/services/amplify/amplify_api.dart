part of './amplify_service.dart';

class AmplifyApi {
  factory AmplifyApi() => instance;

  AmplifyApi._internal();
  static AmplifyApi instance = AmplifyApi._internal();

  Future<ApiResponse> query(
      String graphQLDocument, Map<String, dynamic> variables) async {
    try {
      final operation = Amplify.API.query(
          request: GraphQLRequest<String>(
              document: graphQLDocument, variables: variables));

      final response = await operation.response;
      final data = json.decode(response.data);

      Log.debug('Query result: $data');

      return ApiResponse(
        success: true,
        data: data,
      );
    } on ApiException catch (e) {
      Log.error('Query failed: $e');
      return ApiResponse(
        success: false,
      );
    }
  }

  Future<ApiResponse> mutation(
      String graphQLDocument, Map<String, dynamic> variables) async {
    try {
      final request = GraphQLRequest<String>(
          document: graphQLDocument, variables: variables);

      final operation = Amplify.API.mutate(request: request);
      final response = await operation.response;

      final data = json.decode(response.data);

      return ApiResponse(
        success: true,
        data: data,
      );
    } on ApiException catch (e) {
      Log.error('Mutation failed: $e');
      return ApiResponse(
        success: false,
      );
    }
  }

  // get(String path, {Map<String, String>? params, String? apiName}) async {
  //   try {
  //     RestOptions options = RestOptions(
  //       path: path,
  //       queryParameters: params,
  //       apiName: apiName,
  //     );

  //     RestOperation operation = Amplify.API.get(restOptions: options);
  //     RestResponse response = await operation.response;

  //     final Map res = json.decode(response.body);
  //     Log.debug('Get calll successed ${res['data']}');

  //     return res;

  //   } on ApiException catch (e) {
  //     Log.error('Get call failed: $e');
  //   }
  // }

  // post(String path, Map body, {String? apiName}) async {
  //   try {
  //     RestOptions options = RestOptions(
  //       path: path,
  //       body: Uint8List.fromList(json.encode(body).codeUnits),
  //       apiName: apiName,
  //     );
  //     RestOperation restOperation = Amplify.API.post(restOptions: options);
  //     RestResponse response = await restOperation.response;
  //     final Map res = json.decode(response.body);

  //     print('POST call succeeded');
  //     return res;
  //   } on ApiException catch (e) {
  //     print('POST call failed: $e');
  //   }
  // }
}
