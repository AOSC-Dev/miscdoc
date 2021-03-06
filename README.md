# MiscDoc


EXPERIMENTAL.

This is a documentation management repo, where we keep miscellaneous documents. Will we actually put this in use?




## PDF Artifacts

PDF artifacts are available on these mirrors:

- https://repo.aosc.io/misc/artifacts/miscdoc/
- https://neruthesgithubdistweb.vercel.app/miscdoc/




## Repo Structure

- `PROJNAME/`
  - `DOCNAME/`
    - `info.json`
    - `001-main.md` (along with other parts)
    - `999-appendix.tex` (optional)
    - `README.md` (automatically built, do not edit)
- `_dist/`
  - `PROJNAME/`
    - `DOCNAME.pdf`

The `projlist` file is a list of `PROJNAME` strings.

### `info.json`

This file contains information for building PDF.

This file should look like:

```json
{
    "author": "Neruthes, et al.",
    "latex_features": "abstract"
}
```

| Field          | Description                                                                                      |
| -------------- | ------------------------------------------------------------------------------------------------ |
| author         | Names of authors, used under the title.                                                          |
| latex_features | A list of features to be applied, in the specified order. Make it empty to disable all features. |
| lang           | Language for `date` to decide locale. The default value is `en_US`.                              |





## Building

### Dependencies

Our dependencies include:

- pandoc
- texlive
- fonts
  - Inter
  - Noto CJK
  - JetBrains Mono

### Preparations

Run `./makecidep.sh` to download build dependencies for GitHub Actions.

### Compiling

Run `./buildall.sh --force` to build for each `PROJNAME` (consulting the `projlist` file),
generating all `DOCNAME` artifacts in each `PROJNAME`.

Artifacts of `DOCNAME` include:

- Full-text Markdown: `PROJNAME/DOCNAME/README.md`
- PDF: `_dist/PROJNAME/DOCNAME.pdf`.

It will use the `defaultbuild.sh` for building every document target,
unless it finds a `build.sh` inside the `PROJNAME` directory.

### Releasing

Run `./release.sh` to make a release tarball.



## More Details

### LaTeX Features

| Feature | Description                                      |
| ------- | ------------------------------------------------ |
| abstrat | Detach the Abstract section from the first page. |
| notoc   | Remove TOC.                                      |
| cjk     | Add CJK support. Prefer Chinese over English.    |





## Copyright

All documents here (Markdown and PDF) are published under the
[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) license.

The supporting software code (shell scripts, LaTeX snippets, etc) are published
under the [GNU GPL 2.0](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html) license.

The visual identification materials of AOSC (the organization) are otherwise owned
and the their permissions are not governed here.
See https://github.com/AOSC-Dev/LOGO for more information.
