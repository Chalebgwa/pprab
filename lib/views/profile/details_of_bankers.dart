import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pprab/views/profile/forms/bank_details_form.dart';
import 'package:pprab/views/profile/widgets/label.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:pprab/widgets/inputs.dart';
import 'package:pprab/widgets/responsive_table.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/responsive_ui.dart';

class DetailsOfBankers extends StatefulWidget {
  const DetailsOfBankers({super.key});

  @override
  State<DetailsOfBankers> createState() => _DetailsOfBankersState();
}

class _DetailsOfBankersState extends State<DetailsOfBankers> {
  late BankDetailsForm form;

  @override
  void didChangeDependencies() {
    form = context.read<BankDetailsForm>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(34.0),
      child: Wrap(
        children: [
          const ProfileLabel(
            title: 'Details Of Banker',
            icon: FontAwesomeIcons.creditCard,
          ),
          ResponsiveTable(
            headers: const [
              'Name of Bank',
              'Branch',
              'Branch Address',
              'Account Number',
              'Account Type',
            ],
            rows: [
              for (BankDetailsRow row in form.rows)
                [
                  TextCell(
                    //label: 'Name of Bank',
                    onChanged: row.changeNameOfBank,
                    value: row.nameOfBank.value,
                    errorText: row.nameOfBank.error,
                    isCell: true,
                  ),
                  TextCell(
                    //label: 'Branch',
                    onChanged: row.changeBranch,
                    value: row.branch.value,
                    errorText: row.branch.error,
                    isCell: true,
                  ),
                  TextCell(
                    //label: 'Branch',
                    onChanged: row.changeAddress,
                    value: row.address.value,
                    errorText: row.address.error,
                    isCell: true,
                  ),
                  TextCell(
                    //label: 'Account Number',
                    onChanged: row.changeAccountNumber,
                    value: row.accountNumber.value,
                    errorText: row.accountNumber.error,
                    isCell: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      icon: SizedBox(),
                      underline: const SizedBox(),
                      focusColor: Colors.white,
                      isExpanded: true,
                      value: row.accountType.value,
                      hint: const Text('Account Type'),
                      items: const [
                        DropdownMenuItem(
                          value: 'Saving',
                          child: Text('Saving'),
                        ),
                        DropdownMenuItem(
                          value: 'Current',
                          child: Text('Current'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null)
                          setState(() {
                            row.changeAccountType(value);
                          });
                        ;
                      },
                    ),
                  )
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
