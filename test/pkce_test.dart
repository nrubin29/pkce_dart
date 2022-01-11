import 'package:pkce/pkce.dart';
import 'package:test/test.dart';

void main() {
  group(PkcePair, () {
    group('length', () {
      test('is correct for min length', () {
        final pkcePair = PkcePair.generate(length: 32);
        expect(pkcePair.codeVerifier, hasLength(44));
      });

      test('is correct for max length', () {
        final pkcePair = PkcePair.generate(length: 96);
        expect(pkcePair.codeVerifier, hasLength(128));
      });

      test('is correct for arbitrary length', () {
        final pkcePair = PkcePair.generate(length: 69);
        expect(pkcePair.codeVerifier, hasLength(92));
      });

      test('throws an exception when too short', () {
        expect(() => PkcePair.generate(length: 29), throwsArgumentError);
      });

      test('throws an exception when too long', () {
        expect(() => PkcePair.generate(length: 420), throwsArgumentError);
      });
    });

    test('strips padding', () {
      final pkcePair = PkcePair.generate();
      expect(pkcePair.codeChallenge, isNot(endsWith('=')));
    });
  });
}
