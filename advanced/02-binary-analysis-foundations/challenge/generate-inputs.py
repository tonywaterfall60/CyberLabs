#!/usr/bin/env python3
from pathlib import Path

out = Path('inputs')
out.mkdir(exist_ok=True)

for n in (16, 48, 64, 72, 80, 96, 128):
    (out / f'a-{n}.txt').write_text('A' * n)

alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
pattern = ''.join(alphabet[i % len(alphabet)] for i in range(160))
(out / 'pattern.txt').write_text(pattern)

print('[+] Wrote controlled local inputs to inputs/')