import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project_flutter/services/api_service.dart';
import 'package:graduation_project_flutter/controllers/network_controller.dart';
import 'package:graduation_project_flutter/views/faculty/admin_notificationd_details.dart';
import 'package:graduation_project_flutter/widgets/gradient_scaffold.dart';
import 'package:graduation_project_flutter/widgets/network_aware.dart';

class AdminNotifications extends StatelessWidget {
  AdminNotifications({super.key});

  final NetworkController networkController = Get.put(NetworkController());
  final APIService apiService = APIService();

  Future<List<dynamic>> _fetchData() async {
    return await apiService.getRequestsData().timeout(
      const Duration(seconds: 6),
      onTimeout: () {
        throw TimeoutException('Failed to load data within the defined duration.');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Using the custom NetworkAwareWidget
    return GradientScaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: NetworkAwareWidget<List<dynamic>>(
        fetchData: _fetchData,
        dataBuilder: (BuildContext context, List<dynamic>? data) {
          // Custom builder function to handle your data and return appropriate widget
          if (data == null) {
            return const Center(child: Text('No data available.'));
          }
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              var item = data[index];
              return ListTile(
                leading: const Icon(Icons.person_add, color: Colors.amber, size: 50,),
                title: Text(item['name'], style: const TextStyle(color: Colors.black),),
                subtitle: Text(item['email'], style: const TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NotificationDetails(dataOfRequests: item),
                  ));
                },
              );
            },
          );
        },
      ),
    );
  }
}
