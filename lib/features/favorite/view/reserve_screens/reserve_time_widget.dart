import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/features/data/services/text_field_validator.dart';
import 'package:traktor_family_gastro_bar/features/favorite/widgets/custom_dropdown.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class ReserveTimeWidget extends StatelessWidget {
  const ReserveTimeWidget({
    super.key,
    required this.formKey,
    required this.dateController,
    required this.timeController,
    required this.guestsNumberController,
    required this.durationController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController dateController;
  final TextEditingController timeController;
  final TextEditingController guestsNumberController;
  final TextEditingController durationController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              _DateTextField(dateController),
              const SizedBox(height: 15),
              _TimeTextField(timeController),
              const SizedBox(height: 15),
              _NumberOfGuestsTextField(guestsNumberController),
              const SizedBox(height: 15),
              _DurationTextField(durationController),
              const SizedBox(height: 15),
              Text(
                S.of(context).weWillConfirmYourBookingAsSoonAsPossible,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DurationTextField extends StatelessWidget {
  const _DurationTextField(this.durationController);

  final TextEditingController durationController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).duration,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        CustomDropdown(
          controller: durationController,
          errorMessage: S.of(context).selectADuration,
          hintText: S.of(context).moreThan4Hours,
          items: [
            S.of(context).OneHour,
            S.of(context).nHours(2),
            S.of(context).nHours(3),
            S.of(context).nHours(4),
            S.of(context).moreThan4Hours
          ],
          onChanged: (value) => durationController.text = value!,
        ),
      ],
    );
  }
}

class _NumberOfGuestsTextField extends StatelessWidget {
  const _NumberOfGuestsTextField(this.guestsNumberController);

  final TextEditingController guestsNumberController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).numberOfGuests,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        CustomDropdown(
          controller: guestsNumberController,
          errorMessage: S.of(context).selectNumberOfGuest,
          hintText: S.of(context).moreThan5,
          items: ['1', '2', '3', '4', '5', S.of(context).moreThan5],
          onChanged: (value) => guestsNumberController.text = value!,
        ),
      ],
    );
  }
}

class _TimeTextField extends StatefulWidget {
  const _TimeTextField(this.timeController);

  final TextEditingController timeController;

  @override
  State<_TimeTextField> createState() => _TimeTextFieldState();
}

class _TimeTextFieldState extends State<_TimeTextField> {
  List<String> timeSlots = [];

  @override
  void initState() {
    super.initState();
    generateTimeSlots();
  }

  void generateTimeSlots() {
    final startTime = DateTime(0, 0, 0, 11, 0);
    final endTime = DateTime(0, 0, 0, 21, 0);
    const interval = Duration(minutes: 15);

    List<String> result = [];
    DateTime currentTime = startTime;

    while (currentTime.isBefore(endTime) || currentTime == endTime) {
      result.add(
        '${currentTime.hour.toString().padLeft(2, '0')}:${currentTime.minute.toString().padLeft(2, '0')}',
      );
      currentTime = currentTime.add(interval);
    }

    timeSlots = result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).time,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        CustomDropdown(
          controller: widget.timeController,
          errorMessage: S.of(context).selectATime,
          hintText: '18:00',
          items: timeSlots,
          onChanged: (value) => widget.timeController.text = value!,
        ),
      ],
    );
  }
}

class _DateTextField extends StatelessWidget {
  const _DateTextField(this.dateController);

  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).date,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        _CustomDatePicker(controller: dateController),
      ],
    );
  }
}

class _CustomDatePicker extends StatefulWidget {
  const _CustomDatePicker({required this.controller});

  final TextEditingController controller;

  @override
  State<_CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<_CustomDatePicker> {
  final currentTime = DateTime.now();

  Future<void> pickDate() async {
    final time = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      firstDate: currentTime,
      lastDate: DateTime(currentTime.year, currentTime.month + 2),
    );

    if (time == null) {
      widget.controller.text = '';
    } else {
      widget.controller.text = time.toString().split(" ")[0];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: true,
      validator: (value) => TextFieldValidator.validateNotNull(
        value,
        S.of(context).selectADate,
      ),
      onTap: () async => await pickDate(),
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        hintText: '2024-10-4',
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Icon(
            Icons.calendar_month_rounded,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white60
                : Colors.black54,
          ),
        ),
      ),
    );
  }
}
