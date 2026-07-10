# Zhuyin language-model test dependency

`bopomofo_pro` uses the Traditional-Chinese word-level Rime Octagram model.
It improves contextual ranking of complete sentence candidates; it is not a
generative AI model and it does not upload typed text.

- Source: `https://github.com/lotem/rime-octagram-data`, branch `hant`
- Revision: `bb8e1313552f0f27f2f968031dfaf4563e55d982`
- File: `zh-hant-t-essay-bgw.gram`
- Size: 10,513,408 bytes
- SHA-256: `574c99d100f422766c433c601ed6efd642e881d69a30df9fffb6f1695be550e3`
- License: LGPL-3.0-or-later

Install it with `scripts/install-bopomofo-pro-model.sh`. The binary belongs in
`~/Library/Rime` and is deliberately excluded from Git.
