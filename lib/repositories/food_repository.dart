import 'package:my_pet/models/api_model.dart';
import 'package:my_pet/services/amplify/amplify_service.dart';
import 'package:my_pet/services/graphql/mutations/eating_mutation.dart';
import 'package:my_pet/services/graphql/queries/eating_query.dart';

class FoodRepository {
  final AmplifyService _amplify = AmplifyService();

  getList() {
    // _amplify.api.get('/eatings', apiName: 'mypetapi');
  }

  Future<String?> addFood({
    required String petId,
    required String food,
    required int timestamp,
  }) async {
    final res = await _amplify.api.mutation(
      createEating,
      {
        'petId': petId,
        'food': food,
        'timestamp': timestamp,
      },
    );

    if (res.success) {
      return res.data['createEating']['id'];
    }
  }

  Future<ApiItmes> getFoodList(String petId, String? nextToken) async {
    final res = await _amplify.api
        .query(getEatingList, {'petId': petId, 'nextToken': nextToken});
    return ApiItmes.fromJson(res.data['eatingsByPetId']);
  }
}
