import 'package:flutter/material.dart';

enum ShimmerBrightness { light, dark }

class Shimmer extends StatefulWidget {
  const Shimmer({super.key, this.child});

  final Widget? child;

  static ShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerState>();
  }

  static const LinearGradient lightGradient = LinearGradient(
    colors: [Color(0xFFE0E0E0), Color(0xFFF0F0F0), Color(0xFFE0E0E0)],
    stops: [0.1, 0.3, 0.4],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [Color(0xFF2E2E2E), Color(0xFF3B3B3B), Color(0xFF2E2E2E)],
    stops: [0.1, 0.3, 0.4],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );
  
  @override
  ShimmerState createState() => ShimmerState();
}

class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  LinearGradient get gradient {
    switch (Theme.of(context).brightness) {
      case Brightness.light:
        return Shimmer.lightGradient;
      case Brightness.dark:
      default:
        return Shimmer.darkGradient;
    }
  }

  bool get isSized =>
      (context.findRenderObject() as RenderBox?)?.hasSize ?? false;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox?;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  Listenable get shimmerChanges => _shimmerController;

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  Listenable? _shimmerChanges;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_shimmerChanges != null) {
      _shimmerChanges!.removeListener(_onShimmerChange);
    }
    _shimmerChanges = Shimmer.of(context)?.shimmerChanges;
    if (_shimmerChanges != null) {
      _shimmerChanges!.addListener(_onShimmerChange);
    }
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() {
    if (widget.isLoading) {
      setState(() {
        // Update the shimmer painting.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    // Collect ancestor shimmer info.
    final shimmer = Shimmer.of(context)!;
    if (!shimmer.isSized) {
      // The ancestor Shimmer widget has not laid
      // itself out yet. Return an empty box.
      return const SizedBox();
    }
    final shimmerSize = shimmer.size;
    final gradient = shimmer.gradient;
    final offsetWithinShimmer = shimmer.getDescendantOffset(
      descendant: context.findRenderObject() as RenderBox,
    );

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinShimmer.dx,
            -offsetWithinShimmer.dy,
            shimmerSize.width,
            shimmerSize.height,
          ),
        );
      },
      child: widget.child,
    );
  }
}





// import 'package:flutter/material.dart';

// enum ShimmerBrightness { light, dark }

// class Shimmer extends StatefulWidget {
//   const Shimmer({
//     super.key,
//     this.shimmerBrightness = ShimmerBrightness.dark,
//     this.child,
//   });

//   final ShimmerBrightness shimmerBrightness;
//   final Widget? child;

//   static ShimmerState? of(BuildContext context) {
//     return context.findAncestorStateOfType<ShimmerState>();
//   }

//   @override
//   ShimmerState createState() => ShimmerState();
// }

// class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
//   late AnimationController _shimmerController;

//   @override
//   void initState() {
//     super.initState();
//     _shimmerController = AnimationController.unbounded(vsync: this)
//       ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
//   }

//   @override
//   void dispose() {
//     _shimmerController.dispose();
//     super.dispose();
//   }

//   final LinearGradient basicLinearGradient = LinearGradient(
//     // colors: [Color(0xFFD1D1D1), Color(0xFFC4C4C4), Color(0xFFD1D1D1)],
//     colors: widget.shimmerBrightness == ShimmerBrightness.dark
//         ? [Color(0xFF2E2E2E), Color(0xFF3B3B3B), Color(0xFF2E2E2E)]
//         : [Color(0xFFD1D1D1), Color(0xFFC4C4C4), Color(0xFFD1D1D1)],
//     stops: [0.1, 0.3, 0.4],
//     begin: Alignment(-1.0, -0.3),
//     end: Alignment(1.0, 0.3),
//     tileMode: TileMode.clamp,
//   );

//   LinearGradient get gradient => LinearGradient(
//         colors: basicLinearGradient.colors,
//         stops: basicLinearGradient.stops,
//         begin: basicLinearGradient.begin,
//         end: basicLinearGradient.end,
//         transform:
//             _SlidingGradientTransform(slidePercent: _shimmerController.value),
//       );

//   bool get isSized =>
//       (context.findRenderObject() as RenderBox?)?.hasSize ?? false;

//   Size get size => (context.findRenderObject() as RenderBox).size;

//   Offset getDescendantOffset({
//     required RenderBox descendant,
//     Offset offset = Offset.zero,
//   }) {
//     final shimmerBox = context.findRenderObject() as RenderBox?;
//     return descendant.localToGlobal(offset, ancestor: shimmerBox);
//   }

//   Listenable get shimmerChanges => _shimmerController;

//   @override
//   Widget build(BuildContext context) {
//     return widget.child ?? const SizedBox();
//   }
// }

// class _SlidingGradientTransform extends GradientTransform {
//   const _SlidingGradientTransform({
//     required this.slidePercent,
//   });

//   final double slidePercent;

//   @override
//   Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
//     return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
//   }
// }

// class ShimmerLoading extends StatefulWidget {
//   const ShimmerLoading({
//     super.key,
//     required this.isLoading,
//     required this.child,
//   });

//   final bool isLoading;
//   final Widget child;

//   @override
//   State<ShimmerLoading> createState() => _ShimmerLoadingState();
// }

// class _ShimmerLoadingState extends State<ShimmerLoading> {
//   Listenable? _shimmerChanges;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (_shimmerChanges != null) {
//       _shimmerChanges!.removeListener(_onShimmerChange);
//     }
//     _shimmerChanges = Shimmer.of(context)?.shimmerChanges;
//     if (_shimmerChanges != null) {
//       _shimmerChanges!.addListener(_onShimmerChange);
//     }
//   }

//   @override
//   void dispose() {
//     _shimmerChanges?.removeListener(_onShimmerChange);
//     super.dispose();
//   }

//   void _onShimmerChange() {
//     if (widget.isLoading) {
//       setState(() {
//         // Update the shimmer painting.
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!widget.isLoading) {
//       return widget.child;
//     }

//     // Collect ancestor shimmer info.
//     final shimmer = Shimmer.of(context)!;
//     if (!shimmer.isSized) {
//       // The ancestor Shimmer widget has not laid
//       // itself out yet. Return an empty box.
//       return const SizedBox();
//     }
//     final shimmerSize = shimmer.size;
//     final gradient = shimmer.gradient;
//     final offsetWithinShimmer = shimmer.getDescendantOffset(
//       descendant: context.findRenderObject() as RenderBox,
//     );

//     return ShaderMask(
//       blendMode: BlendMode.srcATop,
//       shaderCallback: (bounds) {
//         return gradient.createShader(
//           Rect.fromLTWH(
//             -offsetWithinShimmer.dx,
//             -offsetWithinShimmer.dy,
//             shimmerSize.width,
//             shimmerSize.height,
//           ),
//         );
//       },
//       child: widget.child,
//     );
//   }
// }
