import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_test_app/GraphQL/qraphql_queries.dart';
import 'package:rick_and_morty_test_app/router/app_router.gr.dart';
import 'package:rick_and_morty_test_app/screens/characters_screen/characters_screen/local_widgets/box_character_data_widget.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List? characters;

  @override
  void setState(VoidCallback fn) {
    FetchMore;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 66.h, right: 16.w),
        child: Query(
          options: QueryOptions(
            document: gql(GraphQLQueries.getCharacterQuery),
          ),
          builder: (
            QueryResult result, {
            VoidCallback? refetch,
            FetchMore? fetchMore,
          }) {
            if (result.hasException) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    result.exception.toString(),
                  ),
                ),
              );
            }

            if (result.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            characters = result.data?['characters']?['results'];
            var box = Hive.box('charactersBox');
            box.put('characters', characters);
            print(box.get('characters'));

            if (characters == null) {
              return const Center(
                child: Text('No characters'),
              );
            }
            return ListView.separated(
              itemCount: characters!.length,
              itemBuilder: (context, index) {
                final character = characters![index];
                return BoxCharacterDataWidget(
                  imageUrl: character['image'],
                  name: character['name'],
                  isAlive: character['status'],
                  species: character['species'],
                  gender: character['gender'],
                  function: () {
                    context.router.push(
                      InfoCharacterScreen(
                        imageUrl: character['image'],
                        name: character['name'],
                        isAlive: character['status'],
                        species: character['species'],
                        gender: character['gender'],
                        origin: character['origin']['name'],
                        location: character['location']['name'],
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 24.h);
              },
            );
          },
        ),
      ),
    );
  }
}
