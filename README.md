# Pathly
A professional iOS application that visualizes educational progress through an interactive learning roadmap. The project showcases a hybrid approach, integrating **SwiftUI** for state-driven dashboards and **UIKit** for high-performance list management.

## App Preview

### Demo

<div align="leading">
<img src="https://github.com/user-attachments/assets/a5250aac-27d9-44a4-9b0e-c6877353f1a6" alt="gif" width="200">

</div>

### Screenshots

<div style="display: flex; justify-content: space-between;">
<img src="https://github.com/user-attachments/assets/cb758b5c-53e3-493d-8ac8-51ee0c85678d" width="200" alt="Dashboard">  
<img src="https://github.com/user-attachments/assets/57dd8bd2-270e-4b74-9183-26768d7e696e" width="200" alt="Achievement">
<img src="https://github.com/user-attachments/assets/addead6b-0368-40bf-9e22-ac05dcd8cd9c" width="200" alt="Learning Path">
</div>

## Features

* Dynamic Dashboard with streak and progress tracking
* Interactive Learning Path roadmap
* Robust Snapshot testing for visual regression
* Protocol-oriented architecture
* Dependency injection for service mocking

## Technical Stack

### Architecture & Design Patterns

* **MVVM (Model-View-ViewModel)** architecture
* **Hybrid UI:** SwiftUI (Dashboard) & UIKit (Learning Path)
* Protocol-oriented programming for service abstraction
* Dependency Injection (DI) for testability
* Wrapper pattern for SwiftUI/UIKit interoperability

### Technologies

* Swift
* SwiftUI
* UIKit (`UICollectionView`, `UIHostingController`)
* SnapshotTesting (Point-Free): Integrated via Swift Package Manager to enable visual regression testing and ensure UI stability across different device states.
* NSLayout / AutoLayout
* Combine

### Testing

* **SnapshotTesting** framework (Visual verification)
* Custom Mocking helpers for data generation

## Project Structure

```
Pathly/
├── App/
│   ├── PathlyApp.swift
│   └── SceneDelegate.swift
├── Models/
│   └── [PathStage, StageStatus, etc.]
├── Services/
│   ├── LearningServiceProtocol.swift
│   └── MockLearningService.swift
├── Utils/
│   ├── SnapshotTestingConfig/
│   └── [Extensions & Helpers]
├── Views/
│   ├── Dashboard/
│   │   └── DashboardView (SwiftUI)
│   └── LearningPath/
│       ├── LearningPathViewController (UIKit)
│       └── LearningPathViewControllerWrapper.swift
└── Tests/
    ├── SnapshotTests/
    │   ├── DashboardViewSnapshotTests.swift
    │   └── LearningPathViewControllerSnapshotTests.swift
    └── Mocks/
        └── extension/PathStage+MockHelper.swift
```

## Implementation Details

### Hybrid UI Approach

* **SwiftUI Dashboard:** Leverages modern declarative syntax for rapid UI iteration and reactive state updates.
* **UIKit Learning Path:** Demonstrates mastery of `UICollectionView`. UIKit was specifically chosen for this scene to provide granular control over complex cell layouts and scroll performance.

### Testing Strategy

* **Snapshot Testing:** High-precision visual regression tests ensure that UI remains consistent across different data states and themes (Light/Dark).
* **Mocking System:** A custom DSL-style mock helper allows for creating complex test scenarios (e.g., `mockStages(count: 10, currentStageIndex: 3)`) with minimal code.

### Protocol-Oriented Service Layer

* Networking was outside the current task scope; however, the architecture is **"API-Ready."** - By using `LearningServiceProtocol`, the app can switch from `MockLearningService` to a live `NetworkLearningService` by changing a single line in the DI container.

### Error & State Handling

* Includes empty state handling for zero-progress scenarios.
* Designed with high-precision pixel matching to ensure accessibility elements and labels are correctly positioned.

## **Building and Running the Application**  

1. **Clone the repository:**  
   ```bash
   git clone https://github.com/yeniObabatunde/Pathly.git
      cd your-project-folder
   ```  

2. **Open the project in Xcode:**  
   ```bash
   open Pathly.xcodeproj
   ```  

3. **Run the application:**  
   - Ensure you have **Xcode 14 or later** installed.  
   - Select a **simulator or physical device**, then press `Cmd + R`. 

## Testing

To run the test suite:

* Use shortcut `⌘U` to run all tests.
* **Note:** If you modify the UI, you must toggle `SnapshotTestingConfig.isRecording = true` to update reference images.

## Requirements

* iOS 17.0+
* Xcode 15.0+
* Swift 5.9+

## Author

Sharon Omoyeni Babatunde
