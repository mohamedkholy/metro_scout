import 'package:flutter/material.dart';
import 'package:metro_scout/core/database/my_database.dart';
import 'package:metro_scout/core/widgets/my_text_form.dart';
import 'package:metro_scout/generated/l10n.dart';

class StationsAutocomplete extends StatelessWidget {
  final String title;
  final String hint;
  final List<Station> stations;
  final Function(Station) onSelected;
  final String? Function() validate;
  const StationsAutocomplete({super.key, required this.stations, required this.onSelected, required this.validate, required this.title, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Autocomplete(
      fieldViewBuilder: (
          context,
          textEditingController,
          focusNode,
          onFieldSubmitted,
          ) {
        return MyTextForm(
          validator: (val) {
            if (val?.isEmpty == true ||
                !stations.any(
                      (element) =>
                  element.stationName ==
                      textEditingController.text,
                )) {
              return S.of(context).enterValidStation;
            }
            return validate();
          },
          hint: hint,
          title: title,
          focusNode: focusNode,
          controller: textEditingController,
        );
      },
      displayStringForOption:
          (option) => option.stationName,
      onSelected: onSelected,
      optionsBuilder: (textEditingValue) {
        return stations.where(
              (element) => element.stationName.startsWith(
            textEditingValue.text,
          ),
        );
      },
    );
  }
}
