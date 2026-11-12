# Frida Gum TypeScript documentation

Generate HTML documentation from the [Frida Gum typings in DefinitelyTyped](https://github.com/DefinitelyTyped/DefinitelyTyped/tree/master/types/frida-gum).

Published documentation: https://trufae.github.io/frida-tsdoc/

## Build locally

Requires Git, Node.js with npm, Make, and zip (for the archive target).

```sh
make         # Clone or update the typings, install TypeDoc, and build docs/
make zip     # Build the documentation and create frida-gum-docs.zip
make clean   # Remove the generated documentation and archive
```

Open `docs/index.html` to read the documentation locally. The typings checkout
and installed Node.js tools are reused between builds.

## Publishing

Every push to `main` builds the latest upstream typings and deploys `docs/` to
GitHub Pages. The workflow can also be run manually from the Actions tab.
GitHub Pages must use **GitHub Actions** as its source in Settings → Pages.
