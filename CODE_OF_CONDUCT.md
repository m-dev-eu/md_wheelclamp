# Contributor Code of Conduct

If you want to contribute you should watch the following adviers:

General:
- We want to provide high quality scripts.
- Our scripts are **NOT** [Open Source](https://opensource.org/osd/).

Concerning the code:
- No lint errors are present.
- Use `lib.print` to print.
- Do not nest statements.
- Use the functions ox_lib provides (notify, input, menu, natives).
- Watch basic conventions (camelCase, _, ...).
- For config files in bigger scripts dont define it global but make it return a table and require it.
- For bigger scripts use the sumneko lua addon to define types.
- Watch out for performance.

But everyone makes mistakes, so if you see a part of the code not respecting the mentioned guide make a pr and be respectfull.