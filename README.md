# Eazy State Management

A lightweight and straightforward state management solution for Flutter applications, designed to manage and update UI state efficiently without the overhead of more complex state management tools.

## Features
- **EazyState:** A class to manage a single piece of state with a stream-based approach.
- **EazyBuilder:** A widget that rebuilds itself when the state changes, using the power of StreamBuilder.
- **Minimal API**: Easy to understand and integrate into any Flutter project.


## Installation 💻

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  eazy_state: ^0.1.1
```

Then, run flutter pub get to install the package.

## Usage

### EazyState

EazyState is a class that holds a value and provides a stream for updates. It allows you to manage state and notify listeners about changes.

```dart
import 'package:eazy_state/eazy_state.dart';

final counterState = EazyState(0);

void incrementCounter() {
  counterState.value += 1;
}
```

### EazyBuilder

EazyBuilder is a widget that rebuilds when the EazyState value changes. It listens to the EazyState stream and rebuilds the UI based on the current state value.

```dart
import 'package:flutter/widgets.dart';
import 'package:eazy_state/eazy_state.dart';

class CounterWidget extends StatelessWidget {
  final EazyState<int> counterState;

  const CounterWidget({required this.counterState});

  @override
  Widget build(BuildContext context) {
    return EazyBuilder<int>(
      state: counterState,
      builder: (context, count) {
        return Text('$count');
      },
    );
  }
}
```

## Examples

### Example 1: Using Same State in Multiple Places

```dart
final counterState = EazyState(10.0);

class MyEazyPage extends StatelessWidget {
  const MyEazyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Flutter Demo Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            EazyBuilder(
              state: counterState,
              builder: (context, count) {
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MyEazyPageSecond(),
                  ),
                );
              },
              child: const Text("Move"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterState.value += 1,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

### Example 2: Using State in Single Screen

```dart
class MyEazyPage extends StatefulWidget {
  const MyEazyPage({super.key});

  @override
  State<MyEazyPage> createState() => _MyEazyPageState();
}

class _MyEazyPageState extends State<MyEazyPage> {
  final counterState = EazyState(10);

  @override
  void dispose() {
    counterState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            EazyBuilder(
              state: counterState,
              builder: (context, count) {
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MyEazyPageSecond(),
                  ),
                );
              },
              child: const Text('Move'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterState.value += 1,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```


## Contributing

Feel free to open issues or submit pull requests on GitHub.

## License

This project is licensed under the [MIT License](https://github.com/EasyFlutterApps/eazy_state/blob/main/LICENSE) - see the LICENSE file for details.