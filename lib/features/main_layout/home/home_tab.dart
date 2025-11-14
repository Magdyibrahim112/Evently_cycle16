import 'package:evently_app_online/core/resources/colors_manager.dart';
import 'package:evently_app_online/core/widgets/custom_tab_bar.dart';
import 'package:evently_app_online/core/widgets/custom_tab_item.dart';
import 'package:evently_app_online/core/widgets/event_item.dart';
import 'package:evently_app_online/firebase/firebase_service.dart';
import 'package:evently_app_online/l10n/app_localizations.dart';
import 'package:evently_app_online/models/category_model.dart';
import 'package:evently_app_online/models/event_model.dart';
import 'package:evently_app_online/models/user_model.dart';
import 'package:evently_app_online/provider/language_provider.dart';
import 'package:evently_app_online/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int SelectedIndex = 0;
  List<EventModel> events = [];
  late CategoryModel selectedCategory = CategoryModel.getCategoriesWithAll(context)[0];/// كدا بدا باول category

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    var themeProvider = Provider.of<ThemeProvider>(context);

    ///كدا انا جبت ال object اللى اتكريت
    var langProvider = Provider.of<LanguageProvider>(context);

    ///كدا انا جبت ال object اللى اتكريت

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
          ),
          child: SafeArea(
            left: false,
            right: false,
            bottom: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${appLocalizations.welcome_back} ✨",

                          ///welcome back
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          UserModel.currentUser!.name,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: themeProvider.isDark
                                  ? ColorsManager.ofWhite
                                  : ColorsManager.white,
                            ),
                            Text(
                              "Cairo , Egypt",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        themeProvider.changeAppTheme(
                          themeProvider.isDark
                              ? ThemeMode.light
                              : ThemeMode.dark,
                        );
                      },
                      icon: Icon(
                        themeProvider.isDark
                            ? Icons.light_mode
                            : Icons.dark_mode_rounded,
                        color: themeProvider.isDark
                            ? ColorsManager.ofWhite
                            : ColorsManager.white,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: () {
                        langProvider.changAppLanguage(
                          langProvider.isEnglish ? "ar" : "en",
                        );
                      },
                      child: Card(
                        color: themeProvider.isDark
                            ? ColorsManager.ofWhite
                            : ColorsManager.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            langProvider.isEnglish ? "Ar" : "En",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                CustomTabBar(
                  onCategoryItemClicked: (category){
                    selectedCategory = category;
                    setState(() {

                    });
                  },
                  categories: CategoryModel.getCategoriesWithAll(context),
                  selectedBgColor: ColorsManager.whiteBlue,
                  selectedFgColor: ColorsManager.blue,
                  unSelectedBgColor: Colors.transparent,
                  unSelectedFgColor: ColorsManager.whiteBlue,
                ),
              ],
            ),
          ),
        ),
        StreamBuilder(/// ال streamBuilder بيعمل update علطول من غير ما اعمل rebuild
          stream: FirebaseService.getEventFromFireStoreRealTimeUpdates(context, selectedCategory),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            List<EventModel> events = snapshot.data ?? [];
            return Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => EventItem(
                  event: events[index],
                  markAsFavourite: UserModel.currentUser!.favouriteEventIds.contains(events[index].id),/// عشان لما افتح البرنامج واقفلو يظل محتفظ بالفيفورت ايفنت
                  //EventModel(
                  //id: "",
                  //category: CategoryModel.getCategories(context)[2],
                  //title: "This is a Birthday Party ",
                  //description: "This is a Birthday Party ",
                  //dateTime: DateTime.now(),
                  //timeOfDay: TimeOfDay.now(),
                  //),
                ),
                itemCount: events.length,
              ),
            );
          },
        ),
      ],
    );
  }

  /*
  void loadEvents()async{
    events =await FirebaseService.getEventFromFireStore(context);
    setState(() {

    });
  }
  */
}
