import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'key_state.g.dart';

@riverpod
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey(
  ScaffoldMessengerKeyRef ref,
) =>
    GlobalKey<ScaffoldMessengerState>();
