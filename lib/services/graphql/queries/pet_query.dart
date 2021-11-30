const String getPetsByUserId= '''
  query petsByUserId(\$userId: ID!, \$nextToken: String) {
    petsByUserId(limit: 10, nextToken: \$nextToken, userId: \$userId) {
        items {
          id
          name
          photoUrl
        }
        nextToken
    } 
  }
''';