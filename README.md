# commit-signed

a githut workflow action designed to commit signed

## Example Usage

### commit-signed.yaml
```yaml
name: commit-signed
on:
  workflow_dispatch:
  workflow_call:
jobs:
  commit:
    runs-on: macos-latest
    permissions: write-all
    env:
      GH_TOKEN: ${{ github.token }}
    steps:
      - uses: actions/checkout@v4
      - uses: slattman/my-favorite-readme-generator@latest
      - uses: slattman/commit-signed@latest
      - run: gh run delete $(gh run list --json databaseId -q "map(.databaseId)[1]")

```

[gist](https://gist.github.com/slattman/53d59845a6eca955867ccd5d4d05b4f5)

<sub>inspired by [My Favorite Readme Generator](https://github.com/slattman/my-favorite-readme-generator)</sub>

