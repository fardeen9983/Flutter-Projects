# Flutter-Projects

Tips
1. To enable Flutter's visual tools on the installed app for showing bounderies, paddings, margins, etc use
    ```dart
    debugPaintSizeEnabled = true
    debugPaintBaselinesEnabled = true
    debugPaintPointersEnabled = true
    ```
    Both these properties are avaiable in **package : flutter/rendering.dart**
2. To display the material grid in the UI set true to a property in the MaterialApp widget
    ```dart
    MaterialApp(
        debugShowMaterialGrid : true      
    )
    ```