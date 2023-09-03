import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pprab/api_service/api_request.dart';
import 'package:pprab/models/company_model.dart';
import 'package:pprab/util/dimensions.dart';
import 'package:pprab/util/villages.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:pprab/widgets/result_dialog.dart';
import 'package:responsive_ui/responsive_ui.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  late Map<String, dynamic> data;
  TextEditingController _controller = TextEditingController();

  Future<Map<String, dynamic>?> readJsonFile() async {
    // Replace 'your_json_file.json' with the actual file path.
    final jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/codes.json');

    // Parse the JSON string into a Map.
    final data = json.decode(jsonString) as Map<String, dynamic>;

    return data;
  }

  String? ownershipType;
  List<String> codes = [];
  List<String> subcodes = [];

  String? selectedCode;
  String? selectedSubCode;
  String? selectedLocation;
  String? selectedDemographic;

  List<String> getCodeList() {
    final codes = <String>[];
    for (final category in data['categories'] as List) {
      codes.add("${category['Code']} - ${category['Description']}");
    }
    return codes;
  }

  List<String> getSubCodeList(String code) {
    final subCodes = <String>[];
    for (final category in data['categories'] as List) {
      if ("${category['Code']} - ${category['Description']}" == code) {
        for (final subCode in category['Sub-codes'] as List) {
          subCodes.add("${subCode['Sub-code']} - ${subCode['Description']}");
        }
      }
    }
    return subCodes;
  }

  late ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    readJsonFile().then(
      (value) {
        data = value ?? {};
        if (data.isNotEmpty) {
          setState(() {
            codes = getCodeList();
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isDesktop(context) ? 100 : 40),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            // outlined text field
            Wrap(
              children: [
                Div(
                  divison: const Division(colL: 9, colM: 8, colS: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                        fillColor: HexColor('#E0E0E0'),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        labelText: 'Search',
                        hintText: 'Search',
                        suffixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                Div(
                  divison: const Division(colL: 3, colM: 4, colS: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FillButton(
                      onPressed: () async {
                        final result = await apiService.search(
                          null,
                          selectedCode,
                          selectedSubCode,
                          selectedLocation,
                          selectedDemographic,
                          ownershipType,
                        );

                        if (mounted) {
                          await showDialog<CompanyInfo>(
                            context: context,
                            builder: (context) {
                              return ResultDialog(
                                results: result ?? [],
                              );
                            },
                          );
                        }
                      },
                      text: 'Search',
                    ),
                  ),
                ),
                Div(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 45,
                    ),
                    child: Text(
                      'Select Fields',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Div(
                  divison: const Division(
                    colL: 3,
                    colM: 6,
                    colS: 12,
                  ),
                  child: DropdownWidget(
                    hint: 'Ownership Type',
                    value: ownershipType,
                    onChanged: (p0) {
                      setState(() {
                        ownershipType = p0;
                      });
                    },
                    options: const [
                      "100% Citizen-owned JV's",
                      '100% Citizen-owned associations/Consortia',
                      '100% Citizen-owned Companies',
                      "Majority Citizen-owned JV's",
                      'Majority Citizen -owned associations/consortia',
                      'Majority Citizen -owned companies',
                      "Minority Citizen -owned JV's",
                      'Minority Citizen-owned associations/consortia',
                      'Minority Citizen -owned companies',
                      '100% Foreign-owned Company',
                    ],
                  ),
                ),
                Div(
                  divison: const Division(
                    colL: 3,
                    colM: 6,
                    colS: 12,
                  ),
                  child: DropdownWidget(
                    hint: 'Ownership Type',
                    value: ownershipType,
                    onChanged: (p0) {
                      setState(() {
                        ownershipType = p0;
                      });
                    },
                    options: const [
                      "100% Citizen-owned JV's",
                      '100% Citizen-owned associations/Consortia',
                      '100% Citizen-owned Companies',
                      "Majority Citizen-owned JV's",
                      'Majority Citizen -owned associations/consortia',
                      'Majority Citizen -owned companies',
                      "Minority Citizen -owned JV's",
                      'Minority Citizen-owned associations/consortia',
                      'Minority Citizen -owned companies',
                      '100% Foreign-owned Company',
                    ],
                  ),
                ),
                Div(
                  divison: const Division(
                    colL: 3,
                    colM: 6,
                    colS: 12,
                  ),
                  child: DropdownWidget(
                    hint: 'Location',
                    value: selectedLocation,
                    onChanged: (p0) {
                      setState(() {
                        selectedLocation = p0;
                      });
                    },
                    options: places,
                  ),
                ),
                Div(
                  divison: const Division(
                    colL: 3,
                    colM: 6,
                    colS: 12,
                  ),
                  child: DropdownWidget(
                    hint: 'Codes',
                    value: selectedCode,
                    onChanged: (p0) {
                      setState(() {
                        selectedCode = p0;
                        selectedSubCode = null;
                        if (p0 != null) subcodes = getSubCodeList(p0);
                      });
                    },
                    options: codes,
                  ),
                ),
                if (subcodes.isNotEmpty)
                  Div(
                    divison: const Division(
                      colL: 3,
                      colM: 6,
                      colS: 12,
                    ),
                    child: DropdownWidget(
                      hint: 'Sub Codes',
                      value: selectedSubCode,
                      onChanged: (p0) {
                        setState(() {
                          selectedSubCode = p0;
                        });
                      },
                      options: subcodes,
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({
    required this.hint,
    required this.options,
    required this.value,
    required this.onChanged,
    super.key,
  });
  final String hint;
  final List<String> options;
  final String? value;
  final void Function(String?) onChanged;

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: HexColor('#3D99BE'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.hardEdge,
        child: DropdownButton(
          selectedItemBuilder: (context) {
            return widget.options.map<Widget>((e) {
              return Center(
                child: Text(
                  e,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              );
            }).toList();
          },

          isExpanded: true,
          //isDense: true,
          underline: const SizedBox(),
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          hint: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.hint,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          value: widget.value,
          items: widget.options
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
