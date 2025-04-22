import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metro_scout/features/nearest_station/logic/nearest_station_cubit.dart';

import '../../../../core/theming/my_colors.dart';
import '../../../../generated/l10n.dart';

class LocationToggleButtons extends StatefulWidget {
  const LocationToggleButtons({super.key});

  @override
  State<LocationToggleButtons> createState() => _LocationToggleButtonsState();
}

class _LocationToggleButtonsState extends State<LocationToggleButtons> {
  List<bool> togglesData = [true, false];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ToggleButtons(
          borderRadius: BorderRadius.circular(5),
          borderColor: MyColors.primaryColor,
          selectedColor: Colors.white,
          selectedBorderColor: MyColors.primaryColor,
          fillColor: MyColors.primaryColor,
          onPressed: (index) {
            setState(() {
              togglesData = index == 0 ? [true, false] : [false, true];
              context.read<NearestStationCubit>().toggleLocationOptionsButtons(
                index,
              );
            });
          },
          isSelected: togglesData,
          children: [
            Container(
              width: (constraints.maxWidth - 30) / 2,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(S.of(context).local, textAlign: TextAlign.center),
            ),
            Container(
              width: (constraints.maxWidth - 30) / 2,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(S.of(context).address, textAlign: TextAlign.center),
            ),
          ],
        );
      },
    );
  }
}
