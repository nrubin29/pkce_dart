## 1.1.0+1

- Minor documentation fix.

## 1.1.0

- __BREAKING__: Removed the `stripTrailingPadding` parameter as padding should always be removed as per the [spec](https://datatracker.ietf.org/doc/html/rfc7636#section-3).
If your code passed `stripTrailingPadding: true`, you can simply remove this parameter and the behavior won't change.
If your code passed `stripTrailingPadding: false` or didn't pass anything, the behavior _will_ change. This shouldn't be a problem, but feel free to open an issue if it is.
- __BREAKING__: The `length` parameter now represents the length of the code verifier _before_ it is base64 encoded, so `length: 32` corresponds to a code verifier of length 43 and `length: 96` corresponds to a length of 128. The `length` parameter must be between 32 and 96, inclusive, and I strongly recommend using the default length of 32 suggested by the [spec](https://datatracker.ietf.org/doc/html/rfc7636#section-4.1).

## 1.0.0+1

- Fixed homepage in pubspec

## 1.0.0

- Initial version.
