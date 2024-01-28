import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/modules/splash/view/splash_page.dart';
import 'modules/home/bloc/bloc.dart';
import 'modules/home/view/home_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BlocProvider(
        create: (context) => HomeBloc(),
        child: HomeForm(),
      ),
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
