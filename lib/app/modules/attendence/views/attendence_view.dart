import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../components/image_common.dart';
import '../../../components/textstyle.dart';
import '../controllers/attendence_controller.dart';

class AttendenceView extends GetView<AttendenceController> {
  const AttendenceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(),
          ImageCommon(),
          Positioned(
            left: 16,
            top: 36,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.blue,
              ),
            ),
          ),
          Positioned(
            top: 44,
            left: 40,
            right: 40,
            child: Center(
              child: Text(
                'Attendence',
                style: TEXTSTYLE(
                  fontweight: FontWeight.w500,
                  fontsize: 24.0,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18.0),
              child: Obx(
                () => CalendarCarousel<Event>(
                  locale: 'en',
                  leftButtonIcon: Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: Colors.grey,
                  ),
                  rightButtonIcon: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.grey,
                  ),
                  headerTextStyle: TEXTSTYLE(
                    color: Colors.black,
                    fontweight: FontWeight.w600,
                    fontsize: 20.0,
                  ),
                  showHeaderButton: true,
                  headerText: controller.currentMonth.value,
                  todayBorderColor: Colors.transparent,
                  weekDayPadding: EdgeInsets.only(bottom: 18),
                  weekdayTextStyle: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
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
                  markedDatesMap: controller.markedUpDates,
                  height: 450.0,
                  width: double.infinity,
                  selectedDateTime: controller.currentDate,
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
                  minSelectedDate:
                      controller.currentDate.subtract(Duration(days: 360)),
                  maxSelectedDate:
                      controller.currentDate.add(Duration(days: 360)),
                  onCalendarChanged: (DateTime date) {
                    controller.targetDateTime = date;
                    controller.currentMonth.value =
                        DateFormat.yMMM().format(controller.targetDateTime);
                  },
                  onDayLongPressed: (DateTime date) {
                    print('long pressed date $date');
                  },
                ),
                //   CustomCalendar(
                // headerText: controller.currentMonth.value,
                // currentDate: controller.currentDate,
                // targetDateTime: controller.targetDateTime,
                // markedDatesMap:
                //     controller.markedUpDates),
              ),
            ),
          ),
          Positioned(
              bottom: 70,
              left: 8,
              right: 8,
              child: Center(
                child: Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 20,
                  spacing: 20,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 24,
                      children: [
                        Wrap(
                          spacing: 10,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.red.shade900,
                              ),
                              child: Center(
                                  child: Text(
                                'FL',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 8),
                              )),
                            ),
                            Text('Full Day',
                                style: TEXTSTYLE(
                                    fontsize: 12.0,
                                    fontweight: FontWeight.w300,
                                    color: Colors.grey))
                          ],
                        ),
                        Wrap(
                          spacing: 10,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                'Ab',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 8),
                              )),
                            ),
                            Text('Absent',
                                style: TEXTSTYLE(
                                    fontsize: 12.0,
                                    fontweight: FontWeight.w300,
                                    color: Colors.grey))
                          ],
                        ),
                      ],
                    ),
                    Wrap(
                      spacing: 24,
                      direction: Axis.vertical,
                      children: [
                        Wrap(
                          spacing: 10,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.orange.shade900,
                              ),
                              child: Center(
                                  child: Text(
                                'HF',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 8),
                              )),
                            ),
                            Text('Half Day',
                                style: TEXTSTYLE(
                                    fontsize: 12.0,
                                    fontweight: FontWeight.w300,
                                    color: Colors.grey))
                          ],
                        ),
                        Wrap(
                          spacing: 10,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                'P',
                                style: TextStyle(
                                    color: Colors.limeAccent.shade700,
                                    fontSize: 8),
                              )),
                            ),
                            Text('Present',
                                style: TEXTSTYLE(
                                    fontsize: 12.0,
                                    fontweight: FontWeight.w300,
                                    color: Colors.grey))
                          ],
                        ),
                      ],
                    ),
                    Wrap(
                      spacing: 10,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.yellowAccent.shade700,
                          ),
                          child: Center(
                              child: Text(
                            'WO',
                            style: TextStyle(color: Colors.red, fontSize: 8),
                          )),
                        ),
                        Text(
                          'Week Off',
                          style: TEXTSTYLE(
                              fontsize: 12.0,
                              fontweight: FontWeight.w300,
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
