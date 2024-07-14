import 'package:employee_list/utils/const/space_helpper.dart';
import 'package:employee_list/utils/const/text_style.dart';
import 'package:employee_list/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String gender = 'Male';

  DateTime selectedDate = DateTime(1995, 3, 15);

  String weightUnit = 'Select unit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Profile'),
            backgroundColor: Colors.blue,
            leading:
                IconButton(icon: Icon(Icons.arrow_back), onPressed: () {})),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              color: const Color.fromARGB(255, 162, 157, 209),
              width: double.infinity,
              height: 150,
              child: CustomPaint(painter: BrathPainter())),
          Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                  child: Column(children: [
                CustomTextFormField(
                  hintText: 'Number',
                ),
                vSpaceMedium,
                CustomTextFormField(hintText: 'Date of Birth'),
                vSpaceMedium,
                DropdownButtonFormField<String>(
                    value: weightUnit,
                    decoration: InputDecoration(
                      hintText: "hintText",
                      filled: true,
                      fillColor: const Color.fromARGB(255, 238, 237, 237),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    items: <String>['Select unit', 'Kg', 'Lbs']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        weightUnit = newValue!;
                      });
                    })
              ]))),
          ElevatedButton(
              onPressed: () {},
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                  // primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15)))
        ])));
  }
}

class BrathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height * 0.75)
      ..quadraticBezierTo(
          size.width * 0.5, size.height, size.width, size.height * 0.75)
      ..quadraticBezierTo(size.width * 0.6, 20, size.width, size.height * 0.75)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
