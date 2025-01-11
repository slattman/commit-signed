#!/bin/bash
gql=$(cat <<gql
  mutation () {
    createCommitOnBranch(input: {
      branch: { repositoryNameWithOwner: "$GITHUB_REPOSITORY", branchName: "$GITHUB_REF_NAME" },
      message: { headline: "$GITHUB_JOB" },
      fileChanges: { additions: [ $(rev <<< $(git diff --diff-filter=M --name-only $GITHUB_REF_NAME | awk '{system("contents=$(base64 -i "$1") && echo \"{ path: \\\""$1"\\\", contents: \\\"$contents\\\" },\"")}') | cut -c2- | rev) ] },
      expectedHeadOid: "$(git rev-parse HEAD)"
    }) { commit { url } }
  }
gql) && gh api graphql -f query="$gql"