Contributing
===

You want to contribute to LÖVR?  That's awesome!

Issues
---

[GitHub issues](https://github.com/bjornbytes/lovr/issues) are used for reporting bugs and
requesting new features or improvements.  Questions about using LÖVR should go in
[Matrix](https://lovr.org/matrix) or [Discord](https://lovr.org/discord).

Editing Documentation
---

Documentation improvements are very much appreciated!  All of the documentation pages have a handy
"Edit" button in the upper right which can be used to suggest changes.  These are submitted as pull
requests to the [lovr-docs repo](https://github.com/bjornbytes/lovr-docs), which contains all the
guides, examples, and API pages.  Documentation changes can also be suggested using a lovr-docs
GitHub issue or in chat.

Contributing Code
---

To contribute patches to the C code, you can fork LÖVR, commit to a branch, and submit a pull
request.  The target branch for the patch should be `master` for patch-level fixes, and `dev` for
new functionality or API changes.  Note that contributions to the repository will be released under
the terms in the LICENSE.  For larger changes, it is a good idea to engage in initial discussion via
issues or Matrix/Discord before submitting.  Try to stick to the existing coding style:

- 2 space indentation.
- 100 character wrapping (ish, sometimes it's more readable to just have a long line).
- Put stars near types: `Texture* texture`.
- Use curly braces for the bodies of conditionals and loops, and place them on the same line.  An
  exception can be made for very short blocks -- they can be placed inline without curlies, e.g.
  `if (data == NULL) return;`.
- Always use spaces around binary operators.
- Always use spaces around the condition in control flow: `while (condition) {`.

Organization
---

An overview of the folder structure:

- `deps` contains submodules for external dependencies.
- `etc` is a sort of "junk drawer" containing shaders, icons, scripts, etc.
- `src/api` contains Lua bindings.  There's a file for each module and object.
- `src/core` contains shared engine code.  It's usually lower-level and not specific to LÖVR.
- `src/lib` contains smaller third party libraries.
- `src/modules` has a folder for each module.
- `test` contains unit tests, used to catch bugs introduced by changes.  Run them with `lovr test`.

Branches other than dev and stable may be force-pushed during development to keep history clean.
