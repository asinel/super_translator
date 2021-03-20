import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:super_translator/data/translator/google_translator_repository.dart';
import 'package:super_translator/data/translator/i_translator_repository.dart';
import 'package:super_translator/domain/translator/translator_cubit.dart';
import 'package:super_translator/presentation/main_screen.dart';

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
          RepositoryProvider<ITranslatorRepository>(create: (context) => GoogleTranslatorRepository('https://translation.googleapis.com', DotEnv.env['GOOGLE_API_KEY']!))
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<TranslatorCubit>(create: (context) => TranslatorCubit(translatorRepository: RepositoryProvider.of<ITranslatorRepository>(context)))
          ],
          child: MainScreen(),
        ),
      ),
    );
  }
}
