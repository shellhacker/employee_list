import 'package:employee_list/home/controller/home_controller.dart';
import 'package:employee_list/profile/controller/profile_controller.dart';
import 'package:employee_list/utils/const/text_style.dart';
import 'package:employee_list/utils/widgets/custom_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridviewWidget extends StatefulWidget {
  const GridviewWidget({
    super.key,
  });

  @override
  State<GridviewWidget> createState() => _GridviewWidgetState();
}

class _GridviewWidgetState extends State<GridviewWidget> {
  @override
  void initState() {
    super.initState();
    final controller = Provider.of<HomeController>(context, listen: false);

    if (controller.employesList.isEmpty) {
      controller.getEmployesList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, controller, _) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: controller.loader == Status.error
            ? const Center(child: Text("Something wrong. Try again"))
            : controller.loader == Status.loading
                ? const CustomProgressBar()
                : SizedBox(
                    child: controller.employesList.isNotEmpty
                        ? GridView.builder(
                            itemCount: controller.employesList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 4.0,
                                    mainAxisSpacing: 4.0),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  controller.switchToProfileTab(
                                      controller.employesList[index], context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color:
                                          Color.fromARGB(255, 202, 197, 248)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Are you Sure?'),
                                                        content: Text(
                                                            'You want to delete the employe'),
                                                        actions: [
                                                          ElevatedButton(
                                                            // textColor:
                                                            //     Colors.black,
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child:
                                                                Text('CANCEL'),
                                                          ),
                                                          ElevatedButton(
                                                            // textColor:
                                                            //     Colors.black,
                                                            onPressed: () {
                                                              Provider.of<ProfileController>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .deletUser(
                                                                      index,
                                                                      context);
                                                            },
                                                            child: Text('YES'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                // ignore: prefer_const_constructors
                                                icon: Icon(Icons.delete,
                                                    size: 18))
                                          ]),
                                      const CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              'https://i.imgur.com/QCNbOAo.png')),
                                      // const SizedBox(height: 5),
                                      Text(
                                        controller
                                            .employesList[index].employeeName,
                                        style: AppText.h1Black,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })
                        : const Center(child: Text("List is Empty")),
                  ),
      );
    });
  }
}
