
# MaTeam
built with UIKit / SwiftUI, in a clean architecture using the MVVM design pattern and repository pattern. The app communicates with the APIto fetch data, and has unit & integration tests for the network layer / ViewModels.

## Features
- Asynchronous fetch from server
- Asynchronous Auto complete
- Search engine based on local data

## Clean Architecture
Built using the MVVM design pattern, which helps to separate the UI code from the business logic. 
The repository pattern is used to abstract the data access layer.

## Tests
Unit tests have been written for the network layer to ensure reliable communication with the backend server.
Integration Tests using custom mocks to test repositories and View models.
These tests can be run by navigating to the Tests folder in Xcode and running the MaTeamTests target.

## Requirements
iOS 15.0+
Xcode 13+

## Overview
- MVVM, Repository Design Pattern
- Dependency Injection for easier testing and respect of rule #5 _Dependency inversion principle_ (Aka SOLID principles)
- Network layer built in Test Driven Dev | All the network and API fetch are built using Testing. (use `networkLayer` branch in case)
- Uses Async / Await for networking and Image Downloading. (iOS13+)
- Uses Mocks and Stubs for Unit testing
- Uses Reactive programming with Combine / UIKit, SwiftUI
- Support Dark/ Light 
- Uses Github Actions CI for merges

## Depencencies
zero

## Installation
Clone the main repository, build and run


## Screenshots

Dark - Light Support


[![Light2](/screenshot/screenshot2.png)]
[![Light3](/screenshot/screenshot3.png)]
[![Light4](/screenshot/screenshot4.png)]
[![Light4](/screenshot/screenshot5.png)]

[![Tests](/screenshot/screenshot1-test.png)]
