import 'package:evently_app_online/core/resources/assets_manager.dart';
import 'package:evently_app_online/core/resources/colors_manager.dart';
import 'package:evently_app_online/core/widgets/custom_elevated_button.dart';
import 'package:evently_app_online/core/widgets/custom_tab_bar.dart';
import 'package:evently_app_online/core/widgets/custom_text_button.dart';
import 'package:evently_app_online/core/widgets/custom_text_form_field.dart';
import 'package:evently_app_online/l10n/app_localizations.dart';
import 'package:evently_app_online/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
 late CategoryModel selectedCategory = CategoryModel.getCategories(context)[0];
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(appLocalizations.create_event)),///Create Event
      body: Padding(
        padding: REdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(selectedCategory.imagePath),
              ),
              SizedBox(height: 16.h),
              CustomTabBar(
                onCategoryItemClicked: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
                categories: CategoryModel.getCategories(context),///########3
                selectedBgColor: ColorsManager.blue,
                selectedFgColor: ColorsManager.whiteBlue,
                unSelectedBgColor: Colors.transparent,
                unSelectedFgColor: ColorsManager.blue,
              ),
              SizedBox(height: 16.h),
              Text(appLocalizations.title, style: Theme.of(context).textTheme.titleMedium),///Title
              SizedBox(height: 8.h),
              CustomTextFormField(
                hintText: appLocalizations.event_title,///Event Title
                prefixIcon: Icon(Icons.edit_note_sharp),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16.h),
              Text(
                appLocalizations.description,///Description
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8.h),
              CustomTextFormField(
                hintText: appLocalizations.event_description,///Event Description
                keyboardType: TextInputType.text,
                maxLines: 4,
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Icon(Icons.date_range_outlined),
                  SizedBox(width: 4.w),
                  Text(
                    appLocalizations.event_date,///Event Date
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Spacer(),
                  CustomTextButton(
                    text: appLocalizations.choose_date,///Choose Date
                    onTap: () {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Icon(Icons.date_range_outlined),
                  SizedBox(width: 4.w),
                  Text(
                    appLocalizations.event_time,///Event Time
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Spacer(),
                  CustomTextButton(
                    text: appLocalizations.choose_time,///Choose Time
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              /*Text("Location", style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 8.h),
              CustomTextFormField(
                hintText: "Event Title",
                prefixIcon: Icon(Icons.edit_note_sharp),
                keyboardType: TextInputType.text,
              ),
              */
              CustomElevatedButton(text: appLocalizations.create_event, onPress: () {}),///Create event
            ],
          ),
        ),
      ),
    );
  }
}
