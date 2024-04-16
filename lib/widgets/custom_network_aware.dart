import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project_flutter/controllers/network_controller.dart';

// Define a type alias for a function that builds widgets from data
typedef DataWidgetBuilder<T> = Widget Function(BuildContext context, T data);

class NetworkAwareWidget<T> extends StatelessWidget {
  final Future<T> Function() fetchData;
  final DataWidgetBuilder<T> dataBuilder;

  const NetworkAwareWidget({
    super.key,
    required this.fetchData,
    required this.dataBuilder,
  });

  @override
  Widget build(BuildContext context) {
    // Access the NetworkController
    final NetworkController networkController = Get.find<NetworkController>();

    // Observe the connection status using GetX's Obx widget
    return Obx(() {
      if (networkController.isConnected.value) {
        return DataBuilderWidget<T>(
          future: fetchData(),
          dataBuilder: (context, data) => data != null ? dataBuilder(context, data) : const Center(child: Text('No data found')),
        );
      } else {
        // Show a message when there's no internet connection
        return Center(child: Text('No Internet Connection', style: Theme.of(context).textTheme.displayLarge,));
      }
    });
  }
}

class DataBuilderWidget<T> extends StatelessWidget {
  final Future<T> future;
  final DataWidgetBuilder<T> dataBuilder;

  const DataBuilderWidget({
    super.key,
    required this.future,
    required this.dataBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return dataBuilder(context, snapshot.data!);
        } else {
          return const Center(child: Text('No data found'));
        }
      },
    );
  }
}
