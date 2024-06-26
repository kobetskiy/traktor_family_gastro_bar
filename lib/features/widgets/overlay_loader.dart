import 'package:flutter/material.dart';

mixin OverlayLoader<T extends StatefulWidget> on State<T> {
  final ValueNotifier<bool> _blocked = ValueNotifier<bool>(false);

  bool get blocked => _blocked.value;

  Future<void> stopLoading() async {
    _blocked.value = false;
    await Future.delayed(const Duration(milliseconds: 300), () {
      entry?.remove();
      entry = null;
    });
  }

  void startLoading() {
    entry = OverlayEntry(
      builder: (context) {
        return ValueListenableBuilder<bool>(
          valueListenable: _blocked,
          builder: (context, value, child) {
            return AnimatedOpacity(
              opacity: value ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutQuad,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: ColoredBox(
                  color: const Color(0xB8000000),
                  child: Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(30),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 53, 53, 53),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const CircularProgressIndicator.adaptive(),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
    Overlay.of(context).insert(entry!);
    WidgetsBinding.instance.addPostFrameCallback((_) => _blocked.value = true);
  }

  OverlayEntry? entry;
}
