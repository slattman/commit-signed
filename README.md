# commit-signed

a githut workflow action designed to commit signed with the verified github-actions[[bot](#)]

## Example Usage

### commit-signed.yml
```yml
name: commit-signed
on:
  workflow_dispatch:
  workflow_call:
jobs:
  commit:
    runs-on: macOS-latest
    permissions: write-all
    env:
      GH_TOKEN: ${{ github.token }}
    steps:
      - uses: actions/checkout@v4
      - uses: slattman/my-favorite-readme-generator@latest
      - uses: slattman/commit-signed@latest
      - run: gh run delete $(gh run list --json databaseId -q "map(.databaseId)[1]")

```

or alternatively as a reusable workflow - [more](https://docs.github.com/en/actions/sharing-automations/reusing-workflows)

### signed-commit.yml
```yml
name: signed-commit
on:
  workflow_dispatch:
jobs:
  signed-commit:
    uses: slattman/commit-signed/.github/workflows/commit-signed.yaml@main
    permissions: write-all
```

<sub>inspired by [My Favorite Readme Generator](https://github.com/marketplace/actions/my-favorite-readme-generator)</sub>

