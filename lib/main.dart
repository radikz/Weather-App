import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show runApp;
import 'app.dart';
import 'simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
}