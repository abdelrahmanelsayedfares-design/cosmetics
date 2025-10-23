import 'package:cosmetics/core/ui/app_images.dart';
import 'package:flutter/material.dart';

import '../../../core/logic/items_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 380,
                    height: 152,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffECA4C5),
                          Color(0xff434C6DD4).withValues(alpha: .83),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          spreadRadius: 0,
                          color: Color(0xff00000040).withValues(alpha: .25),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 104),
                    child: Center(
                      child: ClipOval(
                        child: AppImage(
                          image:
                              'https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/67/fc/36/67fc364d-0295-636c-2031-e561757e774d/artwork.jpg/1200x630bf-60.jpg',
                          width: 96,
                          height: 96,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Sara Samer Talaat',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff434C6D),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: itemProfil.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                         Padding(
                           padding: const EdgeInsets.all(13),
                           child: Container(
                              child: Row(
                                children: [
                                  AppImage(image: itemProfil[index].image),
                                  SizedBox(width: 8),
                                  Text(
                                    itemProfil[index].text,
                                    style: TextStyle(
                                      color: Color(0xff434C6D),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: AppImage(image: 'forward.svg'),
                                  ),
                                ],
                              ),
                            ),
                         ),

                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: Container(
                      width: 84,
                      height: 32,
                      child: Row(
                        children: [
                          AppImage(image: 'out.svg',
                          width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Logout',
                            style: TextStyle(
                              color: Color(0xffCD0F0F),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
