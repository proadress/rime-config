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

# Wanxiang grammar model (optional test scheme)

`bopomofo_pro_wx` is a side-by-side variant of `bopomofo_pro` that swaps in
the Wanxiang (萬象) project's much larger Traditional-Chinese grammar model,
to compare contextual-ranking quality against the default 10 MB model above.

- Source: `https://github.com/amzxyz/rime-wanxiang-data`, release tag `LTS`
- File: `wanxiang-lts-zh-hant.gram`
- Size: ~400 MB (grows over time; the author updates this asset in place)
- License: CC-BY-4.0

Unlike the model above, this is a **rolling** release with no fixed revision
or checksum to pin against, so `scripts/install-wanxiang-model.sh` always
fetches whatever is currently published and does not verify its contents.
It is a community (not official Rime) project; treat `bopomofo_pro_wx` as
experimental and keep using `bopomofo_pro` if it doesn't clearly do better.

Install it with `scripts/install-wanxiang-model.sh`. The binary belongs in
`~/Library/Rime` and is deliberately excluded from Git.
