
import 'package:flutter/material.dart';

class DemoBottomAppBar extends StatefulWidget {
  const DemoBottomAppBar({Key? key}) : super(key: key);

  @override
  State<DemoBottomAppBar> createState() => _DemoBottomAppBarState();
}

class _DemoBottomAppBarState extends State<DemoBottomAppBar> with RestorationMixin{

  final RestorableBool _showFab = RestorableBool(true);
  final RestorableBool _showNotch = RestorableBool(true);
  final RestorableInt _fabLocation = RestorableInt(0);

  _onShowFab(bool value){
   setState(() {
    _showFab.value = value;
   });
  }
  _onShowNotch(bool value){
    setState(() {
      _showNotch.value = value;
    });
  }
  _onFabLocation(int? value){
    setState(() {
      _fabLocation.value = value!;
    });
  }
  final List<FloatingActionButtonLocation> _listFabLocation = [
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endFloat,
  ];

  @override
  String get restorationId => 'bottom_app_bar';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_showFab, 'showFab');
    registerForRestoration(_showNotch, 'showNotch');
    registerForRestoration(_fabLocation, 'fabLocation');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Bottom App Bar'),
      ),
      body: ListView(
        children: [
          SwitchListTile(title: Text('Show Fab'),value: _showFab.value, onChanged: _onShowFab),
          SwitchListTile(title: Text('Show Notch'),value: _showNotch.value, onChanged: _onShowNotch),
          Padding(padding: EdgeInsets.all(8),child: Text('Fab Location'),),
          RadioListTile(title: Text('0'),value: 0, groupValue: _fabLocation.value, onChanged: _onFabLocation),
          RadioListTile(title: Text('1'),value: 1, groupValue: _fabLocation.value, onChanged: _onFabLocation),
          RadioListTile(title: Text('2'),value: 2, groupValue: _fabLocation.value, onChanged: _onFabLocation),
          RadioListTile(title: Text('3'),value: 3, groupValue: _fabLocation.value, onChanged: _onFabLocation),
        ],
      ),
      bottomNavigationBar: BottomAppBarX(
        shape: _showNotch.value? CircularNotchedRectangle() : null ,
        location: _listFabLocation[_fabLocation.value],
      ),
      floatingActionButton: _showFab.value? FloatingActionButton(onPressed: (){},child: Icon(Icons.add)) : null,
      floatingActionButtonLocation: _listFabLocation[_fabLocation.value],
    );
  }
}


class BottomAppBarX extends StatelessWidget {
  const BottomAppBarX({Key? key, this.shape, this.location}) : super(key: key);

  final location;
  final shape;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.blue,
      elevation: 2,
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
          if (location == FloatingActionButtonLocation.centerDocked) Spacer(),
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
        ],
      ),
    );
  }
}

