const String createPet = '''
  mutation createPet(\$name: String, \$userId: ID!, \$photoUrl: String) {
    createPet(input: {name: \$name, userId: \$userId, photoUrl: \$photoUrl}) {
      id
      name
      photoUrl
    }
  }
''';
