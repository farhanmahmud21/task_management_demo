import 'package:flutter/material.dart ';
import 'package:task_manager/Ui/Screens/LoginScreen.dart';
import 'package:task_manager/data/models/auth_utility.dart';

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
        title: Text(
            '${AuthUtility.userinfo.data?.firstName} ${AuthUtility.userinfo.data?.lastName} ',
            style: TextStyle(
              color: Colors.white,
            )),
        subtitle: Text(
          '${AuthUtility.userinfo.data?.email}',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
                (route) => false);
          },
        ),
      ),
    );
  }
}
