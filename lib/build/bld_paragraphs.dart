import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/constants/text_style.dart';
import 'package:graduation_project_flutter/models/area/ar_paragraph.dart';
import '../../utilities/permissions.dart';

class ParagraphsWidget extends StatefulWidget {
  final List<GetParagraphArea> data;

  const ParagraphsWidget({super.key, required this.data});

  @override
  State<ParagraphsWidget> createState() => _ParagraphsWidgetState();
}

class _ParagraphsWidgetState extends State<ParagraphsWidget> {
  void _showUpdateDeleteDialog(BuildContext context, GetParagraphArea paragraph) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update or Delete Paragraph'),
          content: const Text('Would you like to update or delete this paragraph?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to the update paragraph page
                Navigator.pushNamed(context, "update_paragraph", arguments: paragraph);
              },
              child: const Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteParagraph(context, paragraph);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _deleteParagraph(BuildContext context, GetParagraphArea paragraph) async {
    try {
      // await ArParagraphServiceAPI().deleteParagraph(paragraph.id!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Paragraph deleted successfully')),
      );
      setState(() {
        widget.data.remove(paragraph);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to delete paragraph')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data.length,
      itemBuilder: (context, i) {
        GetParagraphArea paragraphOfTopicData = widget.data[i];
        return InkWell(
          onLongPress: () {
            if (isSystemAdmin() || isFacultyMember()) {
              _showUpdateDeleteDialog(context, paragraphOfTopicData);
            }
          },
          child: SafeArea(
            minimum: const EdgeInsets.only(top: 25, bottom: 15),
            child: Column(
              children: [
                Text(
                  paragraphOfTopicData.paragraphTitle ?? 'Untitled Paragraph',
                  style: labelMediem,
                ),
                Card(
                  margin: const EdgeInsets.all(15),
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        paragraphOfTopicData.content ?? 'No Paragraph content',
                        style: labelSmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}




class ExamplesWidget extends StatefulWidget {
  final List<GetParagraphArea> data;

  const ExamplesWidget({super.key, required this.data});

  @override
  State<ExamplesWidget> createState() => _ExamplesWidgetState();
}

class _ExamplesWidgetState extends State<ExamplesWidget> {
  void _showUpdateDeleteDialog(BuildContext context, GetParagraphArea paragraph) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update or Delete Example'),
          content: const Text('Would you like to update or delete this example?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to the update example page
                Navigator.pushNamed(context, "update_example", arguments: paragraph);
              },
              child: const Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteExample(context, paragraph);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _deleteExample(BuildContext context, GetParagraphArea paragraph) async {
    try {
      // await ArParagraphServiceAPI().deleteParagraph(paragraph.id!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Example deleted successfully')),
      );
      setState(() {
        widget.data.remove(paragraph);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to delete example')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data.length,
      itemBuilder: (context, i) {
        GetParagraphArea paragraphOfTopicData = widget.data[i];
        return InkWell(
          onLongPress: () {
            if (isSystemAdmin() || isFacultyMember()) {
              _showUpdateDeleteDialog(context, paragraphOfTopicData);
            }
          },
          child: SafeArea(
            minimum: const EdgeInsets.only(top: 25, bottom: 15),
            child: Column(
              children: [
                Text(
                  paragraphOfTopicData.paragraphTitle ?? 'Untitled Paragraph',
                  style: labelMediem,
                ),
                Card(
                  margin: const EdgeInsets.all(15),
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        paragraphOfTopicData.example ?? 'No Paragraph example',
                        style: labelSmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
