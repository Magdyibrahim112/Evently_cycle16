import 'package:evently_app_online/core/extensions/data_ex.dart';
import 'package:evently_app_online/core/resources/colors_manager.dart';
import 'package:evently_app_online/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventItem extends StatefulWidget {
  const EventItem({super.key, required this.event});
  final EventModel event;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  List<String> monthes = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov"
  ];
  bool favourite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      margin: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      height: 203.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.blue, width: 1.w),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(widget.event.category.imagePath),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.event.dateTime.viewDayNumber ,
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      color: ColorsManager.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    // الشهر هنقص منو واحد عشان انا عندى list بتبدا من ال 0 لى ال 11
                    widget.event.dateTime.viewMonthName,
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: ColorsManager.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.event.title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        favourite = !favourite;
                      });
                    },
                    icon: Icon(favourite ?  Icons.favorite : Icons.favorite_border_outlined, color: ColorsManager.blue,),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  String viewMonthName(DateTime date){
    DateFormat formatter = DateFormat("MMM");
    return formatter.format(date);
  }
}
