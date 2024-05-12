import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors_constants.dart';
import 'package:traktor_family_gastro_bar/core/ui/font_constants.dart';
import 'package:traktor_family_gastro_bar/features/meals_list/bloc/meals_list_bloc.dart';
import 'package:traktor_family_gastro_bar/generated/l10n.dart';

class SearchTextFieldWidget extends StatefulWidget {
  const SearchTextFieldWidget({
    super.key,
    required this.controller,
    required this.bloc,
  });

  final TextEditingController controller;
  final MealsListBloc bloc;

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: widget.controller,
        autofocus: true,
        onChanged: (query) =>
            widget.bloc.add(LoadSearchedMealsList(query: query)),
        style: AppTextStyles.titleSmall,
        decoration: InputDecoration(
          hintText: S.of(context).search,
          hintStyle: AppTextStyles.titleSmall
              .copyWith(color: AppColors.subtitleColor),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.titleColor),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              widget.controller.clear();
              widget.bloc
                  .add(LoadSearchedMealsList(query: widget.controller.text));
            },
            icon: const Icon(Icons.clear_rounded),
            color: AppColors.subtitleColor,
          ),
        ),
      ),
    );
  }
}
