import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/group_provider.dart';
import '../models/group.dart';

class ManageGroupScreen extends StatefulWidget {
  static const routeName = '/manage-group';

  @override
  _ManageGroupScreenState createState() => _ManageGroupScreenState();
}

class _ManageGroupScreenState extends State<ManageGroupScreen> {
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  var _editedGroup = Group(
    id: '',
    name: '',
    description: '',
    members: [],
    books: [],
  );

  @override
  Widget build(BuildContext context) {
    final groupId = ModalRoute.of(context)?.settings.arguments as String?;
    final groupProvider = Provider.of<GroupProvider>(context, listen: false);

    if (groupId != null) {
      _editedGroup = groupProvider.groups.firstWhere((group) => group.id == groupId);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(groupId == null ? 'Adicionar Grupo' : 'Editar Grupo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _editedGroup.name,
                decoration: InputDecoration(labelText: 'Nome do Grupo'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, forneça um nome.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedGroup = Group(
                    id: _editedGroup.id,
                    name: value!,
                    description: _editedGroup.description,
                    members: _editedGroup.members,
                    books: _editedGroup.books,
                  );
                },
              ),
              TextFormField(
                initialValue: _editedGroup.description,
                decoration: InputDecoration(labelText: 'Descrição do Grupo'),
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, forneça uma descrição.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedGroup = Group(
                    id: _editedGroup.id,
                    name: _editedGroup.name,
                    description: value!,
                    members: _editedGroup.members,
                    books: _editedGroup.books,
                  );
                },
              ),
              SizedBox(height: 20),
              if (_isLoading)
                Center(child: CircularProgressIndicator())
              else
                ElevatedButton(
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    _formKey.currentState!.save();
                    setState(() {
                      _isLoading = true;
                    });

                    if (_editedGroup.id.isEmpty) {
                      await groupProvider.addGroup(_editedGroup);
                    } else {
                      await groupProvider.updateGroup(_editedGroup);
                    }

                    setState(() {
                      _isLoading = false;
                    });

                    Navigator.of(context).pop();
                  },
                  child: Text('Salvar'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
