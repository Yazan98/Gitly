# Gitly
IOS Application Based on Github GraphQL Api With SwiftUI

## Description
This Application Built to try GraphQl With Github Api to fetch data and Build Nested Navigations In the Application

## Commands
1. To Pull the Schema and Save it in Json File
2. 
```
apollo schema:download --header="Authorization: Bearer TOKEN" --endpoint https://api.github.com/graphql schema.json
```

2. Generate Codegen Configurations File
```
./apollo-ios-cli init --schema-namespace GithubGraphQlApi --module-type swiftPackageManager
```

3. Generate Queries Swift Package
```
./apollo-ios-cli generate
```

## Project Components
1. SwiftUI
2. UserDefaults
3. Apollo Client
4. GraphQl Queries
5. Infinite Scrolling (Pagination)
6. Dynamic List By Widgets
7. Nested Navigation Between Profiles

## Project Features
1. onBoarding Screen
2. Login Screen
3. Home Screen
4. Followers
5. Followings
6. Repositories
7. Starred Repositories
8. Organizations List
9. Profile repositories


## Project Screenshots

| ![](https://github.com/Yazan98/Gitly/blob/main/Screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-01-19%20at%2013.44.47.png?raw=true)  | ![](https://github.com/Yazan98/Gitly/blob/main/Screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-01-19%20at%2013.44.53.png?raw=true)  | ![](https://github.com/Yazan98/Gitly/blob/main/Screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-01-19%20at%2013.45.32.png?raw=true)  | ![](https://github.com/Yazan98/Gitly/blob/main/Screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-01-19%20at%2013.45.46.png?raw=true)  |  ![](https://github.com/Yazan98/Gitly/blob/main/Screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-01-19%20at%2013.45.56.png?raw=true) |
|---|---|---|---|---|
|  ![](https://github.com/Yazan98/Gitly/blob/main/Screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-01-19%20at%2013.46.10.png?raw=true) | ![](https://github.com/Yazan98/Gitly/blob/main/Screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-01-19%20at%2013.46.16.png?raw=true)  |  ![](https://github.com/Yazan98/Gitly/blob/main/Screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-01-19%20at%2013.46.35.png?raw=true) |  ![](https://github.com/Yazan98/Gitly/blob/main/Screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-01-19%20at%2013.46.57.png?raw=true) | ![](https://github.com/Yazan98/Gitly/blob/main/Screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-01-19%20at%2013.48.19.png?raw=true)  |
| ![](https://github.com/Yazan98/Gitly/blob/main/Screenshots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-01-19%20at%2013.48.27.png?raw=true)  | 

