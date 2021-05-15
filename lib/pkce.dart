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

  /// The code challenge, computed as base64Url(sha256([codeVerifier]));
  final String codeChallenge;

  const PkcePair._(this.codeVerifier, this.codeChallenge);

  /// Generates a [PkcePair].
  ///
  /// [length] is the length of the [codeVerifier] and must be between 43 and
  /// 128 inclusive.
  ///
  /// Some services, such as Spotify, expect that the [codeChallenge] will not
  /// have any trailing padding. Set [stripTrailingPadding] to true to strip
  /// trailing padding.
  factory PkcePair.generate(
      {int length = 128, bool stripTrailingPadding = false}) {
    if (length < 43 || length > 128) {
      throw ArgumentError.value(
          length, 'length', 'The length must be between 43 and 128 inclusive.');
    }

    final random = Random.secure();
    final verifier = List.generate(
        length, (index) => _alphabet[random.nextInt(_alphabet.length)]).join();
    var challenge =
        base64UrlEncode(sha256.convert(ascii.encode(verifier)).bytes);

    if (stripTrailingPadding) {
      while (challenge.endsWith('=')) {
        challenge = challenge.substring(0, challenge.length - 1);
      }
    }

    return PkcePair._(verifier, challenge);
  }
}
