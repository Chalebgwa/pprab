import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:pprab/controllers/dashboard_controller.dart';
import 'package:provider/provider.dart';

class ProfileBreadCrumbs extends StatelessWidget {
  ProfileBreadCrumbs({super.key});

  final ScrollController _scrollController = ScrollController();

  List<String> get _breadcrumbs => const [
        'Profile',
        'Company Details',
        'Company Address Details',
        'Primary & Secondary Contacts',
        'Details of Banker',
        'List of Directors',
        'List of Shareholders',
        'Details Of Employees in Botswana',
        'Vehicles and Equipment',
        'Details of Projects',
        'Details of Secretary'
      ];

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DashboardController>();
    return Column(
      children: [
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        BreadCrumb(
          overflow: ScrollableOverflow(
              padding: EdgeInsets.zero, controller: _scrollController),
          items: <BreadCrumbItem>[
            for (var i = 0; i < _breadcrumbs.length; i++)
              BreadCrumbItem(
                content: Text(
                  _breadcrumbs[i],
                  style: TextStyle(
                    color: controller.selectedBreadcrumbIndex == i
                        ? Colors.black
                        : Colors.grey,
                    fontWeight: controller.selectedBreadcrumbIndex == i
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                onTap: () {
                  controller.setSelectedBreadcrumbIndex(i);
                  _scrollController.animateTo(
                    i * 100.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
          ],
          divider: const Icon(Icons.chevron_right),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}
