import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function setFilters;
  final Map<String, bool> filters;
  FiltersScreen(this.setFilters, this.filters);

  static const routeName = '/filtesr-screen';
  void callSetFilters(context, Map<String, bool> listFilters) {
    setFilters(listFilters);
    Navigator.pushNamed(context, '/');
  }

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;

  var _vegetarian = false;

  var _vegan = false;

  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.filters['gluten'] as bool;
    _vegetarian = widget.filters['vegetarian'] as bool;
    _vegan = widget.filters['vegan'] as bool;
    _lactoseFree = widget.filters['lactose'] as bool;
    super.initState();
  }

  Widget _buildSwithcListTile(
      String title, String subTitle, var value, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.callSetFilters(context, selectedFilter);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
            padding: EdgeInsets.all(20),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwithcListTile(
                  'Gluten-free',
                  'Only includee gluten-free meals',
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwithcListTile(
                  'Lactose-free',
                  'Only includee lactose-free meals',
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwithcListTile(
                  'Vegetarian',
                  'Only includee vegetarian meals',
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwithcListTile(
                  'Vegan',
                  'Only includee Vegan meals',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
