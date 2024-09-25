import 'package:flutter/material.dart';
import 'package:note_event_money/controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _homeController = HomeController();
  final TextEditingController _noteControllerInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NOTES')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _noteControllerInput,
              decoration: InputDecoration(
                labelText: 'Enter a todo',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_noteControllerInput.text.isNotEmpty) {
                      setState(() {
                        _homeController.addNote(_noteControllerInput.text);
                        _noteControllerInput.clear();
                      });
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _homeController.notes.length,
              itemBuilder: (context, index) {
                final todo = _homeController.notes[index];
                return ListTile(
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _homeController.removeNote(index);
                      });
                    },
                  ),
                  onTap: () {
                    setState(() {
                      _homeController.toggleNoteStatus(index);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}