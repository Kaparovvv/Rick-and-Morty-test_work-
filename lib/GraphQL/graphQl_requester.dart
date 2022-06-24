// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLRequester {
  static HttpLink httpLink = HttpLink(
    'https://rickandmortyapi.com/graphql',
  );

  ValueNotifier<GraphQLClient> myGQLClient() {
    return ValueNotifier<GraphQLClient>(
      GraphQLClient(
        cache: GraphQLCache(),
        link: httpLink,
      ),
    );
  }
}
