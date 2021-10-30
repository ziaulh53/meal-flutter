import 'package:flutter/material.dart';
import 'package:meal/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> filtersData;

  FilterScreen(this.filtersData, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegen = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.filtersData['gluten'];
    _vegen = widget.filtersData['vegan'];
    _vegetarian = widget.filtersData['vegetarian'];
    _lactoseFree = widget.filtersData['lactose'];
    super.initState();
  }

  Widget _buildSwitchItem(
      String title, String subtitle, var filterName, Function handleSwitch) {
    return SwitchListTile(
      value: filterName,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: handleSwitch,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final _seletedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegen,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(_seletedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection."),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchItem('Gluten-free',
                    'Only include gluten-free meals', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchItem(
                    'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchItem('Vegen', 'Only include vegen meals', _vegen,
                    (newValue) {
                  setState(() {
                    _vegen = newValue;
                  });
                }),
                _buildSwitchItem(
                    'Lactose-free',
                    'Only include lactose-free meals',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
