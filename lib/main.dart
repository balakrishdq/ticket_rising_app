import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_raising_app/bloc/database/bloc/database_bloc.dart';
import 'package:ticket_raising_app/bloc/form/bloc/form_bloc.dart';
import 'package:ticket_raising_app/repository/database_repository.dart';
import 'package:ticket_raising_app/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FormBloc(
            DatabaseRepositoryImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => DatabaseBloc(
            DatabaseRepositoryImpl(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
