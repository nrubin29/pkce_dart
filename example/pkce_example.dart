import 'package:pkce/pkce.dart';

void main() {
  final pkcePair = PkcePair.generate();
  print(pkcePair.codeVerifier);
  print(pkcePair.codeChallenge);
}
