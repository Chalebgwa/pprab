import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class CustomFilePicker extends StatelessWidget {
  const CustomFilePicker({super.key, this.value, required this.onChanged});
  final Uint8List? value;
  final void Function(Uint8List?) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        final result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: true,
          allowedExtensions: ['pdf'],
        );

        if (result != null) {
          onChanged(result.files.first.bytes);
        }
      },
      leading: const FaIcon(
        FontAwesomeIcons.paperclip,
        color: Colors.black,
      ),
      trailing: value == null
          ? const Icon(Icons.check_circle)
          : const Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
      title: Text(
        value != null ? 'Attached' : 'Attach File',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}

class CustomDate extends StatefulWidget {
  const CustomDate({
    required this.value,
    required this.label,
    required this.onChanged,
    super.key,
    this.errorText,
  });

  final String? value;
  final String label;
  final void Function(String) onChanged;
  final String? errorText;

  @override
  State<CustomDate> createState() => _CustomDateState();
}

class _CustomDateState extends State<CustomDate> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final date = DateTime.tryParse(widget.value ?? '');
    final formatter = DateFormat('dd/MM/yyyy');
    final formatted = date != null ? formatter.format(date) : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        TextFormField(
          controller: controller..text = formatted ?? '',
          readOnly: true,
          onSaved: (value) {
            widget.onChanged(value ?? '');
            setState(() {});
          },
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );

            if (date != null) {
              widget.onChanged(date.toString());
              setState(() {});
            }
          },
          decoration: InputDecoration(
            //labelText: label,

            isDense: true,
            errorText: widget.errorText,
            errorStyle: GoogleFonts.inter(
              color: Colors.red,
            ),
            fillColor: HexColor('#F9F9F9'),
            hintText: 'DD/MM/YYYY',
            hintStyle: GoogleFonts.inter(
              fontSize: 16,
              color: HexColor('#B3B3B3'),
            ),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: const FaIcon(FontAwesomeIcons.calendarAlt),
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );

                if (date != null) {
                  widget.onChanged(date.toString());
                  setState(() {});
                }
              },
            ),
          ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}

class CustomRadio extends StatelessWidget {
  const CustomRadio(
      {required this.options,
      required this.label,
      required this.onChanged,
      super.key,
      this.value});

  final List<String> options;
  final String? value;
  final String label;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: options
              .map(
                (e) => Expanded(
                  child: RadioListTile(
                    value: e,
                    groupValue: value,
                    activeColor: HexColor('#000000'),
                    onChanged: (value) {
                      if (value != null) {
                        onChanged(value);
                      }
                    },
                    title: Text(
                      e,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: HexColor('#000000'),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    required this.options,
    required this.onChanged,
    required this.label,
    super.key,
    this.value,
  });
  final String? value;
  final List<String> options;
  final void Function(String) onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Card(
          color: HexColor('#F9F9F9'),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButton<String?>(
            hint: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Select'),
            ),
            value: value,
            underline: Container(),
            isExpanded: true,
            //alignment: Alignment,

            //padding: EdgeInsets.all(8),
            itemHeight: 54,
            focusColor: HexColor('#F9F9F9'),
            items: options
                .map(
                  (e) => DropdownMenuItem<String?>(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                onChanged(value);
              }
            },
          ),
        )
      ],
    );
  }
}

class CIPAInput extends StatefulWidget {
  const CIPAInput({
    this.obscureText = false,
    super.key,
    this.label,
    this.placeholder,
    this.errorText,
    this.onChanged,
    this.value,
    this.isCell = false,
  });

  final String? label;
  final String? placeholder;
  final String? errorText;
  final bool obscureText;
  final void Function(String)? onChanged;
  final String? value;
  final bool isCell;

  @override
  State<CIPAInput> createState() => _CIPAInputState();
}

class _CIPAInputState extends State<CIPAInput> {
  bool showText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label ?? "",
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        TextFormField(
          initialValue: widget.value,
          onSaved: (value) {
            widget.onChanged?.call(value ?? '');
          },
          decoration: InputDecoration(
            //labelText: label,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                width: 50,
                child: Row(
                  children: [
                    Text(
                      "BW",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: HexColor('#000000'),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 2,
                      height: 20,
                      color: HexColor('#000000'),
                    ),
                  ],
                ),
              ),
            ),
            isDense: true,
            errorText: widget.errorText,
            errorStyle: GoogleFonts.inter(
              color: Colors.red,
            ),
            fillColor: HexColor('#F9F9F9'),
            hintText: widget.placeholder,
            hintStyle: GoogleFonts.inter(
              fontSize: 16,
              color: HexColor('#B3B3B3'),
            ),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: FaIcon(showText
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash),
                    onPressed: () {
                      setState(() {
                        showText = !showText;
                      });
                    },
                  )
                : null,
          ),
          obscureText: widget.obscureText && showText,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}

