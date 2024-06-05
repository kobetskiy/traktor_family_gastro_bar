import 'package:flutter/material.dart';

class RatingWidget {
  const RatingWidget({
    required this.full,
    required this.half,
    required this.empty,
  });

  final Widget full;
  final Widget half;
  final Widget empty;
}

/// A widget to receive rating input from users.
///
/// [RatingBar] can also be used to display rating
///
/// Prefer using [RatingBarIndicator] instead, if read only version is required.
/// As RatingBarIndicator supports any fractional rating value.
class RatingBar extends StatefulWidget {
  /// Creates [RatingBar] using the [ratingWidget].
  const RatingBar({
    /// Customizes the Rating Bar item with [RatingWidget].
    required RatingWidget ratingWidget,
    required this.onRatingUpdate,
    this.unratedColor,
    this.allowHalfRating = false,
    this.ignoreGestures = false,
    this.initialRating = 0.0,
    this.itemCount = 5,
    this.itemPadding = EdgeInsets.zero,
    this.itemSize = 40.0,
    super.key,
  })  : _itemBuilder = null,
        _ratingWidget = ratingWidget;

  const RatingBar.builder({
    required IndexedWidgetBuilder itemBuilder,
    required this.onRatingUpdate,
    this.unratedColor,
    this.allowHalfRating = false,
    this.ignoreGestures = false,
    this.initialRating = 0.0,
    this.itemCount = 5,
    this.itemPadding = EdgeInsets.zero,
    this.itemSize = 40.0,
    super.key,
  })  : _itemBuilder = itemBuilder,
        _ratingWidget = null;

  /// Return current rating whenever rating is updated.
  ///
  /// [updateOnDrag] can be used to change the behaviour
  /// how the callback reports the update.
  final ValueChanged<double> onRatingUpdate;

  /// {@template flutterRatingBar.unratedColor}
  /// Defines color for the unrated portion.
  ///
  /// Default is [ThemeData.disabledColor].
  /// {@endtemplate}
  final Color? unratedColor;

  /// Default [allowHalfRating] = false.
  /// Setting true enables half rating support.
  final bool allowHalfRating;


  /// if set to true, will disable any gestures over the rating bar.
  ///
  /// Default is false.
  final bool ignoreGestures;

  /// Defines the initial rating to be set to the rating bar.
  final double initialRating;

  /// {@template flutterRatingBar.itemCount}
  /// Defines total number of rating bar items.
  ///
  /// Default is 5.
  /// {@endtemplate}
  final int itemCount;

  /// {@template flutterRatingBar.itemPadding}
  /// The amount of space by which to inset each rating item.
  /// {@endtemplate}
  final EdgeInsetsGeometry itemPadding;

  /// {@template flutterRatingBar.itemSize}
  /// Defines width and height of each rating item in the bar.
  ///
  /// Default is 40.0
  /// {@endtemplate}
  final double itemSize;

  /// How the item within the [RatingBar] should be placed in the main axis.
  ///
  /// For example, if [wrapAlignment] is [WrapAlignment.center], the item in
  /// the RatingBar are grouped together in the center of their run
  /// in the main axis.

  final IndexedWidgetBuilder? _itemBuilder;
  final RatingWidget? _ratingWidget;

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  double _rating = 0;
  double iconRating = 0;

  late final ValueNotifier<bool> _glow;

  @override
  void initState() {
    super.initState();
    _glow = ValueNotifier(false);
    _rating = widget.initialRating;
  }

