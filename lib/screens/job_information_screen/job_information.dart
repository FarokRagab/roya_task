import 'package:flutter/material.dart';
import 'package:roya_task/data/models/job_model.dart';
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';

class JobInformation extends StatelessWidget {
  final JobModel jobModel;
  const JobInformation({super.key, required this.jobModel});

  @override
  Widget build(BuildContext context) {
    String htmlDescription = jobModel.description;
    var document = parse(htmlDescription);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          jobModel.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.02,
            horizontal: size.width * 0.02,
          ),
          child: Card(
            elevation: 10,
            shadowColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(
                color: Colors.amber,
                width: 2,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.03,
                horizontal: size.width * 0.03,
              ),
              child: Text(
                parse(document.body!.text).documentElement!.text,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        onPressed: () {
          _goToSite();
        },
        label: Text(
          "More details",
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }

  Future<dynamic>? _goToSite() async {
    var url = Uri.parse(jobModel.url);
    return await launchUrl(url);
  }
}
