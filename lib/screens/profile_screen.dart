import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';
import 'wish_list_screen.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<ProfileScreen> {
  late ScrollController _scrollController;
  var top = 0.0;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6750A4),
        title: Center( // استخدام Center هنا
          child: Text(
            'הפרופייל',
            style: TextStyle(
              color: ColorsConsts.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFF9F2FA),
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              /*
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 4,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            ColorsConsts.starterColor,
                            ColorsConsts.endColor,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: top <= 110.0 ? 1.0 : 0,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: kToolbarHeight / 1.8,
                                  width: kToolbarHeight / 1.8,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 1.0,
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  // 'top.toString()',
                                  'Guest',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      background: Image(
                        image: NetworkImage(
                            'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }),
              ),
              */
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: userTitle('התיק')),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          onTap: () => Navigator.of(context).pushNamed(
                              WishlistScreen.routeName
                          ),
                          title: Text('רשימת משאלות'),
                          trailing: Icon(Icons.chevron_right_rounded,color: ColorsConsts.wishListColor,),
                          leading: Icon(Icons.rss_feed,color: ColorsConsts.wishListColor,),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        child: ListTile(
                          onTap: () {},
                          title: Text('סל הקניות'),
                          trailing: Icon(Icons.chevron_right_rounded,color: ColorsConsts.cartColor,),
                          leading: Icon(Icons.shopping_cart,color: ColorsConsts.cartColor,),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: userTitle('הפרטים')),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    userListTile('אימיל', 'כתובת המייל', 0, context),
                    userListTile('מספר הטלפון', '4555', 1, context),
                    userListTile('כתובת', '', 2, context),
                    userListTile('תאריך הצטרפות', 'תאריך', 3, context),
                    userListTile('יציאה', '', 4, context),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }



  List<IconData> _userTileIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded
  ];

  Widget userListTile(
      String title, String subTitle, int index, BuildContext context) {
    if( index != 4) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Theme
              .of(context)
              .splashColor,
          child: ListTile(
            onTap: () {},
            title: Text(title),
            subtitle: Text(subTitle),
            leading: Icon(_userTileIcons[index], color: ColorsConsts.darkBlue,),
          ),
        ),
      );
    }
    else{
      return Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Theme
              .of(context)
              .splashColor,
          child: ListTile(
            onTap: () {},
            title: Text(title),
            leading: Icon(_userTileIcons[index], color: ColorsConsts.gradiendFStart,),
          ),
        ),
      );
    }
  }

  Widget userTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
      ),
    );
  }
}
