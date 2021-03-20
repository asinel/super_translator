import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:super_translator/data/db/db.dart';
import 'package:super_translator/data/favorite/db_favorite_repository.dart';
import 'package:super_translator/data/translator/google_translator_repository.dart';
import 'package:super_translator/data/translator/i_translator_repository.dart';
import 'package:super_translator/domain/favorites/favorites_cubit.dart';
import 'package:super_translator/domain/translator/translator_cubit.dart';
import 'package:super_translator/presentation/main_screen.dart';

import 'data/favorite/i_favorite_repository.dart';

void main() async {
  await DotEnv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super Translator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ITranslatorRepository>(create: (context) => GoogleTranslatorRepository('https://translation.googleapis.com', DotEnv.env['GOOGLE_API_KEY']!)),
          RepositoryProvider<IFavoriteRepository>(create: (context) => DbFavoriteRepository(MyDatabase()))
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<TranslatorCubit>(create: (context) => TranslatorCubit(RepositoryProvider.of<ITranslatorRepository>(context), RepositoryProvider.of<IFavoriteRepository>(context))),
            BlocProvider<FavoritesCubit>(create: (context) => FavoritesCubit(RepositoryProvider.of<IFavoriteRepository>(context)))
          ],
          child: MainScreen(),
        ),
      ),
    );
  }
}
