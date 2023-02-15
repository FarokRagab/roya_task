import 'package:flutter/material.dart';
import 'package:roya_task/data/models/job_model.dart';
import 'package:roya_task/screens/job_information_screen/job_information.dart';
import 'package:roya_task/utilities/animation_slide/slide_right.dart';

class JobCard extends StatelessWidget {
  final JobModel jobModel;
  const JobCard({super.key, required this.jobModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            SlideRight(
              page: JobInformation(
                jobModel: jobModel,
              ),
            ),
          );
        },
        child: ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Colors.amber, width: 2)),
          leading: Image.network(
            jobModel.companyLogo,
            height: size.height * 0.2,
            fit: BoxFit.contain,
          ),
          title: Text(
            jobModel.title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.black87),
          ),
          subtitle: Text(
            jobModel.companyName,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: Colors.black54,
                ),
          ),
          trailing: Text(
            jobModel.salary,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: Colors.green,
                ),
          ),
        ),
      ),
    );
  }
}
