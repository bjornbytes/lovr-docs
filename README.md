lovr-docs
===

This repository contains the documentation for [LÖVR](https://github.com/bjornbytes/lovr).

There are three main types of documentation here:

- The `api` folder contains a Lua table containing metadata for all LÖVR functions and objects.
  - This is used to generate documentation, but is also useful for integrating with other tools
    (e.g. autocomplete for the LÖVR API in text editors).
- The `examples` folder contains sample LÖVR projects and tutorials.
  - The ones listed in the `init.lua` file are shown on the website.
  - All the code in the examples is released under CC0.  However, the models, textures, sounds, and
    other assets used may use different licensing, so be sure to double check those.
- The `guides` folder contains markdown files that explain LÖVR-related concepts in depth.
  - Similarly, `init.lua` contains a manifest used to populate the sidebar on the website.

There is a branch for each version of LÖVR.  Cherry picks are used to propagate fixes to the
relevant versions.
