import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/information_controller.dart';
import '../Resources/widgets/common_widgets.dart';
import '../Resources/widgets/strings.dart';
import 'information_page.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late TextEditingController nameController, websiteController, zaloController, descriptionController;
  final inforController = Get.put(InformationController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    websiteController = TextEditingController();
    zaloController = TextEditingController();
    descriptionController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(INFORMATION_INPUT),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              // name input
              inputWidget(
                  label: NAME,
                  hintText: NAME_INPUT,
                  controller: nameController),
              // Zalo input
              inputWidget(
                  label: ZALO,
                  hintText: ZALO_INPUT,
                  controller: zaloController),
              // Website input
              inputWidget(
                  label: WEBSITE,
                  hintText: WEBSITE_INPUT,
                  controller: websiteController),
              // description input
              inputWidget(
                  label: DESCRIPTION,
                  hintText: DESCRIPTION_INPUT,
                  controller: descriptionController),
              // confirm button
              buttonWidget(
                  label: CONFIRM,
                  colorButton: Colors.blue,
                  colorText: Colors.white,
                  onPress: (){
                    // update information to Provider
                    inforController.updateInformation(
                        name: nameController.text.obs,
                        zalo: zaloController.text.obs,
                        website: websiteController.text.obs,
                        description: descriptionController.text.obs
                    );
                    // Routing to Information Page
                    Get.to(() => InformationPage());
                  })
            ],
          ),
        ),
      ),
    );
  }
}