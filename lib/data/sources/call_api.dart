import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:roya_task/data/models/job_model.dart';

class ApiData {
  Future<List<JobModel>> fetchData() async {
    var url = Uri.parse('https://remotive.com/api/remote-jobs');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> jobs = jsonResponse['jobs'];
      final data = jobs.map((e) {
        return JobModel(
          url: e['url'],
          title: e['title'],
          companyName: e['company_name'],
          companyLogo: e['company_logo'],
          description: e['description'],
          salary: e['salary'],
        );
      }).toList();
      return data;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
