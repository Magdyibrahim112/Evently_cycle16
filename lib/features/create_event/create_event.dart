//import 'package:evently_app_online/core/resources/assets_manager.dart';
import 'package:evently_app_online/core/resources/colors_manager.dart';
import 'package:evently_app_online/core/resources/validators.dart';
import 'package:evently_app_online/core/ui_utils.dart';
import 'package:evently_app_online/core/widgets/custom_elevated_button.dart';
import 'package:evently_app_online/core/widgets/custom_tab_bar.dart';
import 'package:evently_app_online/core/widgets/custom_text_button.dart';
import 'package:evently_app_online/core/widgets/custom_text_form_field.dart';
import 'package:evently_app_online/firebase/firebase_service.dart';
import 'package:evently_app_online/l10n/app_localizations.dart';
import 'package:evently_app_online/models/category_model.dart';
import 'package:evently_app_online/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
 late CategoryModel selectedCategory = CategoryModel.getCategories(context)[0];
 DateTime selectedDateTime = DateTime.now();
 TimeOfDay pickedTimeTemp = TimeOfDay.now();
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 late TextEditingController _titleController;
 late TextEditingController _descriptionController;

 @override
 void initState() {
   // TODO: implement initState
   super.initState();
   _titleController = TextEditingController();
   _descriptionController = TextEditingController();
 }

 @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();

  }

 @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(appLocalizations.create_event)),///Create Event
      body: Padding(
        padding: REdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key:  _formKey,
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
                Text(
                    appLocalizations.title,
                    style: Theme.of(context).textTheme.titleMedium
                ),///Title
                SizedBox(height: 8.h),
                CustomTextFormField(
                  controller: _titleController,
                  validator: Validator.validateEventTitle,
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
                  controller: _descriptionController,
                  validator: Validator.validateEventDescription,
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
                      //selectedDateTime.toFormattedDate,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Spacer(),
                    CustomTextButton(
                      text: appLocalizations.choose_date,///Choose Date
                      onTap: _selectEventDate,
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
                      //selectedDateTime.getTime,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Spacer(),
                    CustomTextButton(
                      text: appLocalizations.choose_time,///Choose Time
                      onTap: _selectEventTime
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
                CustomElevatedButton(
                    text: appLocalizations.create_event,
                    onPress: _createEvent
                ),///Create event
              ],
            ),
          ),
        ),
      ),
    );
  }

 void _selectEventDate() async {
   selectedDateTime =
       await showDatePicker(
         context: context,
         firstDate: DateTime.now(),
         lastDate: DateTime.now().add(Duration(days: 365)),
       ) ??
           selectedDateTime;
   selectedDateTime = selectedDateTime.copyWith(hour: pickedTimeTemp.hour, minute: pickedTimeTemp.minute);

   setState(() {});
 }

 void _selectEventTime() async {
   pickedTimeTemp =
       await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
           pickedTimeTemp;

   selectedDateTime = selectedDateTime.copyWith(
     hour: pickedTimeTemp.hour,
     minute: pickedTimeTemp.minute,
   );
   setState(() {});
 }

 void _createEvent()async{
    if(_formKey.currentState?.validate() == false) return;
    selectedCategory;
    _titleController.text;
    _descriptionController.text;
    selectedDateTime;
    EventModel event = EventModel(id: "",
        category: selectedCategory,
        title: _titleController.text,
        description: _descriptionController.text,
        dateTime: selectedDateTime,
    );
    UIUtils.showLoading(context, isDismissible: false);
    await FirebaseService.addEventToFireStore(event, context);
    UIUtils.hideDialog(context);
    UIUtils.showToastMessage("Event created successfully", Colors.green);
    Navigator.pop(context);/// كدا انا هقفلها بعد ما الايفنت يتكريت
 }

}
