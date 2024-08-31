import 'package:eazy_state/src/eazy_state.dart';
import 'package:flutter/widgets.dart';

/// A widget that rebuilds when the state value changes.
///
/// The [EazyBuilder] widget listens to changes in a [EazyState] and rebuilds
/// itself whenever the state value updates. It uses a [StreamBuilder] to listen
/// to the state stream and trigger rebuilds with the latest state value.
class EazyBuilder<T> extends StatelessWidget {
  /// Creates a [EazyBuilder] with the given [state] and [builder] function.
  ///
  /// The [state] parameter is the instance of [EazyState] that this widget
  /// will listen to for state changes. The [builder] function is used to build
  /// the widget tree based on the current state value.
  const EazyBuilder({
    required this.state,
    required this.builder,
    super.key,
  });

  /// The [EazyState] instance that this widget listens to.
  ///
  /// The [EazyBuilder] uses this [state] to listen for updates and rebuild
  /// the widget tree when the state changes.
  final EazyState<T> state;

  /// The function that builds the widget tree based on the state value.
  ///
  /// The [builder] function is called with the current [BuildContext] and
  /// the latest state value. It returns the widget tree that should be displayed.
  final Widget Function(BuildContext, T) builder;

  @override
  Widget build(BuildContext context) {
    /// Use a [StreamBuilder] to listen to state changes and rebuild the widget.
    return StreamBuilder<T>(
      stream: state.stream,
      initialData: state.value,
      builder: (context, snapshot) {
        /// Call the builder function with the latest state value.
        return builder(context, snapshot.data as T);
      },
    );
  }
}
