# Repository rule: all code must be fully encrypted/obfuscated

This repository publishes **only fully encrypted (obfuscated) Lua**. No readable
source may be committed.

## Rule

- Every `.lua` file committed here must be fully obfuscated — no plaintext logic,
  variable names, or comments that reveal behavior.
- Do not commit the original, unobfuscated source. Keep that in a private
  location and only publish the obfuscated build.
- Loader/config files (e.g. a JSON access manifest) are allowed in plaintext,
  but any executable payload they point to or embed must be encrypted.
- A file is considered compliant only if, opened on its own, it does not expose
  the readable implementation.

## When adding or updating a file

1. Obfuscate the source before committing.
2. Verify the committed file contains no readable logic.
3. If a file would ship readable code, do not commit it — obfuscate first.

## For Claude

When asked to add or change code in this repo, produce or require the
obfuscated form. Do not commit plaintext implementation. If you are given
unobfuscated source, flag that it must be obfuscated before it can land here.
