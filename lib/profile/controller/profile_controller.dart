import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:employee_list/home/controller/home_controller.dart';
import 'package:employee_list/home/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileController extends ChangeNotifier {
  ProfileModel? employeDetails;
  Status loader = Status.notStarted;
  String gender = 'Male';
  final ageController = TextEditingController();
  final salaryController = TextEditingController();
  final idController = TextEditingController();
  final nameController = TextEditingController();
  bool toggler = true;
  void onFlipCardPressed(bool value) {
    toggler = value;
    notifyListeners();
    if (employeDetails != null) {
      assignetoController(employeDetails!);
    }
  }

  selectGender(value) {
    gender = value;
    notifyListeners();
  }

  assignetoController(ProfileModel currentemployeDetails) {
    ageController.text = currentemployeDetails.employeeAge.toString();
    salaryController.text = currentemployeDetails.employeeSalary.toString();
    idController.text = currentemployeDetails.id.toString();
    nameController.text = currentemployeDetails.employeeName.toString();
  }

  clearController() {
    ageController.clear();
    salaryController.clear();
    idController.clear();
    nameController.clear();
  }

  addNewEmploye(context) async {
    print("SAMPLE TEXT");
    loader = Status.loading;
    notifyListeners();
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode({
      "id": idController.text,
      "employee_name": nameController.text,
      "employee_salary": salaryController.text,
      "employee_age": ageController.text,
      "profile_image": ""
    });
    var dio = Dio();
    var response = await dio.request(
      'https://dummy.restapiexample.com/api/v1/create',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New Employe added successfully')),
      );
      clearController();
      loader = Status.success;
      Provider.of<HomeController>(context, listen: false).getEmployesList();
      print(json.encode(response.data));
    } else {
      loader = Status.error;
      print(response.statusMessage);
    }
    notifyListeners();
  }

  deletUser(index, context) async {
    var dio = Dio();
    var response = await dio.request(
      'https://dummy.restapiexample.com/public/api/v1/delete/$index',
      options: Options(
        method: 'DELETE',
      ),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));

      Provider.of<HomeController>(context, listen: false)
          .employesList
          .removeAt(index);
    } else {
      print(response.statusMessage);
    }
  }
}
