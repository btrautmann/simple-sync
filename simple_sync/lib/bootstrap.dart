// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    FirebaseCrashlytics.instance.recordFlutterError(details);
  };

  const initializationSettingsIOS = IOSInitializationSettings(
    onDidReceiveLocalNotification: onDidReceiveLocalNotification,
  );
  const initializationSettings = InitializationSettings(
    iOS: initializationSettingsIOS,
  );
  await FlutterLocalNotificationsPlugin().initialize(
    initializationSettings,
    onSelectNotification: (content) {
      log('Tapped notification with content $content');
    },
  );

  tz.initializeTimeZones();

  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(await builder()),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => FirebaseCrashlytics.instance.recordError(error.toString(), stackTrace),
  );
}

Future<void> onDidReceiveLocalNotification(
  int id,
  String? title,
  String? body,
  String? payload,
) async {
  log('Got notification with id $id and title $title');
}
