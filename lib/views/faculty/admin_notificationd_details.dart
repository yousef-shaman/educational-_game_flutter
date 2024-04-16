import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/widgets/custom_gradient_scaffold.dart';

class NotificationDetails extends StatefulWidget {
  final Map? dataOfRequests;
  const NotificationDetails({super.key, this.dataOfRequests});

  @override
  State<NotificationDetails> createState() => _NotificationDetailsState();
}

class _NotificationDetailsState extends State<NotificationDetails> {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(
        title: const Text('Notification Details'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      'Name : ${widget.dataOfRequests?["name"] ?? 'name not provided'}',
                      style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(height: 20),
                  Text(
                      'Email : ${widget.dataOfRequests?["email"] ?? 'email not provided'}',
                      style: const TextStyle(
                          fontSize: 18, color: Colors.black)),
                  const SizedBox(height: 20),
                  Text(
                      'Phone : ${widget.dataOfRequests?["phone"] ?? 'phone not provided'}',
                      style: const TextStyle(
                          fontSize: 13, color: Colors.black)),
                  Text(
                      'City : ${widget.dataOfRequests?["address"]?["city"] ?? 'City not provided'}',
                      style: const TextStyle(
                          fontSize: 13, color: Colors.black)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle accept action
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text(
                      'Accepted',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Handle reject action
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text('Rejected',
                        style: Theme.of(context).textTheme.labelLarge),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
