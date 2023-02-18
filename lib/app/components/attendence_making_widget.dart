import 'package:Lakshore/app/components/textstyle.dart';
import 'package:Lakshore/app/modules/attendence/controllers/attendence_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

Widget CustomCalendar({
  required String headerText,
  required DateTime currentDate,
  required DateTime targetDateTime,
  required EventList<Event> markedDatesMap,
}) =>
    CalendarCarousel<Event>(
      locale: 'en',

        headerTextStyle: TEXTSTYLE(
          color: Colors.black,
          fontweight: FontWeight.w600,
          fontsize: 20.0,
        ),
        showHeaderButton: true,
        headerText: headerText,
        //controller.currentMonth.value,
        todayBorderColor: Colors.transparent,
        weekDayPadding: EdgeInsets.only(bottom: 18),
        weekdayTextStyle: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.w400, fontSize: 18),
        selectedDayButtonColor: Colors.transparent,
        selectedDayBorderColor: Colors.transparent,
        daysHaveCircularBorder: false,
        showOnlyCurrentMonthDate: true,
        weekendTextStyle: TextStyle(
          color: Colors.black,
        ),
        thisMonthDayBorderColor: Colors.transparent,
        weekFormat: false,
        weekDayFormat: WeekdayFormat.short,

       // firstDayOfWeek: 4,
        markedDatesMap: markedDatesMap,
        //controller.markedUpDates,
        height: 450.0,
        width: double.infinity,
        selectedDateTime: currentDate,
        //controller.currentDate,
        //targetDateTime: targetDateTime,
        //controller.targetDateTime,
        customGridViewPhysics: NeverScrollableScrollPhysics(),
        markedDateShowIcon: true,
        markedDateIconBuilder: (event) {
          return event.icon;
        },
        selectedDayTextStyle: TextStyle(color: Colors.black),
        showHeader: true,
        todayTextStyle: TextStyle(
          color: Colors.blue,
        ),
        todayButtonColor: Colors.transparent,
        minSelectedDate: //controller.currentDate.
            currentDate.subtract(Duration(days: 360)),
        maxSelectedDate: //controller.currentDate
            currentDate.add(Duration(days: 360)),
        onCalendarChanged: (DateTime date) {
// controller.targetDateTime
          targetDateTime = date;
//controller.currentMonth.value
          headerText = DateFormat.yMMM().format(targetDateTime);
//controller.targetDateTime);
        },
        onDayLongPressed: (DateTime date) {
          print('long pressed date $date');
        },

    );

Widget Fullday(String day) => FittedBox(
      child: new Container(
          height: 40,
          width: 40,
          decoration: new BoxDecoration(
            color: Colors.red.shade900,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            // border: Border.all(color: Colors.blue, width: 2.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Text(
                'FL',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          )),
    );

Widget Weeekoff(String day) => FittedBox(
      child: new Container(
          height: 40,
          width: 40,
          decoration: new BoxDecoration(
            color: Colors.yellow.shade600,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            // border: Border.all(color: Colors.blue, width: 2.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),
              Text(
                'WO',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),
            ],
          )),
    ); //WeekOff.length,);

Widget Halfday(String day) => FittedBox(
      child: new Container(
          height: 40,
          width: 40,
          decoration: new BoxDecoration(
            color: Colors.orange.shade900,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            // border: Border.all(color: Colors.blue, width: 2.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Text(
                'HF',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          )),
    ); //WeekOff.length,);
Widget Present(String day) => FittedBox(
  child: new Container(
      height: 40,
      width: 40,
      decoration: new BoxDecoration(
  color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    // border: Border.all(color: Colors.blue, width: 2.0)
  ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          day,
          style: TextStyle(
            color: Colors.limeAccent.shade700,
            fontSize: 14,
          ),
        ),
        Text(
          'P',
          style: TextStyle(
            color: Colors.limeAccent.shade700,
            fontSize: 14,
          ),
        ),
      ],
    )),
    //Icon(Icons.check_rounded,color: Colors.lightGreen.shade900,),


);
Widget absent(String day) => FittedBox(
  child: new Container(
      height: 40,
      width: 40,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        // border: Border.all(color: Colors.blue, width: 2.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              color: Colors.red,
              fontSize: 14,
            ),
          ),
          Text(
            'Ab',
            style: TextStyle(
              color: Colors.red,
              fontSize: 14,
            ),
          ),
        ],
      )
      //child: Icon(Icons.close_rounded,color: Colors.red,),
),
); //WeekOff.length,);
