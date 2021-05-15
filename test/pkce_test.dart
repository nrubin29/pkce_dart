import 'package:pkce/pkce.dart';
import 'package:test/test.dart';

void main() {
  group(PkcePair, () {
    group('length', () {
      test('is set when in range', () {
        final pkcePair = PkcePair.generate(length: 69);
        expect(pkcePair.codeVerifier, hasLength(69));
      });

      test('throws an exception when too short', () {
        expect(() => PkcePair.generate(length: 29), throwsArgumentError);
      });

      test('throws an exception when too long', () {
        expect(() => PkcePair.generate(length: 420), throwsArgumentError);
      });
    });

    group('stripTrailingPadding', () {
      test('doesn\'t strip when false', () {
        final pkcePair = PkcePair.generate();
        expect(pkcePair.codeChallenge, endsWith('='));
      });

      test('does strip when true', () {
        final pkcePair = PkcePair.generate(stripTrailingPadding: true);
        expect(pkcePair.codeChallenge, isNot(endsWith('=')));
      });
    });
  });
}
