import 'package:flutter/material.dart';
import 'package:pprab/controllers/dashboard_controller.dart';
import 'package:pprab/views/profile/forms/vehicles_and_equipment_form.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:pprab/widgets/inputs.dart';
import 'package:pprab/widgets/responsive_table.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/responsive_ui.dart';

import 'forms/details_of_projects.dart';

class DetailsOfProjects extends StatefulWidget {
  const DetailsOfProjects({super.key});

  @override
  State<DetailsOfProjects> createState() => _DetailsOfProjectsState();
}

class _DetailsOfProjectsState extends State<DetailsOfProjects> {
  late DetailsOfProjectsForm form;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    form = context.read<DetailsOfProjectsForm>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Wrap(
        runSpacing: 100,
        spacing: 145,
        children: [
          ResponsiveTable(
            onAdd: () {
              form.addRow();
              setState(() {});
            },
            onRemove: () {
              form.removeRow(0);
              setState(() {});
            },
            title: 'Vehicles',
            headers: const [
              'Registered Owner',
              'Ownership',
              'Registration No:',
              'Date Of Registration',
              'Vehicle Make/ Model'
            ],
            rows: [
              for (RowOfProject vehicle in form.rows)
                [
                  TextCell(
                    value: vehicle.projectName.value,
                    onChanged: vehicle.validateProjectName,
                    errorText: vehicle.projectName.error,
                  ),
                  DropdownButton(
                    underline: const SizedBox(),
                    items: [
                      'Sole Ownership',
                      'Joint Ownership',
                      'Co-ownership',
                      'Corporate Ownership',
                      'Leased Ownership',
                      'Financed Ownership',
                      'Fleet Ownership',
                      'Government Ownership',
                      'Rental Ownership',
                      'Family Ownership',
                      'Trust Ownership',
                      'Community Ownership',
                      'Non-Profit Ownership',
                      'Municipal Ownership',
                      'Partnership Ownership',
                    ]
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          vehicle.validateOwnership(value);
                        });
                      }
                    },
                    value: vehicle.ownership.value,
                  ),
                  TextCell(
                    value: vehicle.registrationNumber.value,
                    onChanged: vehicle.validateRegistrationNumber,
                    errorText: vehicle.registrationNumber.error,
                  ),
                  CellDate(
                    value: vehicle.dateOfRegistration.value,
                    onChanged: vehicle.validateDateOfRegistration,
                    errorText: vehicle.dateOfRegistration.error,
                  ),
                  TextCell(
                    value: vehicle.vehicleMake.value,
                    onChanged: vehicle.validateVehicleMake,
                    errorText: vehicle.vehicleMake.error,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FillButton(
                  onPressed: () {
                    if (form.isValid) {
                      context
                          .read<DashboardController>()
                          .setSelectedBreadcrumbIndex(10);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Form Submitted'),
                        ),
                      );
                    } else
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Please fill all the fields'),
                        ),
                      );
                  },
                  text: 'Done',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
