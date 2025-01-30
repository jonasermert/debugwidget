# DebugWidget

A simple debug widget for Flutter that draws visual outlines around widgets to better understand the widget hierarchy.

## Features
- Draws outlines around the given widget and its children.
- Allows customization of the outline color.
- Helps with visual debugging in Flutter applications.

## Installation
Add the file containing `DebugWidget` to your project or create a custom helper class based on this code.

## Usage

```dart
import 'package:flutter/material.dart';
import 'debug_widget.dart';

void main() {
  runApp(
    DebugWidget(
      color: Colors.blue, // Optional: Default is red
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("DebugWidget Example")),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DebugWidget(
                  child: Text("Hello World!"),
                ),
                SizedBox(height: 20),
                DebugWidget(
                  color: Colors.green,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Press me!"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
```

## Parameters

| Parameter | Type | Default Value | Description |
|-----------|------|--------------|-------------|
| `child`  | `Widget` | - | The widget to debug. |
| `color`  | `Color` | `Colors.red` | The color of the outline. |

## Benefits
- Useful for inspecting widget hierarchy.
- Supports different colors for better distinction.
- Does not affect the app's functionality.

## License
This widget is free to use and modify. Happy debugging! 🚀

