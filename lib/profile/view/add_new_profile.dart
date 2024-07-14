import 'package:employee_list/home/controller/home_controller.dart';
import 'package:employee_list/profile/controller/profile_controller.dart';
import 'package:employee_list/utils/const/space_helpper.dart';
import 'package:employee_list/utils/const/text_style.dart';
import 'package:employee_list/utils/widgets/button.dart';
import 'package:employee_list/utils/widgets/custom_progress_bar.dart';
import 'package:employee_list/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewProfile extends StatefulWidget {
  AddNewProfile({super.key});

  @override
  State<AddNewProfile> createState() => _AddNewProfileState();
}

class _AddNewProfileState extends State<AddNewProfile> {
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProfileController>(context, listen: false).clearController();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(
        builder: (context, profileController, _) {
      // profileController.clearController();
      return Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                vSpaceRegular, vSpaceXl,
                const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            NetworkImage('https://i.imgur.com/QCNbOAo.png'),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.blue,
                            child:
                                Icon(Icons.edit, size: 15, color: Colors.white),
                          ),
                        ),
                      ),
                    ]),
                vSpaceMedium,
                CustomTextFormField(
                  validator: (p0) {
                    if (p0 != null && p0.isEmpty) {
                      return 'Name is required';
                    } else {
                      return null;
                    }
                  },
                  color: const Color.fromARGB(255, 211, 208, 249),
                  hintText: 'Name',
                  controller: profileController.nameController,
                ),
                vSpaceMedium,
                CustomTextFormField(
                  keyboardType: TextInputType.number,
                  validator: (p0) {
                    if (p0 != null && p0.isEmpty) {
                      return 'Id is required';
                    } else {
                      return null;
                    }
                  },
                  color: const Color.fromARGB(255, 211, 208, 249),
                  hintText: 'ID',
                  controller: profileController.idController,
                ),
                vSpaceMedium,
                CustomTextFormField(
                  keyboardType: TextInputType.number,
                  validator: (p0) {
                    if (p0 != null && p0.isEmpty) {
                      return 'Salary is required';
                    } else {
                      return null;
                    }
                  },
                  color: const Color.fromARGB(255, 211, 208, 249),
                  hintText: 'Salary',
                  controller: profileController.salaryController,
                ),

                vSpaceMedium,
                CustomTextFormField(
                  keyboardType: TextInputType.number,
                  validator: (p0) {
                    if (p0 != null && p0.isEmpty) {
                      return 'age is required';
                    } else {
                      return null;
                    }
                  },
                  color: const Color.fromARGB(255, 211, 208, 249),
                  hintText: 'Age',
                  controller: profileController.ageController,
                ),
                // vSpaceMedium,
                // CustomTextFormField(
                //     color: const Color.fromARGB(255, 211, 208, 249),
                //     hintText: 'Title'),
                // vSpaceMedium,
                // CustomTextFormField(
                //     color: const Color.fromARGB(255, 211, 208, 249),
                //     hintText: 'Feed back'),
                vSpaceMedium,
                Center(
                    child: profileController.loader == Status.loading
                        ? CustomProgressBar()
                        : PrimaryButton(
                            title: "Save",
                            onTap: () {
                              print(formkey.currentState!.validate());
                              if (formkey.currentState!.validate()) {
                                profileController.addNewEmploye(context);
                              } else {
                                print("else case");
                              }
                            }))
              ])),
        ),
      );
    });
  }
}
