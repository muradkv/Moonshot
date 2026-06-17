# Moonshot

![Swift](https://img.shields.io/badge/Swift-5.0+-FA7343?logo=swift&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-18.0+-000000?logo=apple&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-16.0+-147EFB?logo=xcode&logoColor=white)
![Framework](https://img.shields.io/badge/Framework-SwiftUI-007AFF)
![Architecture](https://img.shields.io/badge/Architecture-MVVM-8A2BE2)

An educational and visually striking app dedicated to the history of the Apollo space program, built natively with SwiftUI.

Moonshot allows users to explore missions, learn about the astronauts who made them possible, and seamlessly dive into deep profiles. The app features custom scrolling layouts, dynamic data-driven routing, and a deeply modular architectural foundation.

## Preview

<img width="23%" alt="MissionGrid" src="https://github.com/user-attachments/assets/d6d4dd74-6c79-4209-b20f-c273298df7a3" />
<img width="23%" alt="MissionList" src="https://github.com/user-attachments/assets/d1db86b5-61ea-4169-9ed1-2f6b139768b4" />
<img width="23%" alt="MissionDetail" src="https://github.com/user-attachments/assets/65434a2b-b60b-4f57-8b86-a455166efab7" />
<img width="23%" alt="Astronaut" src="https://github.com/user-attachments/assets/019db857-ebef-4a9a-bdf5-94777711465e" />

## Features

* **Dynamic Layouts:** Seamlessly toggle the main screen between a rich visual grid and a compact list view via an accessible toolbar button.
* **Deep Navigation Flow:** Explore missions to see a horizontally scrolling roster of the crew, and tap on any crew member to view their detailed biographical profile.
* **Rich Visuals:** Custom dark-mode color themes, `containerRelativeFrame()` for precise UI scaling, and full-bleed image displays.
* **Hierarchical Decoding:** Fast and safe JSON parsing mapping two distinct data sets (Missions and Astronauts) into a unified relational graph.

## About the Project & Challenge

This application was originally built to fulfill **Project 8 (Days 39-42)** of the SwiftUI learning path by Paul Hudson (Hacking with Swift). The core educational goal was to master Generics, complex nested `Codable` protocols, and custom `ScrollView` layouts.

Beyond the core course requirements, the entire codebase was meticulously refactored into a commercial-grade **MVVM** architecture, completely decoupling the UI from data processing. Key concepts and best practices implemented include:

* **Modern Data-Driven Routing:** Eradicated memory-heavy eager `NavigationLink` closures. Implemented iOS 16+ `NavigationStack` with `NavigationLink(value:)` and `.navigationDestination(for:)`, guaranteeing that detail ViewModels and sub-views are lazily instantiated strictly upon a physical user tap.
* **MVVM & @Observable:** Migrated from a procedural data-loading approach to a modern Observation engine. `MoonshotMainViewModel` now acts as the single source of truth for the app's core JSON assets, enforcing state encapsulation with `private(set)`.
* **Dependency Injection (DI):** Instantiated the root ViewModel strictly at the `App` layer, passing it down through `let` constants. This enforces unidirectional data flow and cleanly separates state ownership from the UI layer.
* **Decoupled Domain Logic:** Created an isolated `MissionViewModel` to handle the complex relational mapping between `Mission` and `Astronaut` entities. This keeps `MissionView` completely stateless, strictly adhering to the Single Responsibility Principle.

🔗 **[Full project description here](https://www.hackingwithswift.com/100/swiftui/39)**

## Project Versioning & Changelog

* **v2.0.0 (Architecture Modernization)** — `commit: f9683ce`
  Complete rewrite into MVVM using iOS 17+ `@Observable` state engines with parent-level Dependency Injection (DI). Integrates high-performance lazy data-driven routing via centralized `.navigationDestination` modifiers.

* **v1.1.0 (Feature Expansion & Layout Tuning)** — `commit: 032ea69`
  Minor release completing the challenge phase. Implements a dynamic grid/list layout toggle subsystem driven by toolbar interactions and adds space program launch date presentations.

* **v1.0.0 (Functional MVP)** — `commit: 89110ab`
  Initial baseline release matching the core course curriculum. Establishes generic JSON decoding layers, implements relational data merging across assets, and sets up deep layout navigation.
