import 'package:flutter/material.dart';
import 'app_state.dart';

class YesNoSelection extends StatelessWidget {
  const YesNoSelection({
    super.key,
    required this.state,
    required this.onSelection,
    required this.attendees,
    required this.onAttendeesChanged,
  });

  final Attending state;
  final void Function(Attending selection) onSelection;
  final int attendees;
  final void Function(int newAttendees) onAttendeesChanged;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: attendees.toString());

    void handleInput() {
      final input = int.tryParse(controller.text);
      if (input != null && input >= 0) {
        onAttendeesChanged(input); 
        onSelection(input > 0 ? Attending.yes : Attending.no); 
      }
    }

    return Column(
        children: [
          const Text("How many people will be attending?"),
          Row(
            children: [
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => handleInput(),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: handleInput,
            child: const Text('Submit'),
          ),
          ],
        ),
        ],
      );
  }
}
