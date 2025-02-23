// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../ecma/ecma_policy.dart';
import '../locale.dart';
import '../options.dart';
import '../utils.dart';
import 'number_format_4x.dart';
import 'number_format_options.dart';
import 'number_format_stub.dart' if (dart.library.js) 'number_format_ecma.dart';

/// This is an intermediate to defer to the actual implementations of
/// Number formatting.
abstract class NumberFormatImpl {
  final String locale;

  NumberFormatImpl(this.locale);

  String formatImpl(Object number, NumberFormatOptions options);

  factory NumberFormatImpl.build(
    Locale locale,
    LocaleMatcher localeMatcher,
    EcmaPolicy ecmaPolicy,
  ) =>
      buildFormatter(
        locale,
        localeMatcher,
        ecmaPolicy,
        getNumberFormatterECMA,
        getNumberFormatter4X,
      );
}
