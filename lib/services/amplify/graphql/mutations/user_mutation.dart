const String createUser = '''
  mutation createUser(\$name: String!, \$id: ID!) {
    createUser(input: {name: \$name, id: \$id }) {
      id
      name
    }
  }
''';