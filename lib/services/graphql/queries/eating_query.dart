const String getEatingList = '''
  query eatingsByPetId(\$petId: ID!, \$nextToken: String) {
    eatingsByPetId(petId: \$petId, nextToken: \$nextToken, limit: 10) {
      items {
        id
        food
        petId
        timestamp
      }
      nextToken
    }

  } 
''';
