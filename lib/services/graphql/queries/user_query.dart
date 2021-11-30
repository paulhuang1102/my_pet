const String getUser = '''
  query getUser(\$id: ID!) {
    getUser(id: \$id) {
      id
      name
    }
  }

''';
