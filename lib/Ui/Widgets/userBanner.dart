import 'package:flutter/material.dart ';

class UserBanner extends StatelessWidget {
  const UserBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text('Farhan Mahmud',
            style: TextStyle(
              color: Colors.white,
            )),
        subtitle: Text('mahmudkhanfarhan2001@gmail.com',
            style: TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }
}
