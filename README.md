# Simple State Management

A lightweight and straightforward state management solution for Flutter applications, designed to manage and update UI state efficiently without the overhead of more complex state management tools.

## Features
- **SimpleState:** A class to manage a single piece of state with a stream-based approach.
- **SimpleBuilder:** A widget that rebuilds itself when the state changes, using the power of StreamBuilder.
- **Minimal API**: Easy to understand and integrate into any Flutter project.


## Installation 💻

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  simple_state: ^0.1.0+1
```

Then, run flutter pub get to install the package.

## Usage

### SimpleState

SimpleState is a class that holds a value and provides a stream for updates. It allows you to manage state and notify listeners about changes.

```dart
import 'package:simple_state/simple_state.dart';

final counterState = SimpleState(0);

void incrementCounter() {
  counterState.value += 1;
}
```

### SimpleBuilder

SimpleBuilder is a widget that rebuilds when the SimpleState value changes. It listens to the SimpleState stream and rebuilds the UI based on the current state value.

```dart
import 'package:flutter/widgets.dart';
import 'package:simple_state/simple_state.dart';

class CounterWidget extends StatelessWidget {
  final SimpleState<int> counterState;

  const CounterWidget({required this.counterState});

  @override
  Widget build(BuildContext context) {
    return SimpleBuilder<int>(
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
final counterState = SimpleState(10.0);

class MySimplePage extends StatelessWidget {
  const MySimplePage({super.key});

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
            SimpleBuilder(
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
                    builder: (_) => const MySimplePageSecond(),
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
class MySimplePage extends StatefulWidget {
  const MySimplePage({super.key});

  @override
  State<MySimplePage> createState() => _MySimplePageState();
}

class _MySimplePageState extends State<MySimplePage> {
  final counterState = SimpleState(10);

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
            SimpleBuilder(
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
                    builder: (_) => const MySimplePageSecond(),
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

This project is licensed under the [MIT License](https://github.com/EasyFlutterApps/simple_state/blob/main/LICENSE) - see the LICENSE file for details.