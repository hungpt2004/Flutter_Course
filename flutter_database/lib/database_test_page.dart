import 'package:flutter/material.dart';
import 'package:flutter_database_sqlite/data/sql_helper.dart';

class DatabaseTestPage extends StatefulWidget {
  @override
  _DatabaseTestPageState createState() => _DatabaseTestPageState();
}

class _DatabaseTestPageState extends State<DatabaseTestPage> {
  final DBHelper _dbHelper = DBHelper.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  List<Map<String, dynamic>> _shops = [];

  @override
  void initState() {
    super.initState();
    _fetchShops();
  }

  Future<void> _fetchShops() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> shops = await db.query('Shop');
    setState(() {
      _shops = shops;
    });
  }

  Future<void> _addShop() async {
    final db = await _dbHelper.database;
    await db.insert('Shop', {
      'Name': _nameController.text,
      'Description': _descriptionController.text,
      'PhoneNumber': _phoneController.text,
      'Address': _addressController.text,
      'Email': _emailController.text,
    });
    _clearControllers();
    _fetchShops();
  }

  Future<void> _deleteShop(int id) async {
    final db = await _dbHelper.database;
    await db.delete('Shop', where: 'Shop_ID = ?', whereArgs: [id]);
    _fetchShops();
  }

  void _clearControllers() {
    _nameController.clear();
    _descriptionController.clear();
    _phoneController.clear();
    _addressController.clear();
    _emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Database Test')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addShop,
              child: Text('Add Shop'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _shops.length,
                itemBuilder: (context, index) {
                  final shop = _shops[index];
                  return ListTile(
                    title: Text(shop['Name']),
                    subtitle: Text(shop['Description']),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteShop,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