class TextInput extends StatefulWidget {
  const TextInput({
    this.obscureText = false,
    super.key,
    this.label,
    this.placeholder,
    this.errorText,
    this.onChanged,
    this.value,
    this.isCell = false,
  });

  final String? label;
  final String? placeholder;
  final String? errorText;
  final bool obscureText;
  final void Function(String)? onChanged;
  final String? value;
  final bool isCell;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool showText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label ?? "",
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        TextFormField(
          initialValue: widget.value,
          onSaved: (value) {
            widget.onChanged?.call(value ?? '');
          },
          decoration: InputDecoration(
            //labelText: label,

            isDense: true,
            errorText: widget.errorText,
            errorStyle: GoogleFonts.inter(
              color: Colors.red,
            ),
            fillColor: HexColor('#F9F9F9'),
            hintText: widget.placeholder,
            hintStyle: GoogleFonts.inter(
              fontSize: 16,
              color: HexColor('#B3B3B3'),
            ),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: FaIcon(showText
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash),
                    onPressed: () {
                      setState(() {
                        showText = !showText;
                      });
                    },
                  )
                : null,
          ),
          obscureText: widget.obscureText && showText,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}

class TextCell extends StatefulWidget {
  const TextCell({
    this.obscureText = false,
    super.key,
    this.label,
    this.placeholder,
    this.errorText,
    this.onChanged,
    this.value,
    this.isCell = false,
  });

  final String? label;
  final String? placeholder;
  final String? errorText;
  final bool obscureText;
  final void Function(String)? onChanged;
  final String? value;
  final bool isCell;

  @override
  State<TextCell> createState() => _TextCellState();
}

class _TextCellState extends State<TextCell> {
  bool showText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.value,
      onSaved: (value) {
        widget.onChanged?.call(value ?? '');
      },
      decoration: InputDecoration(
        //labelText: label,

        isDense: true,
        errorText: widget.errorText,
        errorStyle: GoogleFonts.inter(
          color: Colors.red,
        ),
        fillColor: HexColor('#F9F9F9'),
        hintText: widget.placeholder,
        hintStyle: GoogleFonts.inter(
          fontSize: 16,
          color: HexColor('#B3B3B3'),
        ),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: FaIcon(showText
                    ? FontAwesomeIcons.eye
                    : FontAwesomeIcons.eyeSlash),
                onPressed: () {
                  setState(() {
                    showText = !showText;
                  });
                },
              )
            : null,
      ),
      obscureText: widget.obscureText && showText,
      onChanged: (v) {
        setState(() {
          widget.onChanged?.call(v);
        });
      },
    );
  }
}

class CellDate extends StatefulWidget {
  const CellDate({
    required this.value,
    required this.onChanged,
    super.key,
    this.errorText,
  });

  final String? value;
  final void Function(String) onChanged;
  final String? errorText;

  @override
  State<CellDate> createState() => _CellDateState();
}

class _CellDateState extends State<CellDate> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final date = DateTime.tryParse(widget.value ?? '');
    final formatter = DateFormat('dd/MM/yyyy');
    final formatted = date != null ? formatter.format(date) : null;

    return TextFormField(
      controller: controller..text = formatted ?? '',
      readOnly: true,
      onSaved: (value) {
        widget.onChanged(value ?? '');
        setState(() {});
      },
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (date != null) {
          widget.onChanged(date.toString());
          setState(() {});
        }
      },
      decoration: InputDecoration(
        //labelText: label,

        isDense: true,
        errorText: widget.errorText,
        errorStyle: GoogleFonts.inter(
          color: Colors.red,
        ),
        fillColor: HexColor('#F9F9F9'),
        hintText: 'DD/MM/YYYY',
        hintStyle: GoogleFonts.inter(
          fontSize: 16,
          color: HexColor('#B3B3B3'),
        ),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: const FaIcon(FontAwesomeIcons.calendarAlt),
          onPressed: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );

            if (date != null) {
              widget.onChanged(date.toString());
              setState(() {});
            }
          },
        ),
      ),
      onChanged: widget.onChanged,
    );
  }
}
