import 'package:evently_app_online/core/resources/colors_manager.dart';
import 'package:evently_app_online/core/widgets/event_item.dart';
import 'package:evently_app_online/firebase/firebase_service.dart';
import 'package:evently_app_online/l10n/app_localizations.dart';
import 'package:evently_app_online/models/category_model.dart';
import 'package:evently_app_online/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: ColorsManager.blue),
                hintText: appLocalizations.search_for_event,///search for event
                hintStyle: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: ColorsManager.blue,
                  fontWeight: FontWeight.bold,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
                ),
              ),
            ),
          ),
          FutureBuilder(future: FirebaseService.getFavouriteEvents(context),
              builder: (context, snapshot){
            /// snapshot بيعرفنى حالة البرنامج تى
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()),);
            }
            List<EventModel> favouriteEvents = snapshot.data ?? [];
            return Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: favouriteEvents.length,
                itemBuilder: (context, index) => EventItem(
                  event: favouriteEvents[index],
                  markAsFavourite: true,
                ),
              ),
            );
              }),

        ],
      ),
    );
  }
}
