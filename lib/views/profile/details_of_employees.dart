import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pprab/views/profile/forms/bank_details_form.dart';
import 'package:pprab/views/profile/forms/employee_details_form.dart';
import 'package:pprab/views/profile/forms/list_of_Shareholders.dart';
import 'package:pprab/views/profile/widgets/label.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:pprab/widgets/inputs.dart';
import 'package:pprab/widgets/responsive_table.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/responsive_ui.dart';

class DetailsOfEmployees extends StatefulWidget {
  const DetailsOfEmployees({super.key});

  @override
  State<DetailsOfEmployees> createState() => _DetailsOfEmployeesState();
}

class _DetailsOfEmployeesState extends State<DetailsOfEmployees> {
  late ListOfEmployeesForm form;

  @override
  void didChangeDependencies() {
    form = context.read<ListOfEmployeesForm>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('dd/MM/yyyy');

    return Padding(
      padding: const EdgeInsets.all(34.0),
      child: Wrap(
        spacing: 60,
        runSpacing: 100,
        children: [
          const ProfileLabel(
            title: 'Details of Employess in Botswana',
            icon: FontAwesomeIcons.alignRight,
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Total Number of Employees in Botswana',
              onChanged: form.changeTotalNumberOfBotsswanaEmployees,
              value: form.totalNumberOfBotsswanaEmployees.value,
              errorText: form.totalNumberOfBotsswanaEmployees.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Total Number of other nationalities',
              onChanged: form.changeTotalNumberOfExpatriateEmployees,
              value: form.totalNumberOfExpatriateEmployees.value,
              errorText: form.totalNumberOfExpatriateEmployees.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Total Employed',
              onChanged: form.changeTotalNumberOfEmployees,
              value: form.totalNumberOfEmployees.value,
              errorText: form.totalNumberOfEmployees.error,
            ),
          ),
          ResponsiveTable(
            headers: const [
              'First Name',
              'Middle Name',
              'Last Name',
              'Gender',
              'Date Of Birth',
            ],
            rows: [
              for (EmployeeRow row in form.rows)
                [
                  TextCell(
                    //label: 'Name of Bank',
                    onChanged: row.validateFirstName,
                    value: row.firstName.value,
                    errorText: row.firstName.error,
                    isCell: true,
                  ),
                  TextCell(
                    //label: 'Branch',
                    onChanged: row.validateMiddleName,
                    value: row.middleName.value,
                    errorText: row.middleName.error,
                    isCell: true,
                  ),
                  TextCell(
                    //label: 'Branch',
                    onChanged: row.validateLastName,
                    value: row.lastName.value,
                    errorText: row.lastName.error,
                    isCell: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      icon: SizedBox(),
                      underline: const SizedBox(),
                      focusColor: Colors.white,
                      isExpanded: true,
                      value: row.gender.value,
                      hint: const Text('Gender'),
                      items: const [
                        DropdownMenuItem(
                          value: 'Male',
                          child: Text('Male'),
                        ),
                        DropdownMenuItem(
                          value: 'Female',
                          child: Text('Female'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            row.validateGender(value);
                          });
                        }
                      },
                    ),
                  ),
                  InkWell(
                    child: ListTile(
                      leading: const Icon(
                        FontAwesomeIcons.calendar,
                      ),
                      title: Text(
                        row.dob.value != null
                            ? format.format(DateTime.parse(row.dob.value!))
                            : 'Select Date',
                      ),
                    ),
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1800),
                        lastDate: DateTime(4000),
                      );

                      if (date != null) {
                        setState(() {
                          row.validateDob(date.toIso8601String());
                        });
                      }
                    },
                  ),
                ]
            ],
          ),
          Div(
            divison: const Division(
              colL: 12,
              colM: 12,
              colS: 12,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [FillButton(onPressed: () {}, text: 'Done')],
              ),
            ),
          )
        ],
      ),
    );
  }
}
