import 'package:flutterdjango/services/remote_services.dart';
import 'package:get/state_manager.dart';
import '../models/teacher.dart';

class TeacherController extends GetxController {
  var isLoading = true.obs;
  var teacherList = <Teacher>[].obs;

  @override
  void onInit() {
    fetchTeachers();
    super.onInit();
  }

  void fetchTeachers() async {
    isLoading(true);
    try {
      var teachers = await RemoteServices.fetchTeachers();
      if (teachers != null) {
        teacherList.value = teachers;
      }
    } finally {
      isLoading(false);
    }
  }
}
