import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/models/event_model.dart';
import '../widgets/action_button.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final eventModel = Provider.of<EventModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('manejo de eventos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: eventModel.events.length,
              itemBuilder: (context, index) {
                final event = eventModel.events[index];
                return ListTile(
                  title: Text(event.description),
                  subtitle: Text(event.date.toString()),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => eventModel.removeEvent(index),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(110.0),
            child: ElevatedButton(
              onPressed: () => _showAddEventDialog(context),
              child: const Text('AGREGAR EVENTO'),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddEventDialog(BuildContext context) {
    final descriptionController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('registrar evento'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'descripción'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    selectedDate = pickedDate;
                  }
                },
                child: const Text('selecciona fecha'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (descriptionController.text.isNotEmpty) {
                  Provider.of<EventModel>(context, listen: false)
                      .addEvent(descriptionController.text, selectedDate);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('guardar'),
            ),
          ],
        );
      },
    );
  }
}
