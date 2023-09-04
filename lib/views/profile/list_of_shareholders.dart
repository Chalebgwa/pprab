import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pprab/controllers/dashboard_controller.dart';
import 'package:pprab/views/profile/forms/bank_details_form.dart';
import 'package:pprab/views/profile/forms/list_of_Shareholders.dart';
import 'package:pprab/views/profile/widgets/label.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:pprab/widgets/inputs.dart';
import 'package:pprab/widgets/responsive_table.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/responsive_ui.dart';

class ListOfShareholders extends StatefulWidget {
  const ListOfShareholders({super.key});

  @override
  State<ListOfShareholders> createState() => _ListOfShareholdersState();
}

class _ListOfShareholdersState extends State<ListOfShareholders> {
  late ListOfshareHoldersForm form;

  @override
  void didChangeDependencies() {
    form = context.read<ListOfshareHoldersForm>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('dd/MM/yyyy');

    return Padding(
      padding: const EdgeInsets.all(34.0),
      child: Wrap(
        children: [
          const ProfileLabel(
            title: 'List Of Shareholders',
            icon: FontAwesomeIcons.creditCard,
          ),
          ResponsiveTable(
            onAdd: () {
              form.addRow();
              setState(() {});
            },
            onRemove: () {
              form.removeRow(0);
              setState(() {});
            },
            headers: const [
              'First Name',
              'Middle Name',
              'Last Name',
              'Gender',
              'Date Of Birth',
            ],
            rows: [
              for (shareHolderRow row in form.rows)
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
                children: [
                  FillButton(
                      onPressed: () {
                        if (form.isValid) {
                          context
                              .read<DashboardController>()
                              .setSelectedBreadcrumbIndex(7);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              content: Text('Profile Updated Successfully'),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Please fill all the fields'),
                            ),
                          );
                        }
                      },
                      text: 'Done')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
