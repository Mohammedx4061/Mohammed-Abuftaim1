import 'package:flutter/material.dart';
import 'sql.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 4,
        ),
      ),
      home: const NotesHomePage(),
    );
  }
}

class NotesHomePage extends StatefulWidget {
  const NotesHomePage({super.key});

  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
  final SqlDatabase _database = SqlDatabase();
  List<Map<String, dynamic>> _notes = [];
  bool _isLoading = false;
  String _statusMessage = '';
  Color _statusColor = Colors.blue;

  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  @override
  void dispose() {
    _database.close();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _loadNotes() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final notes = await _database.getAllNotes();
      setState(() {
        _notes = notes;
        _statusMessage = 'Loaded ${notes.length} notes';
        _statusColor = Colors.green;
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'Error loading notes: $e';
        _statusColor = Colors.red;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _addNote() async {
    if (_noteController.text.trim().isEmpty) {
      setState(() {
        _statusMessage = 'Please enter a note';
        _statusColor = Colors.orange;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _statusMessage = '';
    });

    try {
      final id = await _database.insertNote(_noteController.text.trim());

      setState(() {
        _statusMessage = 'Note added successfully (ID: $id)';
        _statusColor = Colors.green;
      });

      _noteController.clear();
      await _loadNotes();
    } catch (e) {
      setState(() {
        _statusMessage = 'Error adding note: $e';
        _statusColor = Colors.red;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteNote(int id) async {
    setState(() {
      _isLoading = true;
      _statusMessage = '';
    });

    try {
      final affectedRows = await _database.deleteNote(id);

      setState(() {
        _statusMessage = affectedRows > 0
            ? 'Note deleted successfully'
            : 'Note not found';
        _statusColor = affectedRows > 0 ? Colors.green : Colors.orange;
      });

      await _loadNotes();
    } catch (e) {
      setState(() {
        _statusMessage = 'Error deleting note: $e';
        _statusColor = Colors.red;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildStatusBar() {
    if (_statusMessage.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _statusColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(
            _statusColor == Colors.green ? Icons.check_circle :
            _statusColor == Colors.red ? Icons.error :
            _statusColor == Colors.orange ? Icons.warning : Icons.info,
            color: _statusColor,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              _statusMessage,
              style: TextStyle(
                color: _statusColor,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoteCard(Map<String, dynamic> note) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Text(
            note['id'].toString(),
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          note['note']?.toString() ?? 'No content',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: note['created_at'] != null
            ? Text(
          'Created: ${note['created_at']}',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        )
            : null,
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => _deleteNote(note['id'] as int),
        ),
        onTap: () {
          _noteController.text = note['note']?.toString() ?? '';
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Edit Note'),
              content: TextField(
                controller: _noteController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Enter your note...',
                  border: OutlineInputBorder(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final id = note['id'] as int;
                    await _database.updateNote(id, _noteController.text.trim());
                    Navigator.pop(context);
                    await _loadNotes();
                    _noteController.clear();
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes Manager'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadNotes,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _noteController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'New Note',
                    hintText: 'Enter your note here...',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: _addNote,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildStatusBar(),
              ],
            ),
          ),
          if (_isLoading)
            const LinearProgressIndicator()
          else if (_notes.isEmpty)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.note_add,
                      size: 60,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'No notes yet',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Add your first note above',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: RefreshIndicator(
                onRefresh: _loadNotes,
                child: ListView.builder(
                  itemCount: _notes.length,
                  itemBuilder: (context, index) => _buildNoteCard(_notes[index]),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}