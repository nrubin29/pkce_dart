# pkce_dart

A library for generating code verifier and code challenge pairs for PKCE (Proof Key for Code Exchange).

## Usage

A simple usage example:

```dart
import 'package:pkce/pkce.dart';

void main() {
  final pkcePair = PkcePair.generate();
  print(pkcePair.codeVerifier);
  print(pkcePair.codeChallenge);
}
```
