import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class InformationController extends GetxController {
  var name = " ".obs;
  var zalo = " ".obs;
  var website = " ".obs;
  var description = " ".obs;

  //Method update information
  updateInformation({@required name, @required zalo, @required website, @required description}) {
    this.name = name;
    this.zalo = zalo;
    this.website = website;
    this.description = description;
  }

}
