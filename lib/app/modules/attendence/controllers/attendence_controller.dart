import 'package:Lakshore/app/data/attenance_model.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../components/attendence_making_widget.dart';

class AttendenceController extends GetxController {
  DateTime currentDate = DateTime.now();
  Rx<String> currentMonth = DateFormat.yMMM().format(DateTime(2023, 2, 1)).obs;

  DateTime targetDateTime = DateTime.now();
  EventList<Event> markedUpDates = new EventList<Event>(
    events: {},
  );
  int len = FullDay.length;
  int leng = HalfDay.length;
  int length = WeekOff.length;
  int lengt = Prensent.length;
  int le = Absent.length;

  @override
  void onInit() {
    for (int i = 0; i < len; i++) {
      markedUpDates.add(
        FullDay[i],
        new Event(
            date: FullDay[i],
            title: 'FL',
            icon: Fullday(FullDay[i].day.toString())),
      );
    }
    for (int i = 0; i < leng; i++) {
      markedUpDates.add(
        HalfDay[i],
        new Event(
            date: HalfDay[i],
            title: 'FL',
            icon: Halfday(HalfDay[i].day.toString())),
      );
    }
    for (int i = 0; i < length; i++) {
      markedUpDates.add(
        WeekOff[i],
        new Event(
            date: WeekOff[i],
            title: 'FL',
            icon: Weeekoff(WeekOff[i].day.toString())),
      );
    }
    for (int i = 0; i < lengt; i++) {
      markedUpDates.add(
        Prensent[i],
        new Event(
            date: Prensent[i],
            title: 'FL',
            icon: Present(Prensent[i].day.toString())),
      );
    }
    for (int i = 0; i < le; i++) {
      markedUpDates.add(
        Absent[i],
        new Event(
            date: Absent[i],
            title: 'FL',
            icon: absent(Absent[i].day.toString())),
      );
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
