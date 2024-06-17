# MuseumGuide - VisionOS Project

Welcome to the MuseumGuide VisionOS project! This project is an interactive museum guide application built for VisionOS, leveraging SwiftUI, RealityKit, and RealityKitContent to create immersive experiences. 

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Requirements](#requirements)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [VoiceOver Compatibility](#voiceover-compatibility)
- [Contributing](#contributing)
- [License](#license)

## Overview

The MuseumGuide app provides users with an interactive way to explore museum collections through detailed item views, immersive experiences, and more. It aims to enhance the museum-going experience by offering rich information and engaging 3D models of artifacts.

## Features

- **Detailed Collection Views**: Explore detailed information about each collection item.
- **Immersive Experiences**: Use RealityKit to create immersive scenes that users can interact with.
- **Interactive UI**: User-friendly interface with SwiftUI components.
- **3D Models**: Integration of 3D models to provide a richer understanding of the artifacts.

## Requirements

- Xcode 14.0 or later
- iOS 15.0 / VisionOS 1.0 or later
- Swift 5.0 or later

## Usage

1. **Build and Run**:
    Select your target device (VisionOS simulator or a physical device), and press `Cmd + R` to build and run the project.

2. **Explore the App**:
    - **Welcome Screen**: Start from the welcome screen, providing a brief overview and navigation options.
    - **Collections View**: Navigate through different collection items.
    - **Detail View**: Select an item to view detailed information and 3D models.
    - **Immersive View**: Enter immersive experiences to interact with 3D content.

## Project Structure

- **AppModel.swift**: Manages the application's state and data.
- **CollectionItem.swift**: Defines the model for a collection item.
- **CollectionItemView.swift**: Displays a collection item in a list or grid.
- **CollectionDetailView.swift**: Shows detailed information about a selected collection item.
- **CollectionsView.swift**: Displays a grid of collection items.
- **CollectionVolumeView.swift**: Provides an immersive view of a collection item.
- **ImmersiveToggle.swift**: Toggles immersive mode on and off.
- **ImmersiveView.swift**: Handles the immersive experience using RealityKit.
- **LearnMoreView.swift**: Displays additional information about a collection item.
- **MuseumGuideApp.swift**: Entry point for the application, setting up the main scenes.
- **WelcomeView.swift**: Initial view welcoming users to the app.

## VoiceOver Compatibility

To ensure the app is accessible to all users, including those who rely on VoiceOver, the following accessibility features have been added:

- **Accessibility Labels**: Custom labels are provided to describe the content of each view and element.
- **Accessibility Hints**: Additional hints are provided to help users understand the actions they can take.
- **Combined Elements**: Related elements are grouped together to be read as a single item.
- **Accessible Gestures**: Gestures are optimized to ensure they are recognized correctly by VoiceOver.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes. Ensure your code follows the project's coding standards and includes appropriate documentation.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
