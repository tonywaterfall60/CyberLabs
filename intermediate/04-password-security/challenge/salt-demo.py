import hashlib
import os

password = b"training-password"

for i in range(2):
    salt = os.urandom(16)
    verifier = hashlib.pbkdf2_hmac("sha256", password, salt, 200_000)
    print(f"Example {i+1}")
    print("salt:", salt.hex())
    print("verifier:", verifier.hex())
    print()

print("Same password, different salts, different stored verifiers.")