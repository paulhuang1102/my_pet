import 'package:my_pet/models/api_model.dart';
import 'package:my_pet/services/amplify/amplify_service.dart';
import 'package:my_pet/services/graphql/mutations/pet_mutation.dart';
import 'package:my_pet/services/graphql/queries/pet_query.dart';

class PetRepository {
  final AmplifyService _ampliy = AmplifyService();

  Future<bool> addPet({
    String? name = '',
    required userId,
    String? photo = '',
  }) async {
    final res = await _ampliy.api.mutation(
        createPet, {'name': name, 'userId': userId, 'photoUrl': photo});

    return res.success;
  }

  Future<ApiItmes?> fetchPetList(String userId, String? nextToken) async {
    final res = await _ampliy.api.query(
      getPetsByUserId,
      {
        'userId': userId,
        'nextToken': nextToken
      });
      if (res.success) {
        return ApiItmes.fromJson(res.data['petsByUserId']);
      } 
    }
}
