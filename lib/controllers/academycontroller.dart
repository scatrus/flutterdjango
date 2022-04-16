import 'package:flutterdjango/services/remote_services.dart';
import 'package:get/state_manager.dart';
import '../models/academy.dart';

class AcademyController extends GetxController {
  var academyList = <Academy>[].obs;

  @override
  void onInit() {
    fetchAcademys();
    super.onInit();
  }

  void fetchAcademys() async {
    var academys = await RemoteServices.fetchAcademys();
    if (academys != null) {
      academyList.value = academys;
    }
  }
}
