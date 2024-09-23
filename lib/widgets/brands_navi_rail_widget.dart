import 'package:flutter/material.dart';
import 'brands_rail_widget.dart';

class BrandNavigationRailScreen extends StatefulWidget {
  const BrandNavigationRailScreen({Key? key}) : super(key: key);

  static const routeName = '/brands_navigation_rail';

  @override
  _BrandNavigationRailScreenState createState() =>
      _BrandNavigationRailScreenState();
}

class _BrandNavigationRailScreenState extends State<BrandNavigationRailScreen> {
  int _selectedIndex = 0;
  final double padding = 8.0;
  String? routeArgs;
  String brand = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as String?;
    if (args != null) {
      routeArgs = args;
      _selectedIndex = int.tryParse(routeArgs!.substring(1, 2)) ?? 0;
      brand = _getBrandByIndex(_selectedIndex);
    }
  }

  String _getBrandByIndex(int index) {
    switch (index) {
      case 0:
        return 'Addidas';
      case 1:
        return 'Apple';
      case 2:
        return 'Dell';
      case 3:
        return 'H&M';
      case 4:
        return 'Nike';
      case 5:
        return 'Samsung';
      case 6:
        return 'Huawei';
      case 7:
        return 'All';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: NavigationRail(
                      minWidth: 56.0,
                      groupAlignment: 1.0,
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (int index) {
                        setState(() {
                          _selectedIndex = index;
                          brand = _getBrandByIndex(_selectedIndex);
                        });
                      },
                      labelType: NavigationRailLabelType.all,
                      leading: Column(
                        children: <Widget>[
                          SizedBox(height: 20),
                          Center(
                            child: CircleAvatar(
                              radius: 16,
                              backgroundImage: NetworkImage(
                                "https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg",
                              ),
                            ),
                          ),
                          SizedBox(height: 80),
                        ],
                      ),
                      selectedLabelTextStyle: TextStyle(
                        color: Color(0xffffe6bc97),
                        fontSize: 20,
                        letterSpacing: 1,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2.5,
                      ),
                      unselectedLabelTextStyle: TextStyle(
                        fontSize: 15,
                        letterSpacing: 0.8,
                      ),
                      destinations: [
                        buildRotatedTextRailDestination('Addidas', padding),
                        buildRotatedTextRailDestination('Apple', padding),
                        buildRotatedTextRailDestination('Dell', padding),
                        buildRotatedTextRailDestination('H&M', padding),
                        buildRotatedTextRailDestination('Nike', padding),
                        buildRotatedTextRailDestination('Samsung', padding),
                        buildRotatedTextRailDestination('Huawei', padding),
                        buildRotatedTextRailDestination('All', padding),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          // This is the main content.
          ContentSpace(brand: brand),
        ],
      ),
    );
  }
}

NavigationRailDestination buildRotatedTextRailDestination(
    String text, double padding) {
  return NavigationRailDestination(
    icon: SizedBox.shrink(),
    label: Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(text),
      ),
    ),
  );
}

class ContentSpace extends StatelessWidget {
  final String brand;

  const ContentSpace({Key? key, required this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) =>
                BrandsNavigationRail(),
          ),
        ),
      ),
    );
  }
}
