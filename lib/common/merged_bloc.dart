import 'package:flutter/cupertino.dart';
import 'package:flutter_app/common/BaseBloc.dart';

Type _typeOf<T extends BaseBloc>() => T;

class InheritedBlocProvider<T extends BaseBloc> extends InheritedWidget {
  final T value;

  bool Function(T previous, T current) _updateShouldNotify;

  InheritedBlocProvider(
      {Key key,
      Widget child,
      this.value,
      bool Function(T previous, T current) updateShouldNotify})
      : _updateShouldNotify = updateShouldNotify,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedBlocProvider oldWidget) {
    if (_updateShouldNotify != null) {
      return _updateShouldNotify(oldWidget.value, value);
    }
    return oldWidget.value != value;
  }

  static T of<T extends BaseBloc>(BuildContext context, {bool listen = true}) {
    final type = _typeOf<T>();
    final InheritedBlocProvider<T> provider = listen
        ? context.inheritFromWidgetOfExactType(type)
        : context.ancestorInheritedElementForWidgetOfExactType(type)?.widget;
    return provider?.value;
  }
}

class MergedBlocProvider<T extends BaseBloc> extends StatefulWidget {
  final T Function(BuildContext context, T previous) valueBuilder;
  final T Function(BuildContext context, T value) didChangeDependencies;
  final void Function(BuildContext context, T value) onDispose;
  final Widget child;
  final bool Function(T previous, T current) updateShouldNotify;

  MergedBlocProvider({Key key, this.valueBuilder, this.didChangeDependencies,
    this.onDispose, this.child, this.updateShouldNotify})
      : super(key: key);

  @override
  _MergedBlocProviderState<T> createState() => _MergedBlocProviderState();
}

class _MergedBlocProviderState<T extends BaseBloc> extends State<MergedBlocProvider<T>> {
  T _value;
  @override
  void initState() {
    super.initState();
    _buildValue();
  }

  @override
  void didUpdateWidget(MergedBlocProvider<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _buildValue();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.didChangeDependencies != null) {
      _value = widget.didChangeDependencies(context, _value);
    }
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose(context, _value);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedBlocProvider(
      value: _value,
      updateShouldNotify: widget.updateShouldNotify,
      child: widget.child,
    );
  }

  void _buildValue() {
    if (widget.valueBuilder != null) {
      _value = widget.valueBuilder(context, _value);
    }
  }

}
