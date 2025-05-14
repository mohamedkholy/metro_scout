import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metro_scout/core/database/my_database.dart';
import 'package:metro_scout/core/models/station_data.dart';
import 'package:metro_scout/core/theming/my_text_styles.dart';
import 'package:metro_scout/core/widgets/my_text_form.dart';
import 'package:metro_scout/generated/l10n.dart';

class StationsAutocomplete extends StatelessWidget {
  final String title;
  final String hint;
  final List<StationData> stations;
  final Function(StationData) onSelected;
  final String? Function() validate;

  const StationsAutocomplete({
    super.key,
    required this.stations,
    required this.onSelected,
    required this.validate,
    required this.title,
    required this.hint,
  });

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
                  (element) => element.name == textEditingController.text,
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
      displayStringForOption: (option) => option.name,
      onSelected: onSelected,
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: AlignmentDirectional.topStart,
          child: Material(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.dg)),
            color: Colors.white,
            elevation: 5,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200.h,maxWidth: 1.sw-30.w),
              child: ListView.builder(
                padding: EdgeInsets.all(5.dg),
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      onSelected(options.elementAt(index));
                    },
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.dg),
                        child: Text(options.elementAt(index).name,style: MyTextStyles.font14PrimarySemiBold,)),
                  );
                },
              ),
            ),
          ),
        );
      },
      optionsBuilder: (textEditingValue) {
        return stations.where(
          (element) => element.name.toLowerCase().startsWith(
            textEditingValue.text.toLowerCase(),
          ),
        );
      },
    );
  }
}
