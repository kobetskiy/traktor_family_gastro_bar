import 'package:flutter/material.dart';

class GroupButton extends StatefulWidget {
  final bool isRadio;
  final Function(int index, bool isSelected) onSelected;
  final List<String> buttons;

  const GroupButton({
    super.key,
    required this.isRadio,
    required this.onSelected,
    required this.buttons,
  });

  @override
  State<GroupButton> createState() => _GroupButtonState();
}

class _GroupButtonState extends State<GroupButton> {
  List<bool> _selectedStates = [];

  @override
  void initState() {
    super.initState();
    _selectedStates = List<bool>.filled(widget.buttons.length, false);
  }

  void _handleButtonTap(int index) {
    if (widget.isRadio) {
      for (int i = 0; i < _selectedStates.length; i++) {
        _selectedStates[i] = i == index;
      }
    } else {
      _selectedStates[index] = !_selectedStates[index];
    }
    setState(() {});

    widget.onSelected(index, _selectedStates[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 25,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: List.generate(widget.buttons.length, (index) {
        return ChoiceChip(
          label: SizedBox(
            width: 35,
            height: 20,
            child: Center(
              child: Text(widget.buttons[index]),
            ),
          ),
          selected: _selectedStates[index],
          showCheckmark: false,
          onSelected: (isSelected) => _handleButtonTap(index),
          selectedColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.surface,
          labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: _selectedStates[index] ? Colors.black : Colors.white,
              ),
        );
      }),
    );
  }
}
