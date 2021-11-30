const String createEating = '''
  mutation createEating(\$petId: ID!, \$food: String!, \$timestamp) {
    createEating(input: {petId: \$petId, food: \$food, timestamp: \$timestamp}) {
      id
      petId
      food
      timestamp
    }
  }
''';