import 'package:flutter/material.dart';
import 'package:pprab/models/client_model.dart';

class ContractorTile extends StatelessWidget {
  const ContractorTile({super.key, required this.contractor});

  final Client contractor;

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(Icons.person),
      title: Text('Contractor'),
      subtitle: Text('Contractor'),
    );
  }
}
