import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/information_controller.dart';
import '../Resources/widgets/common_widgets.dart';
import '../Resources/widgets/strings.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    final InformationController informationController =
        Get.put(InformationController());
    print(informationController.name.value);
    return Scaffold(
        appBar: AppBar(
          title: Text(INFORMATION),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Obx(() => Column(
                children: [
                  informationWidget(
                      label: NAME,
                      content: informationController.name.value),
                  Divider(),
                  informationWidget(
                      label: ZALO,
                      content: informationController.zalo.value),
                  Divider(),
                  informationWidget(
                      label: WEBSITE,
                      content: informationController.website.value),
                  Divider(),
                  informationWidget(
                      label: DESCRIPTION,
                      content: informationController.description.value),
                  Divider(),
                ],
              )),
        ));
  }
}
