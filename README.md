# roya_task

Starting with the main.dart page I have set the provider which I used to receive jobs from API.

The first screen is the HomeScreen,
This Screen has list of jobs displayed using a ListView.builder() inside Consumer to fill and display the using provider.

I've also used Consumers where I only needed to rebuild widgets and not on all the screen, increasing app performance.

Also in the HomeScreen AppBar there is a filter button, When user press on it When the user clicks on it, a box appears at the bottom of the app bar,
and this box contains two filters.

The first enables the user to arrange the Jobs displayed in the list in ascending and descending alphabetical order,
And second enables the user to arrange the jobs presented in the list in ascending and descending order according to the salary,
And when user press the filter icon again, this box disappears using Visibility() widget, using provider and consumer too.

The job card shared widget is used as a list tile items to display each jobs title,
company name, company logo and salary all from the API.

The HomeHeader widget is a separate pane called in the HomeScreen is the one where the filters are displayed,
 and I made it in a separate pane to reduce the code in the HomeScreen.

When the user clicks on any of the functions displayed in the list, he moves to the next page, which is a JobInformationScreen,
This page contains an accurate description of the job that was clicked on on the previous page,
I used the html package to convert the job description from HTML code so that I could display it on the screen.

At the bottom of the JobInformationScreen, there is a button called More Information. When the user clicks on this button,
it takes him to the website that was published regarding this job using url_launcher package.

The JobModel class serves as a template for the needed data to be fetched from the API.

I used the MediaQuery to adjust the screen sizes to be responsive on all devices with their different sizes.

Packages used :
  http: ^0.13.5
  provider: ^6.0.5
  html: ^0.15.1
  url_launcher: ^6.1.9




