import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_test_app/GraphQL/graphQl_requester.dart';
import 'package:rick_and_morty_test_app/router/app_router.gr.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('charactersBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, index) {
        return GraphQLProvider(
          client: GraphQLRequester().myGQLClient(),
          child: MaterialApp.router(
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(),
            debugShowCheckedModeBanner: false,
            title: 'Rick and Morty',
            theme: ThemeData(),
          ),
        );
      },
    );
  }
}
