import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roya_task/providers/job_provider.dart';
import 'package:roya_task/widgets/home_header.dart';
import 'package:roya_task/widgets/job_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<JobProvider>(context, listen: false).allJobs();
    });
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jobs List",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              child: Consumer<JobProvider>(builder: (context, provider, _) {
                return IconButton(
                  onPressed: () {
                    provider.showHideFilters();
                  },
                  icon: const Icon(
                    Icons.sort_rounded,
                    color: Colors.black,
                  ),
                );
              }))
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<JobProvider>(builder: (context, provider, _) {
            return Visibility(
              visible: provider.filtersVisibility,
              child: Container(
                color: Colors.amber.shade300,
                child: const HomeHeader(),
              ),
            );
          }),
          Consumer<JobProvider>(builder: (context, provider, _) {
            return provider.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: provider.jobs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return JobCard(
                          jobModel: provider.jobs[index],
                        );
                      },
                    ),
                  );
          }),
        ],
      ),
    );
  }
}
