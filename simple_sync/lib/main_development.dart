// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:logger/logger.dart';
import 'package:simple_sync/app/app.dart';
import 'package:simple_sync/bootstrap.dart';
import 'package:simple_sync/log.dart';

void main() {
  Log.logLevel = Level.verbose;
  bootstrap(() => const App());
}
