import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roya_task/providers/job_provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<JobProvider>(builder: (context, provider, _) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              provider.sortByAlpha();
            },
            child: Row(
              children: [
                Text(
                  "By Alpha",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const RotatedBox(
                    quarterTurns: 1, child: Icon(Icons.compare_arrows)),
                Text(
                  provider.isDescendingAlpha ? 'Descending' : "Ascending",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const Text(
            "||",
            style: TextStyle(fontSize: 30),
          ),
          TextButton(
            onPressed: () {
              provider.sortBySalary();
            },
            child: Row(
              children: [
                Text(
                  "By Salary",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const RotatedBox(
                    quarterTurns: 1, child: Icon(Icons.compare_arrows)),
                Text(
                  provider.isDescendingSalary ? 'Descending' : "Ascending",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
