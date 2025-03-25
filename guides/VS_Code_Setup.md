VS Code Setup
===

[VS Code](https://code.visualstudio.com) is a popular text editor with a powerful [Lua Language
Server](https://luals.github.io) extension that provides typechecking and autocomplete for Lua.
LuaLS has an official addon for LÖVR, which allows VS Code to autocomplete the LÖVR API with
detailed type information generated from the docs.

Setup
---

To start, install the LuaLS extension.  Press `Ctrl + Shift + P` and type "install extensions".  In
the extension menu, search for "Lua" and install the extension from sumneko.

<img src="/img/luals_install.png" alt="VS Code Extension Menu" width="70%"/>

Next, open the LuaLS addon manager.  Press `Ctrl + Shift + P` again and search for "addon manager".
Search for "lovr" in the addon manager and install it.

![LuaLS Addon Menu](https://lovr.org/static/img/luals_lovr.png)

That's it!  LÖVR autocomplete should now be working.

![LuaLS Autocompleting Stuff](https://lovr.org/static/img/luals_working.png)

Manual Installation
---

It is possible to generate LuaLS definitions from the API data in the
[lovr-docs](https://github.com/bjornbytes/lovr-docs) repo.  This can be useful to generate
bleeding-edge LuaLS definitions, since the official addon is only updated when LÖVR releases a new
version.

To do this, run `lovr api cats` from the root of the lovr-docs repository, which will output the
definitions to `api/cats` (there should be a `config.json` and a `library` folder in there).
Finally, the full path to the `cats` folder can be added to the `Lua.workspace.library` setting to
use these custom definitions in a workspace.
