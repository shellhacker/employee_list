import 'package:employee_list/utils/const/colors.dart';
import 'package:employee_list/utils/const/space_helpper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../utils/const/text_style.dart';
import '../../utils/widgets/button.dart';
import '../../utils/widgets/custom_text_field.dart';
import '../controller/profile_controller.dart';
import '../widget/profile_flip_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: Consumer<ProfileController>(
            builder: (context, profilrController, _) {
          return SingleChildScrollView(
              child: profilrController.employeDetails == null
                  ? Center(
                      child: Text("Select an Employee"),
                    )
                  : Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColor.primaryCOlor,
                                Color.fromRGBO(234, 232, 254, 1)
                              ]),
                          // color: Color.fromRGBO(234, 232, 254, 1),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Column(children: [
                        vSpaceXl,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: FlipCard(
                            backCard: SingleChildScrollView(
                                child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height /
                                        1.2,
                                    decoration: const BoxDecoration(
                                        color: Color.fromRGBO(234, 232, 254, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: SingleChildScrollView(
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                              vSpaceRegular,
                                              Row(children: [
                                                const CircleAvatar(
                                                  radius: 50,
                                                  backgroundImage: NetworkImage(
                                                      'https://i.imgur.com/QCNbOAo.png'),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor:
                                                          Colors.blue,
                                                      child: Icon(Icons.edit,
                                                          size: 15,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                const Spacer(),
                                                Switch(
                                                    activeThumbImage:
                                                        const NetworkImage(
                                                            'https://lists.gnu.org/archive/html/emacs-devel/2015-10/pngR9b4lzUy39.png'),
                                                    inactiveThumbImage:
                                                        const NetworkImage(
                                                            'http://wolfrosch.com/_img/works/goodies/icon/vim@2x'),
                                                    value: profilrController
                                                        .toggler,
                                                    onChanged: (bool) {
                                                      profilrController
                                                          .onFlipCardPressed(
                                                              bool);
                                                    })
                                              ]),
                                              vSpaceMedium,
                                              vSpaceXl,
                                              CustomTextFormField(
                                                controller: profilrController
                                                    .nameController,
                                                color: const Color.fromARGB(
                                                    255, 211, 208, 249),
                                                hintText: 'Name',
                                              ),
                                              // vSpaceMedium,
                                              // CustomTextFormField(
                                              //     color: const Color.fromARGB(
                                              //         255, 211, 208, 249),
                                              //     hintText: "Number"),
                                              vSpaceMedium,
                                              CustomTextFormField(
                                                  controller: profilrController
                                                      .ageController,
                                                  color: const Color.fromARGB(
                                                      255, 211, 208, 249),
                                                  hintText: "Age"),
                                              vSpaceMedium,
                                              CustomTextFormField(
                                                  controller: profilrController
                                                      .salaryController,
                                                  color: const Color.fromARGB(
                                                      255, 211, 208, 249),
                                                  hintText: 'Salary'),
                                              vSpaceMedium,
                                              Center(
                                                  child: PrimaryButton(
                                                      title: "DONE",
                                                      onTap: () {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        'Editing is Not Available Now')));
                                                      }))
                                            ]))))),
                            toggler: profilrController.toggler,
                            frontCard: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 1.2,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(234, 232, 254, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Stack(
                                children: [
                                  Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      decoration: const BoxDecoration(
                                          color: AppColor.primaryCOlor,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft:
                                                  Radius.elliptical(50, 50),
                                              bottomRight:
                                                  Radius.elliptical(50, 50),
                                              topRight: Radius.circular(30),
                                              topLeft: Radius.circular(30))),
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: SizedBox(
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                    vSpaceMediumUp,
                                                    Row(children: [
                                                      const Text("welcome",
                                                          style:
                                                              AppText.h4White),
                                                      const Spacer(),
                                                      Switch(
                                                          activeThumbImage:
                                                              const NetworkImage(
                                                                  'https://lists.gnu.org/archive/html/emacs-devel/2015-10/pngR9b4lzUy39.png'),
                                                          inactiveThumbImage:
                                                              const NetworkImage(
                                                                  'http://wolfrosch.com/_img/works/goodies/icon/vim@2x'),
                                                          value:
                                                              profilrController
                                                                  .toggler,
                                                          onChanged: (bool) {
                                                            profilrController
                                                                .onFlipCardPressed(
                                                                    bool);
                                                          })
                                                    ]),
                                                    Text(
                                                      profilrController
                                                              .employeDetails
                                                              ?.employeeName ??
                                                          "",
                                                      style: AppText.h1White,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 5,
                                                    )
                                                  ]))),
                                        ],
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: SizedBox(
                                      // height: MediaQuery.of(context).size.height,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 200.0),
                                          Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30))),
                                            height: 500,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Padding(
                                              padding: EdgeInsets.all(14),
                                              child: Column(
                                                children: [
                                                  vSpaceMedium,
                                                  DetalsRow(
                                                      title: "ID:",
                                                      details: profilrController
                                                              .employeDetails
                                                              ?.id ??
                                                          ""),
                                                  vSpaceMedium,
                                                  DetalsRow(
                                                      title: "AGE:",
                                                      details: profilrController
                                                              .employeDetails
                                                              ?.employeeAge ??
                                                          ""),
                                                  vSpaceMedium,
                                                  DetalsRow(
                                                      title: "Salary:",
                                                      details: profilrController
                                                              .employeDetails
                                                              ?.employeeSalary ??
                                                          ""),
                                                  vSpaceMedium,
                                                  DetalsRow(
                                                    title: "About You:",
                                                    details:
                                                        "This is an common demo content. it will bee same for employes",
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ])));
        }));
  }
}

class DetalsRow extends StatelessWidget {
  const DetalsRow({super.key, required this.title, required this.details});
  final title;
  final details;
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment:
      //     MainAxisAlignment.end,
      children: [
        Text(
          title,
          style: AppText.h4Black,
        ),
        hSpaceMedium,
        Expanded(
          child: Text(
            details.toString(),
            style: AppText.h6Black,
            // maxLines: 10,
          ),
        ),
      ],
    );
  }
}
