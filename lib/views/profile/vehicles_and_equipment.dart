import 'package:flutter/material.dart';
import 'package:pprab/controllers/dashboard_controller.dart';
import 'package:pprab/views/profile/forms/vehicles_and_equipment_form.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:pprab/widgets/inputs.dart';
import 'package:pprab/widgets/responsive_table.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/responsive_ui.dart';

class VehiclesAndEquipmentView extends StatefulWidget {
  const VehiclesAndEquipmentView({super.key});

  @override
  State<VehiclesAndEquipmentView> createState() =>
      _VehiclesAndEquipmentViewState();
}

class _VehiclesAndEquipmentViewState extends State<VehiclesAndEquipmentView> {
  late VehiclesAndEquipmentForm form;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    form = context.read<VehiclesAndEquipmentForm>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Wrap(
        runSpacing: 100,
        spacing: 145,
        children: [
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Values of Total Company Assets In:',
              onChanged: form.validateValueOfTotalCurrentAssets,
              value: form.valueOfTotalCurrentAssets.value,
              errorText: form.valueOfTotalCurrentAssets.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Values of Total Company Assets In:',
              onChanged: form.validateValueOfTotalCurrentAssets,
              value: form.valueOfTotalCurrentAssets.value,
              errorText: form.valueOfTotalCurrentAssets.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label:
                  'Value OF Equipments (Plants, Equipment) excluding Hire Items',
              onChanged: form.validateValueOfEquipments,
              value: form.valueOfEquipments.value,
              errorText: form.valueOfEquipments.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Paid Up Capital',
              onChanged: form.validatePaidUpCapital,
              value: form.paidUpCapital.value,
              errorText: form.paidUpCapital.error,
            ),
          ),
          ResponsiveTable(
            onAdd: () {
              form.addVehicles();
              setState(() {});
            },
            onRemove: () {
              form.removeVehicles(0);
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
              for (Vehicles vehicle in form.vehicles)
                [
                  TextCell(
                    value: vehicle.registeredOwner.value,
                    onChanged: vehicle.validateRegisteredOwner,
                    errorText: vehicle.registeredOwner.error,
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
                    value: vehicle.make.value,
                    onChanged: vehicle.validateMake,
                    errorText: vehicle.make.error,
                  ),
                ]
            ],
          ),
          ResponsiveTable(
            onAdd: () {
              form.addPlantAndEquipment();
              setState(() {});
            },
            onRemove: () {
              form.removePlantAndEquipment(0);
              setState(() {});
            },
            title: 'Plant and Equipment',
            headers: const [
              'Registered Owner',
              'Ownership',
              'Registration No:',
              'Date Of Purchase',
              'Description'
            ],
            rows: [
              for (PlantAndEquipment pe in form.plantAndEquipment)
                [
                  TextCell(
                    value: pe.registeredOwner.value,
                    onChanged: pe.validateRegisteredOwner,
                    errorText: pe.registeredOwner.error,
                  ),
                  DropdownButton<String>(
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
                          pe.validateOwnership(value);
                        });
                      }
                    },
                    value: pe.ownership.value,
                  ),
                  TextCell(
                    value: pe.registrationNumber.value,
                    onChanged: pe.validateRegistrationNumber,
                    errorText: pe.registrationNumber.error,
                  ),
                  CellDate(
                    value: pe.dateOfPurchase.value,
                    onChanged: pe.validateDateOfPurchase,
                    errorText: pe.dateOfPurchase.error,
                  ),
                  TextCell(
                    value: pe.description.value,
                    onChanged: pe.validateDescription,
                    errorText: pe.description.error,
                  ),
                ]
            ],
          ),
          ResponsiveTable(
            onAdd: () {
              form.addBuildingAndProperty();
              setState(() {});
            },
            onRemove: () {
              form.removeBuildingAndProperty(0);
              setState(() {});
            },
            title: 'Plant and Equipment',
            headers: const [
              'Registered Owner',
              'Ownership',
              'Registration No:',
              'Date Of Purchase',
              'Description'
            ],
            rows: [
              for (PlantAndEquipment pe in form.plantAndEquipment)
                [
                  TextCell(
                    value: pe.registeredOwner.value,
                    onChanged: pe.validateRegisteredOwner,
                    errorText: pe.registeredOwner.error,
                  ),
                  DropdownButton<String>(
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
                          pe.validateOwnership(value);
                        });
                      }
                    },
                    value: pe.ownership.value,
                  ),
                  TextCell(
                    value: pe.registrationNumber.value,
                    onChanged: pe.validateRegistrationNumber,
                    errorText: pe.registrationNumber.error,
                  ),
                  CellDate(
                    value: pe.dateOfPurchase.value,
                    onChanged: pe.validateDateOfPurchase,
                    errorText: pe.dateOfPurchase.error,
                  ),
                  TextCell(
                    value: pe.description.value,
                    onChanged: pe.validateDescription,
                    errorText: pe.description.error,
                  ),
                ]
            ],
          ),
          ResponsiveTable(
            onAdd: () {
              form.addBuildingAndProperty();
              setState(() {});
            },
            onRemove: () {
              form.removeBuildingAndProperty(0);
              setState(() {});
            },
            title: 'Building and Property',
            headers: const [
              'Ownership',
              'Locality',
              'Present Value(In BWP',
              'Attachments',
            ],
            rows: [
              for (BuildingAndProperty bp in form.buildingAndProperty)
                [
                  DropdownButton<String>(
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
                          bp.validateOwnership(value);
                        });
                      }
                    },
                    value: bp.ownership.value,
                  ),
                  TextCell(
                    value: bp.locality.value,
                    onChanged: bp.validateLocality,
                    errorText: bp.locality.error,
                  ),
                  CellDate(
                    value: bp.presentValue.value,
                    onChanged: bp.validateValue,
                    errorText: bp.presentValue.error,
                  ),
                  CustomFilePicker(
                    value: bp.attachments.value,
                    onChanged: (v) {
                      setState(() {
                        bp.validateAttachments(v);
                      });
                    },
                  ),
                ]
            ],
          ),
          ResponsiveTable(
            onAdd: () {
              form.addOfficeEquipment();
              setState(() {});
            },
            onRemove: () {
              form.removeOfficeEquipment(0);
              setState(() {});
            },
            title: 'Office Equipment',
            headers: const [
              'Office Equipment',
              'Present Value(In BWP',
              'Attachments',
            ],
            rows: [
              for (OfficeEquipment bp in form.officeEquipment)
                [
                  DropdownButton<String>(
                    underline: const SizedBox(),
                    items: [
                      'Computer',
                      'Printer',
                      'Desk',
                      'Chair',
                      'Telephone',
                      'File Cabinet',
                      'Whiteboard',
                      'Projector',
                      'Fax Machine',
                      'Scanner',
                      'Conference Table',
                      'Office Phone',
                      'Stapler',
                      'Paper Shredder',
                      'Filing Cabinet',
                      'Calculator',
                      'Office Supplies',
                      'Desk Lamp',
                      'Bookshelf',
                      'Photocopier',
                      'Coffee Machine',
                      'Water Cooler',
                      'Conference Phone',
                      'Headset',
                      'Desktop Organizer',
                      'Standing Desk',
                      'Task Chair',
                      'Bulletin Board',
                      'Shredder Machine',
                      'Label Maker',
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
                          bp.validateOfficeEquipment(value);
                        });
                      }
                    },
                    value: bp.officeEquipment.value,
                  ),
                  TextCell(
                    value: bp.presentValue.value,
                    onChanged: bp.validateValue,
                    errorText: bp.presentValue.error,
                  ),
                  CustomFilePicker(
                    value: bp.attachments.value,
                    onChanged: (v) {
                      setState(() {
                        bp.validateAttachments(v);
                      });
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FillButton(
                  onPressed: () {
                    if (form.isValid) {
                      context
                          .read<DashboardController>()
                          .setSelectedBreadcrumbIndex(9);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Vehicles and Equipment form saved'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Please fill all required fields'),
                        ),
                      );
                    }
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
