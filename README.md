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

[more info](https://gist.github.com/slattman/e3f725589aeb40a68bfec7201173e45b)

<sub>inspired by [My Favorite Readme Generator](https://github.com/slattman/my-favorite-readme-generator)</sub>

