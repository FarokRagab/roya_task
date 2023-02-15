import 'package:flutter/cupertino.dart';
import 'package:roya_task/data/models/job_model.dart';
import 'package:roya_task/data/sources/call_api.dart';

class JobProvider extends ChangeNotifier {
  List<JobModel> _jobs = [];
  List<JobModel> get jobs => _jobs;
  List<JobModel> sortedItems = [];
  bool isDescendingAlpha = false;
  bool isDescendingSalary = false;
  bool filtersVisibility = false;
  bool isLoading = true;
  final _apiData = ApiData();

  Future<void> allJobs() async {
    notifyListeners();
    final response = await _apiData.fetchData();
    _jobs = response;
    isLoading = false;
    notifyListeners();
  }

  sortByAlpha() {
    isDescendingAlpha = !isDescendingAlpha;
    // isDescendingSalary = false;
    sortedItems = jobs
      ..sort((item1, item2) => isDescendingAlpha
          ? item1.title
              .trim()
              .toLowerCase()
              .compareTo(item2.title.trim().toLowerCase())
          : item2.title
              .trim()
              .toLowerCase()
              .compareTo(item1.title.trim().toLowerCase()));
    notifyListeners();
  }

  sortBySalary() {
    isDescendingSalary = !isDescendingSalary;
    // isDescendingAlpha = false;
    sortedItems = jobs
      ..sort((item1, item2) => isDescendingSalary
          ? item1.salary.compareTo(item2.salary)
          : item2.salary.compareTo(item1.salary));
    notifyListeners();
  }

  showHideFilters() {
    filtersVisibility = !filtersVisibility;
    notifyListeners();
  }
}