  @override
  void didUpdateWidget(RatingBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialRating != widget.initialRating) {
      _rating = widget.initialRating;
    }
  }

  @override
  void dispose() {
    _glow.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    iconRating = 0.0;

    return Material(
      color: Colors.transparent,
      child: Wrap(
        textDirection: TextDirection.ltr,
        direction: Axis.horizontal,
        children: List.generate(
          widget.itemCount,
          (index) => _buildRating(context, index),
        ),
      ),
    );
  }

  Widget _buildRating(BuildContext context, int index) {
    final ratingWidget = widget._ratingWidget;
    final item = widget._itemBuilder?.call(context, index);
    final ratingOffset = widget.allowHalfRating ? 0.5 : 1.0;

    Widget resolvedRatingWidget;

    if (index >= _rating) {
      resolvedRatingWidget = _NoRatingWidget(
        size: widget.itemSize,
        enableMask: ratingWidget == null,
        unratedColor: widget.unratedColor ?? Theme.of(context).disabledColor,
        child: ratingWidget?.empty ?? item!,
      );
    } else if (index >= _rating - ratingOffset && widget.allowHalfRating) {
      if (ratingWidget?.half == null) {
        resolvedRatingWidget = _HalfRatingWidget(
          size: widget.itemSize,
          enableMask: ratingWidget == null,
          unratedColor: widget.unratedColor ?? Theme.of(context).disabledColor,
          child: item!,
        );
      } else {
        resolvedRatingWidget = SizedBox(
          width: widget.itemSize,
          height: widget.itemSize,
          child: FittedBox(
            child: ratingWidget!.half,
          ),
        );
      }
      iconRating += 0.5;
    } else {
      resolvedRatingWidget = SizedBox(
        width: widget.itemSize,
        height: widget.itemSize,
        child: FittedBox(
          child: ratingWidget?.full ?? item,
        ),
      );
      iconRating += 1.0;
    }

    return IgnorePointer(
      ignoring: widget.ignoreGestures,
      child: GestureDetector(
        onTapDown: (details) {
          double value;
          if (index == 0 && (_rating == 1 || _rating == 0.5)) {
            value = 0;
          } else {
            final tappedPosition = details.localPosition.dx;
            final tappedOnFirstHalf = tappedPosition <= widget.itemSize / 2;
            value = index +
                (tappedOnFirstHalf && widget.allowHalfRating ? 0.5 : 1.0);
          }

          widget.onRatingUpdate(value);
          _rating = value;
          setState(() {});
        },
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragEnd: _onDragEnd,
        onHorizontalDragUpdate: _onDragUpdate,
        child: Padding(
          padding: widget.itemPadding,
          child: ValueListenableBuilder<bool>(
            valueListenable: _glow,
            builder: (context, glow, child) {              
              return child!;
            },
            child: resolvedRatingWidget,
          ),
        ),
      ),
    );
  }

  void _onDragUpdate(DragUpdateDetails dragDetails) {
      final box = context.findRenderObject() as RenderBox?;
      if (box == null) return;

      final pos = box.globalToLocal(dragDetails.globalPosition);
      double i = pos.dx / (widget.itemSize + widget.itemPadding.horizontal);
      var currentRating = widget.allowHalfRating ? i : i.round().toDouble();
      if (currentRating > widget.itemCount) {
        currentRating = widget.itemCount.toDouble();
      }
      if (currentRating < 0) {
        currentRating = 0.0;
      }

      widget.onRatingUpdate(iconRating);
      setState(() {});
    }

  void _onDragStart(DragStartDetails details) {
    _glow.value = true;
  }

  void _onDragEnd(DragEndDetails details) {
    _glow.value = false;
    widget.onRatingUpdate(iconRating);
    iconRating = 0.0;
  }
}

class _HalfRatingWidget extends StatelessWidget {
  const _HalfRatingWidget({
    required this.size,
    required this.child,
    required this.enableMask,
    required this.unratedColor,
  });

  final Widget child;
  final double size;
  final bool enableMask;
  final Color unratedColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: enableMask
          ? Stack(
              fit: StackFit.expand,
              children: [
                FittedBox(
                  child: _NoRatingWidget(
                    size: size,
                    unratedColor: unratedColor,
                    enableMask: enableMask,
                    child: child,
                  ),
                ),
                FittedBox(
                  child: ClipRect(
                    clipper: _HalfClipper(),
                    child: child,
                  ),
                ),
              ],
            )
          : FittedBox(
              child: child,
            ),
    );
  }
}

class _HalfClipper extends CustomClipper<Rect> {
  _HalfClipper();

  @override
  Rect getClip(Size size) => Rect.fromLTRB(
          0,
          0,
          size.width / 2,
          size.height,
        );

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}

class _NoRatingWidget extends StatelessWidget {
  const _NoRatingWidget({
    required this.size,
    required this.child,
    required this.enableMask,
    required this.unratedColor,
  });

  final double size;
  final Widget child;
  final bool enableMask;
  final Color unratedColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: FittedBox(
        child: enableMask
            ? ColorFiltered(
                colorFilter: ColorFilter.mode(
                  unratedColor,
                  BlendMode.srcIn,
                ),
                child: child,
              )
            : child,
      ),
    );
  }
}
