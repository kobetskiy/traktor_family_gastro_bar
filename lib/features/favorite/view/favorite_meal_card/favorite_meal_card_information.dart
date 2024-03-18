import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class MealCardTitle extends StatelessWidget {
  const MealCardTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.bodyMedium);
  }
}

class MealCardCost extends StatelessWidget {
  const MealCardCost({super.key, required this.cost});

  final String cost;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$cost ${S.of(context).uah}',
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: AppColors.primaryColor),
    );
  }
}

class MealCardCount extends StatefulWidget {
  const MealCardCount({super.key});

  @override
  State<MealCardCount> createState() => _MealCardCountState();
}

class _MealCardCountState extends State<MealCardCount> {
  int count = 1;

  void decrement() {
    count--;
    setState(() {});
  }

  void increment() {
    count++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _RemoveOrAddButton(onTap: decrement, buttonType: Button.remove),
        const SizedBox(width: 20),
        Text(count.toString()),
        const SizedBox(width: 20),
        _RemoveOrAddButton(onTap: increment, buttonType: Button.add),
      ],
    );
  }
}

enum Button { add, remove }

class _RemoveOrAddButton extends StatelessWidget {
  const _RemoveOrAddButton({required this.onTap, required this.buttonType});

  final void Function()? onTap;
  final Button buttonType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.titleColor),
            borderRadius: const BorderRadius.all(Radius.circular(6))),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Icon(buttonType == Button.add ? Icons.add : Icons.remove),
        ),
      ),
    );
  }
}
