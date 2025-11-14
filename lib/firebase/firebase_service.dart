import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app_online/models/category_model.dart';
import 'package:evently_app_online/models/event_model.dart';
import 'package:evently_app_online/models/login_request.dart';
import 'package:evently_app_online/models/register_request.dart';
import 'package:evently_app_online/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class FirebaseService {
  static Future<UserCredential> register(RegisterRequest request) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: request.email,
          password: request.password,
        );
    return userCredential;
  }

  static Future<UserCredential> login(LoginRequest request) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: request.email,
          password: request.password,
        );
    return userCredential;
  }

  /* static Future<void> addUserToFireStore(UserModel user) {
    FirebaseFirestore db = FirebaseFirestore.instance;

    /// كدا انا جبت object من ال firestore بتاعتى
    CollectionReference<Map<String, dynamic>> userCollection = db.collection(
      "Users",
    );
    DocumentReference<Map<String, dynamic>> userDocument = userCollection.doc(
      user.id,
    );
    return userDocument.set(
    //{"id": user.id,
      // "email": user.email,
      // "name": user.name,}
      user.toJson()
    );
  }*/
  /// انا هدى ال Db
  /// userModel وهخليها ترجع برضو
  /// userModel

  static CollectionReference<UserModel> _getUsersCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;

    /// كدا انا جبت object من ال Db
    CollectionReference<UserModel> userCollection = db
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),

          /// وانت راجعfireStore من ال
          toFirestore: (user, _) => user.toJson(),
        );

    /// وانت رايح لل fireStore
    return userCollection;
  }

  static Future<void> addUserToFireStore(UserModel user) {
    CollectionReference<UserModel> userCollection = _getUsersCollection();
    DocumentReference<UserModel> userDocument = userCollection.doc(user.id);
    return userDocument.set(user);
  }

  static Future<UserModel?> getUserFromFireStore(String uid) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    /// كدا انا جبت object من ال Db
    CollectionReference<UserModel> userCollection = _getUsersCollection();
    DocumentReference<UserModel> userDocument = userCollection.doc(uid);
    DocumentSnapshot<UserModel> documentSnapshot = await userDocument.get();
    return documentSnapshot.data();
  }

  /* static Future<UserModel> getUserFromFireStore(String uid) async {
    FirebaseFirestore db = FirebaseFirestore.instance;/// كدا انا جبت object من ال Db
    CollectionReference<Map<String, dynamic>> userCollection = db.collection(/// هيرجع reference على ال collection الموجود
      "Users",
    );
    DocumentReference<Map<String, dynamic>> userDoc = userCollection.doc(uid);
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await userDoc
        .get();
    var json = documentSnapshot.data();
    return UserModel.fromJson(json!);
    /*
      UserModel(
      id: json?["id"],
      name: json?["name"],
      email: json?["email"],
    );
     */
  } */

  static CollectionReference<EventModel> _getEventsCollection(
    BuildContext context,
  ) {
    FirebaseFirestore db = FirebaseFirestore.instance;

    /// كدا انا جبت object من ال Db
    CollectionReference<EventModel> eventsCollection = db
        .collection("Events")
        .withConverter<EventModel>(
          fromFirestore: (snapshot, _) =>
              EventModel.fromJson(snapshot.data()!, context),
          toFirestore: (event, _) => event.toJson(),
        );
    return eventsCollection;
  }

  static Future<void> addEventToFireStore(
    EventModel event,
    BuildContext context,
  ) {
    CollectionReference<EventModel> eventsCollection = _getEventsCollection(
      context,
    );
    DocumentReference<EventModel> eventDocument = eventsCollection.doc();
    event.id = eventDocument.id;
    return eventDocument.set(event);
  }

  static Future<List<EventModel>> getEventFromFireStore(
    BuildContext context,
    [CategoryModel? category]
  ) async {
    CollectionReference<EventModel> eventsCollection = _getEventsCollection(
      context,
    );
    QuerySnapshot<EventModel> querySnapshot = await eventsCollection
        .where("categoryId", isEqualTo: category?.id == "0" ? null : category?.id)
        .orderBy("dateTime")
        .get();

    /// هياخد snapshot جواها ال document
    /// orderBy عشان ترتب ال event حسب التاريخ
    List<EventModel> events = querySnapshot.docs
        .map((documentSnapshot) => documentSnapshot.data())
        .toList();

    /// ال data عبارة عن event
    /*
    if(category.id == "0"){
      return events;
    }else{
      return events.where((event)=>event.category.id == category.id).toList();

 */
    return events;
  }

  static Stream<List<EventModel>> getEventFromFireStoreRealTimeUpdates(
    BuildContext context,
    CategoryModel category,
  ) async* {
    CollectionReference<EventModel> eventsCollection = _getEventsCollection(
      context,
    );
    Stream<QuerySnapshot<EventModel>> collectionSnapshots = eventsCollection
        .where("categoryId", isEqualTo: category.id == "0" ? null : category.id)
        .orderBy("dateTime")
        .snapshots();

    ///snapshots لان اى update بيحصل بيجيب snapshot منو
    /// كل ما يحصل update جديد يجيب snapshot جديد
    Stream<List<EventModel>> eventStream = collectionSnapshots.map(
      (querySnapshot) => querySnapshot.docs
          .map((documentSnapshot) => documentSnapshot.data())
          .toList(),
    );
    yield* eventStream;
  }

  static Future <void> addEventToFavourite(EventModel event){
    UserModel currentUser =  UserModel.currentUser!;
    currentUser.favouriteEventIds.add(event.id);
    CollectionReference<UserModel> usersCollection = _getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(currentUser.id);
    return userDocument.set(currentUser);
  }

  static Future <void> removeEventFromFavourite(EventModel event){
    UserModel currentUser =  UserModel.currentUser!;
    currentUser.favouriteEventIds.remove(event.id);
    CollectionReference<UserModel> usersCollection = _getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(currentUser.id);
    return userDocument.set(currentUser);
  }

  static Future<List<EventModel>> getFavouriteEvents(BuildContext context)async{
    List<EventModel> events =await getEventFromFireStore(context);
    List<EventModel> favouriteEvents = events.where((event)=> UserModel.currentUser!.favouriteEventIds.contains(event.id)).toList();
    return favouriteEvents;
  }

  }
