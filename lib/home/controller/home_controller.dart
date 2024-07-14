import 'package:dio/dio.dart';
import 'package:employee_list/home/model/profile_model.dart';
import 'package:employee_list/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeController extends ChangeNotifier {
  late TabController tabController;

  List<ProfileModel> employesList = [];
  Status loader = Status.notStarted;
  Future<List<ProfileModel>> getEmployesList() async {
    loader = Status.loading;

    var dio = Dio();
    var response = await dio.request(
      'https://dummy.restapiexample.com/api/v1/employees',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      final temp = ListProfileModel.fromJson(response.data);
      employesList = temp.data;
      print(employesList);
      notifyListeners();
      loader = Status.success;
    } else {
      loader = Status.error;
      notifyListeners();

      print(response.statusMessage);
    }
    return employesList;
  }

  void switchToProfileTab(ProfileModel Details, context) {
    tabController.animateTo(1);
    Provider.of<ProfileController>(context, listen: false).employeDetails =
        Details;
    notifyListeners();
  }
}

enum Status { loading, success, error, notStarted }
