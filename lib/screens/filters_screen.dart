import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters-screen";

  final Function saveFilter;
  Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilter);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegeatrian = false;
  var _lactoseFree = false;

  @override
  initState() {
    super.initState();
    _glutenFree = widget.currentFilters['gluten'];
    _vegan = widget.currentFilters['vegan'];
    _vegeatrian = widget.currentFilters['vegetarian'];
    _lactoseFree = widget.currentFilters['lactose'];
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool currValue, Function updateValue) {
    return SwitchListTile(
        value: currValue,
        onChanged: updateValue,
        title: Text(title),
        subtitle: Text(subtitle));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'vegan': _vegan,
                    'vegetarian': _vegeatrian,
                    'lactose': _lactoseFree,
                  };
                  widget.saveFilter(selectedFilters);
                  Navigator.of(context).pushReplacementNamed('/');
                })
          ],
        ),
        drawer: CustomDrawer(),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.all(20),
                child: Text('Adjust your recipes selection...',
                    style: Theme.of(context).textTheme.headline1)),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                    'Gluten Free',
                    'Only include gluten free recipes',
                    _glutenFree,
                    (newValue) => setState(() {
                          _glutenFree = newValue;
                        })),
                _buildSwitchListTile(
                    'Vegan',
                    'Only include Vegan recipes',
                    _vegan,
                    (newValue) => setState(() {
                          _vegan = newValue;
                        })),
                _buildSwitchListTile(
                    'Vegetarian',
                    'Only include vegetarian recipes',
                    _vegeatrian,
                    (newValue) => setState(() {
                          _vegeatrian = newValue;
                        })),
                _buildSwitchListTile(
                    'Lactose Free',
                    'Only include lactose free recipes',
                    _lactoseFree,
                    (newValue) => setState(() {
                          _lactoseFree = newValue;
                        }))
              ],
            )),
          ],
        ));
  }
}
