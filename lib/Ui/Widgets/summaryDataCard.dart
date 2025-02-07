import 'package:flutter/material.dart';
import 'package:task_manager/Ui/Widgets/summary_card.dart';
import 'package:task_manager/data/models/summary_card_model.dart';

class SummaryDataCard extends StatelessWidget {
  final List<SummaryData> data;
  const SummaryDataCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SummaryCard(
            number: _getCountByStatus('New'),
            title: 'New Task',
          ),
        ),
        Expanded(
          child: SummaryCard(
            number: _getCountByStatus('Completed'),
            title: 'Completed',
          ),
        ),
        Expanded(
          child: SummaryCard(
            number: _getCountByStatus('Cancelled'),
            title: 'Cancelled',
          ),
        ),
      ],
    );
  }

  int _getCountByStatus(String status) {
    return data
            .firstWhere(
              (element) => element.sId == status,
              orElse: () => SummaryData(sum: 0),
            )
            .sum ??
        0;
  }
}
