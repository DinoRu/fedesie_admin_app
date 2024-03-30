import 'package:fedesie_admin_app/controller/home_controller.dart';
import 'package:fedesie_admin_app/pages/add_activity_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Admin page"),
          centerTitle: true,
        ),
        body:
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
              itemCount: _controller.activities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_controller.activities[index].titre ?? ""),
                  subtitle: Text(_controller.activities[index].categorie ?? ""),
                  trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Get.to(AddActivity(), arguments: {'data': _controller.activities[index]});
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _controller.deleteActivity(_controller.activities[index].id ?? "");
                      },
                    ),
                  ],
                ),
                );
              }
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddActivity());
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
