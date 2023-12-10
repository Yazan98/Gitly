# Gitly
Apple Multiplatform Application Based on Github GraphQL Api for (Macos, IOS) With SwiftUI

```
apollo schema:download --header="Authorization: Bearer TOKEN" --endpoint https://api.github.com/graphql schema.json
```

Generate Codegen Configurations File
```
./apollo-ios-cli init --schema-namespace GithubGraphQlApi --module-type swiftPackageManager
```

Generate Queries Swift Package
```
./apollo-ios-cli generate
```
