import 'package:my_pet/services/amplify/amplify_service.dart';

class FoodRepository {
  final AmplifyService _amplify = AmplifyService();

  getList() {
    // _amplify.api.get('/eatings', apiName: 'mypetapi');
  }
  
  addFood(food) {
    // _amplify.api.post('/food', food, apiName: 'mypetfood');
  }
}