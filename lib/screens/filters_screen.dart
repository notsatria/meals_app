import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';

  final Function saveFilters;

  Map<String, bool> filtered;

  FiltersScreen({Key key, this.saveFilters, this.filtered}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

  @override
  void initState() {
    _isGlutenFree = widget.filtered['gluten'];
    _isLactoseFree = widget.filtered['lactose'];
    _isVegan = widget.filtered['vegan'];
    _isVegetarian = widget.filtered['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      {bool value, Function onChanged, String title, String subtitle}) {
    return SwitchListTile(
      value: value,
      title: Text(title),
      onChanged: onChanged,
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                value: _isGlutenFree,
                title: 'Gluten-free',
                subtitle: 'Only include gluten-free meals',
                onChanged: (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                value: _isLactoseFree,
                title: 'Lactose-free',
                subtitle: 'Only include lactose-free meals',
                onChanged: (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                value: _isVegan,
                title: 'Vegan',
                subtitle: 'Only include vegan meals',
                onChanged: (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                value: _isVegetarian,
                title: 'Vegetarian',
                subtitle: 'Only include Vegetarian meals',
                onChanged: (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final selectedFilters = {
            'gluten': _isGlutenFree,
            'lactose': _isLactoseFree,
            'vegan': _isVegan,
            'vegetarian': _isVegetarian,
          };
          widget.saveFilters(selectedFilters);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
