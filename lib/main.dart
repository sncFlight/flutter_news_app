import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BlocProvider(
        create: (context) => HomeBloc()..add(PageOpenedEvent()),
        child: const HomeForm(),
      ),
    );
  }
}
