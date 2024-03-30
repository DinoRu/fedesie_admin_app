import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fedesie_admin_app/models/activite/activity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/category/category.dart';

class HomeController extends GetxController {

  TextEditingController activityTitreCtrl = TextEditingController();
  TextEditingController activityDesCtrl = TextEditingController();
  TextEditingController activityDateCtrl = TextEditingController();
  TextEditingController activityTimeCtrl = TextEditingController();
  TextEditingController activityPlaceCtrl = TextEditingController();
  TextEditingController activityImageCtrl = TextEditingController();

  String categorie = 'categorie';



  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference activityCollection;
  late CollectionReference categoryCollection;

  List<Activity> activities = [];
  List<Category> categories = [];

  @override
  Future<void> onInit() async {
    activityCollection = firestore.collection("activites");
    categoryCollection = firestore.collection('category');
    await fetchCategories();
    await fetchActivities();
    super.onInit();
  }

  addActivity() {
    try {
      DocumentReference doc = activityCollection.doc();
      Activity activity = Activity(
            id: doc.id,
            titre: activityTitreCtrl.text,
            description: activityDesCtrl.text,
            categorie: categorie,
            image: activityImageCtrl.text,
            date: activityDateCtrl.text,
            heure: activityTimeCtrl.text,
            place: activityPlaceCtrl.text,
          );
      final activityJson = activity.toJson();
      doc.set(activityJson);
      Get.snackbar('Success', "Activity has been added successfully!", colorText: Colors.green);
      setValuesDefault();
      fetchActivities();
    } catch (e) {
      Get.snackbar('Error', "Something was wrong!", colorText: Colors.red);
    } finally {
      update();
    }
  }

  setValuesDefault(){
    activityImageCtrl.clear();
    activityDateCtrl.clear();
    activityTimeCtrl.clear();
    activityPlaceCtrl.clear();
    activityDesCtrl.clear();
    activityTitreCtrl.clear();
    categorie = 'categorie';
    update();
  }



  fetchActivities() async {
     try {
       QuerySnapshot activitySnapshot = await activityCollection.get();
       final List<Activity> retrievedActivities = activitySnapshot.docs.map((doc) => Activity.fromJson(
                doc.data() as Map<String, dynamic>)).toList();
       activities.clear();
       activities.assignAll(retrievedActivities);
       Get.snackbar('Success', "Activity fetch successfully!", colorText: Colors.green);
     } catch (e) {
       Get.snackbar('Error', "Something was wrong!", colorText: Colors.red);
     } finally {
       update();
     }
  }

  fetchCategories() async {
    try {
      QuerySnapshot categorySnapshot = await categoryCollection.get();
      final List<Category> retrievedCategories = categorySnapshot.docs.map((doc) => Category.fromJson(
          doc.data() as Map<String, dynamic>)).toList();
      categories.clear();
      categories.assignAll(retrievedCategories);
      Get.snackbar('Success', "Category fetch successfully!", colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', "Something was wrong!", colorText: Colors.red);
    } finally {
      update();
    }
  }


  updateActivity(String id) async {
    try {
      DocumentReference doc = activityCollection.doc(id);
      Activity updatedActivity = Activity(
        id: id,
        titre: activityTitreCtrl.text,
        description: activityDesCtrl.text,
        categorie: categorie,
        image: activityImageCtrl.text,
        date: activityDateCtrl.text,
        heure: activityTimeCtrl.text,
        place: activityPlaceCtrl.text,
      );
      final updatedActivityJson = updatedActivity.toJson();
      doc.update(updatedActivityJson);
      Get.snackbar('Success', "Activity has been updated successfully!", colorText: Colors.green);
      setValuesDefault();
      fetchActivities();
    } catch (e) {
      Get.snackbar('Error', "Something went wrong while updating activity!", colorText: Colors.red);
    } finally {
      update();
    }
  }


  deleteActivity(String id) async {
    try {
      await activityCollection.doc(id).delete();
      fetchActivities();
      Get.snackbar("Success", 'Activity was deleted successfully!', colorText: Colors.green);
    } catch (e) {
      Get.snackbar("Error", "Something was wrong!", colorText: Colors.red);
    }

  }

}

