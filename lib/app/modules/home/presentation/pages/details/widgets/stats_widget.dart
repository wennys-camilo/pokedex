import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../../../shared/ui/themes/app_colors.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget(
      {Key? key,
      required this.typeStat,
      required this.valueStat,
      this.colorText})
      : super(key: key);
  final String typeStat;
  final int valueStat;
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5),
              child: Text(
                typeStat,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: colorText),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: VerticalDivider(
              color: AppColors.grey.withOpacity(0.4),
              thickness: 1,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 5),
              child: Text(valueStat.toString(),
                  style: TextStyle(color: colorText)),
            ),
          ),
          Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: LinearPercentIndicator(
                width: 200.0,
                lineHeight: 8.0,
                percent: valueStat > 200 ? valueStat / 250 : valueStat / 200,
                animation: true,
                progressColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
