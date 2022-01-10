import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  //const FilterScreen({Key? key}) : super(key: key);
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen({@required this.currentFilters, @required this.saveFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    bool _glutenFree = false;
    bool _vegetarian = false;
    bool _vegan = false;
    bool _lactoseFree = false;

    @override
    initState(){
      _glutenFree = widget.currentFilters['gluten'];
      _lactoseFree = widget.currentFilters['lactose'];
      _vegetarian = widget.currentFilters['vegetarian'];
      _vegan = widget.currentFilters['vegan'];

      super.initState();
    }

    Widget _buildSwitchListTile(
      String title,
      String desc,
      bool currentVal,
      Function updateVal,
    ) =>
        SwitchListTile(
          title: Text(title),
          subtitle: Text('Only include gluten-free meal.'),
          value: currentVal,
          onChanged: updateVal,
        );

    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Text('Adjust your meal'),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text('Gluten-free'),
                  subtitle: Text('Only include gluten-free meal.'),
                  value: _glutenFree,
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Gluten-Free',
                  'Only include gluten-free meal.',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitch(
                  'Lactose-free',
                  'Only inlcude lactose free.',
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitch(
                  'Vegetarian',
                  'Only include vegetarian.',
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSwitch(
    String title,
    String desc,
    bool currentVal,
    Function updateVal,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(desc),
      value: currentVal,
      onChanged: updateVal,
    );
  }
}
