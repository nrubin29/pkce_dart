import 'package:pkce/pkce.dart';

void main() {
  final pkcePair = PkcePair.generate();
  print(pkcePair.codeChallenge);
  print(pkcePair.codeVerifier);
}
