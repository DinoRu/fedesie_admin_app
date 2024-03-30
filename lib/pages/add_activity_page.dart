import 'package:fedesie_admin_app/controller/home_controller.dart';
import 'package:fedesie_admin_app/widgets/dropdow_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/activite/activity.dart';

class AddActivity extends StatelessWidget {
  const AddActivity({super.key});

  @override
  Widget build(BuildContext context) {
    final Activity? activity = Get.arguments?['data'];
    return GetBuilder<HomeController>(builder: (_controller) {
      _controller.activityTitreCtrl.text = activity?.titre ?? "";
      _controller.activityDesCtrl.text = activity?.description ?? "";
      _controller.activityDateCtrl.text = activity?.date ?? "";
      _controller.activityTimeCtrl.text = activity?.heure ?? "";
      _controller.activityPlaceCtrl.text = activity?.place ?? "";
      _controller.activityImageCtrl.text = activity?.image ?? "";
      return Scaffold(
          appBar: AppBar(
            title: Text(activity == null ? "Ajouter une activité": "Modifier l'activité"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10),
                width: double.maxFinite,
                child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: _controller.activityTitreCtrl,
                          decoration: InputDecoration(
                              labelText: "Nom de l'activité",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: _controller.activityDesCtrl,
                          maxLines: 5,
                          decoration: InputDecoration(
                              labelText: "Description de l'activité",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TextField(
                          controller: _controller.activityDateCtrl,
                          decoration: InputDecoration(
                              labelText: "Date de l'activité",
                              border: OutlineInputBorder(
                              ),
                              prefixIcon: Icon(Icons.calendar_today)
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: _controller.activityTimeCtrl,
                          decoration: InputDecoration(
                              labelText: "Heure de l'activité",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: _controller.activityPlaceCtrl,
                          decoration: InputDecoration(
                              labelText: "Lieu",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: _controller.activityImageCtrl,
                          decoration: InputDecoration(
                              labelText: "Image url",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                            width: double.maxFinite,
                            child: DropdownBtn(
                              category: _controller.categories.map((category) => category.name ?? "").toList(),
                              selectItemText: _controller.categorie,
                              onSelected: (selectedValue) {
                                _controller.categorie = selectedValue ?? 'categorie';
                                _controller.update();

                              },
                            )
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (selected) {}),
                          const Expanded(
                              child: Text('Etes-vous sur de publier'))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () {
                              if (activity == null) {
                                _controller.addActivity();
                              } else {
                                _controller.updateActivity(activity!.id ?? "");
                                Get.back();
                              }
                            },
                            child: Text(activity == null ? "Ajouter" : "Modifier"),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ]
                ),
              )
          )
      );
    });
  }
}
