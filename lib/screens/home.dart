import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../datasource/meeting_datasource.dart';
import '../models/meeting.dart';
import '../widgets/drawer_menu.dart';
import '../widgets/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  List<String> children = List.generate(5, (index) => faker.job.title());

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 21, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 5));
    meetings.add(Meeting('Repais', startTime, endTime, Colors.red, false));
    meetings.add(Meeting('Screen Protector',
        startTime.add(const Duration(hours: 2)), endTime, Colors.green, false));
    meetings.add(Meeting('Battery Replacement',
        startTime.add(const Duration(days: 1)), endTime, Colors.orange, false));

    return meetings;
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      key: _key,
      appBar: AppBar(
        elevation: 1.2,
        title: Text(widget.title),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => _key.currentState?.openDrawer(),
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: const Icon(
                Icons.notifications_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      drawer: const DrawerMenu(),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: Text(
                'Hi ${faker.person.name()}',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff363636),
                ),
              ),
            ),
            const SearchWidget(),
            Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: const Text(
                "Appointments",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Color(0xff363636),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: const BoxDecoration(
                color: Color(0xffEFD593),
              ),
              child: SfCalendar(
                view: CalendarView.timelineMonth,
                showNavigationArrow: true,
                todayHighlightColor: Colors.red,
                todayTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                showWeekNumber: false,
                dataSource: MeetingDataSource(_getDataSource()),
                // by default the month appointment display mode set as Indicator, we can
                // change the display mode as appointment using the appointment display
                // mode property
                monthViewSettings: const MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: const Text(
                "Previous Bookings",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Color(0xff363636),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20.5),
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(
                        Icons.calendar_today_rounded,
                        size: 34,
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        size: 34,
                      ),
                      title: Text("Appointment $index"),
                      onTap: () {
                        // Todo: Navvigate to the appointment details
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Todo: Navigate
          print("Navigate to appointment booking page");
        },
        tooltip: 'Book Appointment',
        child: const Icon(Icons.add),
      ),
    );
    return scaffold;
  }
}
