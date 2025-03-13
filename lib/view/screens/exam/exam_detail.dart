import 'package:erp_school/utils/styles.dart';
import 'package:erp_school/view/base/custom_appbar.dart';
import 'package:erp_school/view/base/custom_button.dart';
import 'package:erp_school/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamDetailsScreen extends StatelessWidget {
  final bool student;
  const ExamDetailsScreen({super.key, this.student = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: CustomAppBar(
        title: 'exam_detail'.tr,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Information
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sub: Science",
                    style: interMedium.copyWith(
                        fontSize: 14, color: Theme.of(context).disabledColor)),
                Text("M.M : 30",
                    style: interMedium.copyWith(
                        fontSize: 14, color: Theme.of(context).disabledColor)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("📅 Submitted On 18 Nov, 2024",
                    style: interMedium.copyWith(
                        fontSize: 12, color: Theme.of(context).primaryColor)),
                Text("Questions: 10",
                    style: interMedium.copyWith(
                        fontSize: 12, color: Theme.of(context).disabledColor)),
              ],
            ),

            SizedBox(height: 16),
            // Title
            Text("Science Midterm Examination",
                style: interMedium.copyWith(
                    fontSize: 16, color: Theme.of(context).disabledColor)),
            SizedBox(height: 8),
            Text(
                "Read each question carefully before selecting an answer. "
                    "Select the correct option (only one answer per question).",
                style: interRegular.copyWith(
                    fontSize: 14, color: Theme.of(context).hintColor)),
            SizedBox(height: 16),
            // Questions
            QuestionWidget(
              question:
              "1. What is the primary gas responsible for the greenhouse effect?",
              options: ["Carbon Dioxide", "Oxygen", "Nitrogen", "Methane"],
              selectedOption: 0,
            ),
            Divider(
              height: 32,
              color: Theme.of(context).hintColor,
            ),
            QuestionWidget(
              question:
              "2. Which part of the cell is responsible for generating energy?",
              options: ["Nucleus", "Ribosome", "Mitochondria", "Cell Membrane"],
              selectedOption: null,
            ),
            Divider(
              height: 32,
              color: Theme.of(context).hintColor,
            ),
            QuestionWidget(
              question:
              "3. Which process in plants converts sunlight into chemical energy, "
                  "using carbon dioxide and water to produce glucose and oxygen, "
                  "vital for the plant's survival and growth?",
              options: [
                "Respiration: The process of breaking down glucose in cells to release energy.",
                "Photosynthesis: The process by which plants use sunlight, water, "
                    "and carbon dioxide to create glucose and release oxygen.",
                "Transpiration: The release of water vapor from the plant's surface, mainly through stomata.",
                "Fermentation: The anaerobic process of breaking down sugars to produce energy, "
                    "typically in microorganisms.",
              ],
              selectedOption: null,
            ),
            const SizedBox(height: 70),
            CustomButton(
                height: 50,
                fontSize: 16,
                color: true,
                radius: 50,
                title: student ? 'submit_exam'.tr : 'edit_exam'.tr,
                onPressed: () {
                  if(student) {
                    Get.off( DashboardScreen());
                  }else{
                    // Add your edit exam logic here
                  }
                }),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  final String question;
  final List<String> options;
  final int? selectedOption;

  QuestionWidget({
    required this.question,
    required this.options,
    this.selectedOption,
  });

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.question,
            style: interMedium.copyWith(
                fontSize: 16, color: Theme.of(context).disabledColor)),
        SizedBox(height: 8),
        ...widget.options.asMap().entries.map((entry) {
          int idx = entry.key;
          String option = entry.value;

          return Row(
            children: [
              Theme(
                data: ThemeData(
                  unselectedWidgetColor: Theme.of(context).hintColor,
                ),
                child: Radio<int>(
                  activeColor: Theme.of(context).disabledColor,
                  value: idx,
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Text(
                  option,
                  style: interMedium.copyWith(
                    fontSize: 16,
                    color: _selectedOption == idx
                        ? Theme.of(context).disabledColor
                        : Theme.of(context).hintColor,
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ],
    );
  }
}
