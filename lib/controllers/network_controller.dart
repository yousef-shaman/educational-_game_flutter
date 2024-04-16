import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

// Network Controller using GetX for state management
class NetworkController extends GetxController {
  var isConnected = false.obs;
  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    // Listen for connectivity changes
    connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
      // Check if there's at least one connectivity result that is not 'none'
      isConnected.value = results.any((result) => result != ConnectivityResult.none);
    });
  }

  @override
  void onClose() {
    // Cancel the connectivity subscription when the controller is closed
    connectivitySubscription.cancel();
    super.onClose();
  }
}