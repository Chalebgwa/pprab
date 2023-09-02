import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pprab/views/profile/forms/bank_details_form.dart';
import 'package:pprab/views/profile/forms/list_of_directors.dart';
import 'package:pprab/views/profile/widgets/label.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:pprab/widgets/inputs.dart';
import 'package:pprab/widgets/responsive_table.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/responsive_ui.dart';

class ListOfDirectors extends StatefulWidget {
  const ListOfDirectors({super.key});

  @override
  State<ListOfDirectors> createState() => _ListOfDirectorsState();
}

class _ListOfDirectorsState extends State<ListOfDirectors> {
  late ListOfDirectorsForm form;

  @override
  void didChangeDependencies() {
    form = context.read<ListOfDirectorsForm>();
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
            title: 'List Of Directors',
            icon: FontAwesomeIcons.creditCard,
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
              for (DirectorRow row in form.rows)
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
