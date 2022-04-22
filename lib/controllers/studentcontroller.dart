import 'package:flutterdjango/services/remote_services.dart';
import 'package:get/state_manager.dart';
import '../models/student.dart';

class StudentController extends GetxController {
  var isLoading = true.obs;
  var studentList = <Student>[].obs;

  @override
  void onInit() {
    fetchStudents();
    super.onInit();
  }

  void fetchStudents() async {
    isLoading(true);
    try {
      var students = await RemoteServices.fetchStudents();
      if (students != null) {
        studentList.value = students;
      }
    } finally {
      isLoading(false);
    }
  }
}
