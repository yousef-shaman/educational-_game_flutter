import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/constants/text_style.dart';
import 'package:graduation_project_flutter/models/area/ar_topic.dart';
import 'package:graduation_project_flutter/views/screen/content_of_topic.dart';
import '../../utilities/permissions.dart';

class TopicListWidget extends StatefulWidget {
  final List<GetTopicArea> data;

  const TopicListWidget({super.key, required this.data});

  @override
  State<TopicListWidget> createState() => _TopicListWidgetState();
}

class _TopicListWidgetState extends State<TopicListWidget> {
  void _showUpdateDeleteDialog(BuildContext context, GetTopicArea topic) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update or Delete Topic'),
          content: const Text('Would you like to update or delete this topic?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to the update topic page
                Navigator.pushNamed(context, "update_topic", arguments: topic);
              },
              child: const Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteTopic(context, topic);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _deleteTopic(BuildContext context, GetTopicArea topic) async {
    try {
      // await ArTopicServiceAPI().deleteTopic(topic.id!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Topic deleted successfully')),
      );
      setState(() {
        widget.data.remove(topic);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to delete topic')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data.length,
      itemBuilder: (context, i) {
        GetTopicArea topicOfAreaData = widget.data[i];
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  ContentOfTopic(topicId: topicOfAreaData.id!, topicName: topicOfAreaData.topicTitle!),
            ));
          },
          onLongPress: () {
            if (isSystemAdmin() || isFacultyMember()) {
              _showUpdateDeleteDialog(context, topicOfAreaData);
            }
          },
          child: Card(
            elevation: 20,
            margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: Text(
                  topicOfAreaData.topicTitle ?? 'Untitled Topic',
                  style: labelLarge,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
