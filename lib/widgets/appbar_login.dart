import 'package:flutter/material.dart';

class AppBarLogin extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      brightness: Brightness.light,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(40.0);
}