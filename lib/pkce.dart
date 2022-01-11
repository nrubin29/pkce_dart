library pkce;

import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

/// A pair of ([codeVerifier], [codeChallenge]) that can be used with PKCE
/// (Proof Key for Code Exchange).
class PkcePair {
  static const _alphabet =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~';

  /// The code verifier.
  final String codeVerifier;

  /// The code challenge, computed as base64Url(sha256([codeVerifier])) with
  /// padding removed as per the spec.
  final String codeChallenge;

  const PkcePair._(this.codeVerifier, this.codeChallenge);

  /// Generates a [PkcePair].
  ///
  /// [length] is the length of the [codeVerifier] and must be between 43 and
  /// 128 inclusive.
  factory PkcePair.generate({int length = 128}) {
    if (length < 43 || length > 128) {
      throw ArgumentError.value(
          length, 'length', 'The length must be between 43 and 128 inclusive.');
    }

    final random = Random.secure();
    final verifier = List.generate(
        length, (index) => _alphabet[random.nextInt(_alphabet.length)]).join();
    final challenge =
        base64UrlEncode(sha256.convert(ascii.encode(verifier)).bytes)
            .split('=')[0];

    return PkcePair._(verifier, challenge);
  }
}
