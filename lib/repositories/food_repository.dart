import 'package:my_pet/services/amplify/amplify_service.dart';
import 'package:my_pet/services/graphql/mutations/eating_mutation.dart';

class FoodRepository {
  final AmplifyService _amplify = AmplifyService();

  getList() {
    // _amplify.api.get('/eatings', apiName: 'mypetapi');
  }

  addFood({
    required String petId,
    required String food,
    required int timestamp,
  }) {
    _amplify.api.mutation(
        createEating, {'petid': petId, 'food': food, 'timestamp': timestamp});
  }
}
