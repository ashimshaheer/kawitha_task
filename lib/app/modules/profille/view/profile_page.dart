import 'package:flutter/material.dart';
import 'package:kawika_machinetest/app/modules/login/view_model/login_provider.dart';
import 'package:kawika_machinetest/utils/responsive.dart';
import 'package:provider/provider.dart';

import '../../../../utils/common_widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Consumer<LoginProvider>(builder: (context, obj, _) {
            var data = obj.userData;
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffF4F4F4),
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(
                    data.image ?? '',
                    width: Responsive.width * 20,
                    height: Responsive.height * 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextWidget(
                        color: Colors.black,
                        text: '${data.firstName ?? ''} ${data.lastName ?? ''}',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      CommonTextWidget(
                        color: Colors.black,
                        text: 'John Doe',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: Responsive.width * 60,
                        child: Expanded(
                          child: CommonTextWidget(
                            color: Colors.black,
                            text: data.email ?? '',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            maxLines: 2,
                            overFlow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      CommonTextWidget(color: Colors.black, text: ''),
                    ],
                  ),
                ],
              ),
            );
          })),
    );
  }
}
