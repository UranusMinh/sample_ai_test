import 'package:flutter/material.dart';
import 'package:flutter_generate_ai_stable_diffusion/bloc/global_bloc.dart';

import 'widgets/button_process.dart';
import 'widgets/input_text.dart';
import 'widgets/result_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(body: const MyHomePage(title: 'Demo app')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _generatedInput = '';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ResultImage(),
              const Padding(padding: EdgeInsets.all(5.0)),
              InputText(
                onChanged: (value) {
                  _generatedInput = value;
                },
              ),
              const Padding(padding: EdgeInsets.all(10.0)),
              ButtonProcess(
                onPressed: () => globalBloc.generateImage(_generatedInput),
              ),
            ],
          ),
        ),
        StreamBuilder<bool>(
            stream: globalBloc.isLoadingStream,
            builder: (context, snapshot) {
              final isLoading = snapshot.data ?? false;
              if (!isLoading) {
                return Container();
              }
              return Material(
                color: Colors.transparent,
                child: Container(
                  color: Colors.black38,
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text('Generating....'),
                      ],
                    ),
                  ),
                ),
              );
            })
      ],
    );
  }
}

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  NavigatorState get navigator => Navigator.of(this);
  FocusScopeNode get focusScope => FocusScope.of(this);
  ScaffoldState get scaffold => Scaffold.of(this);
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}
