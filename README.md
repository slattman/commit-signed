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

[learn more...](https://gist.github.com/slattman/efc266585e6d74bab6af6c42559e0d93)

<sub>inspired by [My Favorite Readme Generator](https://github.com/slattman/my-favorite-readme-generator)</sub>

