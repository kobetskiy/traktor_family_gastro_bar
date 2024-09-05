import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({
    super.key,
    required this.steps,
    required this.content,
    required this.pageController,
    required this.currentStep,
  });

  final List<CustomStep> steps;
  final List<Widget> content;
  final PageController pageController;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StepIndicators(steps: steps, currentStep: currentStep),
        Expanded(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: content,
          ),
        ),
      ],
    );
  }
}

class StepIndicators extends StatelessWidget {
  const StepIndicators({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  final List<CustomStep> steps;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          steps.length,
          (index) => CustomStep(
            icon: steps[index].icon,
            text: steps[index].text,
            isActive: index == currentStep,
          ),
        ),
      ),
    );
  }
}

class CustomStep extends StatelessWidget {
  const CustomStep({
    super.key,
    required this.icon,
    required this.text,
    this.isActive = false,
  });

  final IconData icon;
  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: isActive ? Theme.of(context).colorScheme.primary : Colors.grey,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: isActive
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
              ),
        ),
      ],
    );
  }
}
