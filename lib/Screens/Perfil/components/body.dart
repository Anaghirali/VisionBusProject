import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:vision_bus/Screens/Principal/principal_screen.dart';
import 'package:vision_bus/Screens/shared/constants.dart';
import 'package:theme_provider/theme_provider.dart' as prefix;

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: kDarkTheme,
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Theme.of(context),
          home: const ProfileScreen(),
        );
      }),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(414, 896),
      splitScreenMode: true
    );
    
    var profileInfo = Expanded(
                child: Column(
                  children: [
                    Container(
                      height: kSpacingUnit.w * 10,
                      width: kSpacingUnit.w * 10,
                      margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: kSpacingUnit.w * 5,
                            backgroundImage: const NetworkImage('https://api.ejcomp.com.br/members/1586969992913-perfilsemfoto.jpg'),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: kSpacingUnit.w * 2.5,
                              width: kSpacingUnit.w * 2.5,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                shape: BoxShape.circle
                              ),
                              child: Icon(
                                LineAwesomeIcons.pen,
                                color: kDarkPrimaryColor,
                                size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                              ),
                            ),
                          )
                        ]
                      ),
                    ),
                    SizedBox(height: kSpacingUnit.w * 2,),
                    Text('Seu nome...', style: kTitleTextStyle,),
                    SizedBox(height: kSpacingUnit.w * 0.5,),
                    Text('Seu e-mail: exemplo@gmail.com', style: kCaptionTextStyle,),
                    SizedBox(height: kSpacingUnit.w * 2,),
                    Container(
                      height: kSpacingUnit.w * 4,
                      width: kSpacingUnit.w * 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                        color: Theme.of(context).colorScheme.secondary
                      ),
                      child: Center(
                        child: Text('Upgrade to PRO', style: kButtonTextStyle,),
                      ),
                    )
                  ],
                ),
              );
    
    var themeSwitcher = ThemeSwitcher(builder: (context) {
      return AnimatedCrossFade(
        duration: const Duration(milliseconds: 200),
        crossFadeState: ThemeModelInheritedNotifier.of(context).theme.brightness == Brightness.dark 
        ? CrossFadeState.showFirst 
        : CrossFadeState.showSecond,
        firstChild: GestureDetector(
          onTap: () => ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
          child: Icon(
                    LineAwesomeIcons.sun,
                    size: ScreenUtil().setSp(kSpacingUnit.w * 3),
                    color: Colors.white,
                  ),
        ),
        secondChild: GestureDetector(
          onTap: () => ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
          child: Icon(
                    LineAwesomeIcons.moon,
                    size: ScreenUtil().setSp(kSpacingUnit.w * 3),
                    color: Colors.black,
                  ),
        ),
      );
    });
    var header = Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: kSpacingUnit.w * 3,),
              /*
              GestureDetector(
                child: Icon(
                  LineAwesomeIcons.arrow_left,
                  size: ScreenUtil().setSp(kSpacingUnit.w * 3),
                  color: Colors.white,
                ),
              ),*/
              profileInfo,
              themeSwitcher,
              SizedBox(width: kSpacingUnit.w * 3,),
            ],
          );
    return ThemeSwitchingArea(
      child: Builder(builder: ((context) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaPrincipal()),
            ),
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text(
            'Perfil',
            style: TextStyle(
              fontFamily: 'LibreBaskerville'
            ),
          ),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        body: Column(
          children: [
            SizedBox(height: kSpacingUnit.w * 2,),
            header,
            Expanded(
              child: ListView(
                children: const [
                  SizedBox(height: 20,),
                  ProfileListItem(
                    icon: LineAwesomeIcons.user_shield,
                    text: 'Privacidade e Dados',
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.history,
                    text: 'Purchase History',
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.question_circle,
                    text: 'Ajuda e suporte',
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.cog,
                    text: 'Configurações',
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.user_plus,
                    text: 'Convide um amigo',
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.alternate_sign_out,
                    text: 'Sair',
                    hasNavigation: false,
                  )
                ],
              ),
            ),
          ],
        ),
      );})
    ));
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final text;
  final bool hasNavigation;
  const ProfileListItem({
    Key? key, required this.icon, this.text, this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit.w * 5.5,
      margin: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 4
      ).copyWith(bottom: kSpacingUnit.w * 2),
      padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
        color: Theme.of(context).backgroundColor
      ),
      child: Row(
        children: [
          Icon(
            this.icon, 
            color: Colors.white,
            size: kSpacingUnit.w * 2.5,
          ),
          SizedBox(width: kSpacingUnit.w * 2.5,),
          Text(
            this.text,
            style: kTitleTextStyle.copyWith(fontWeight: FontWeight.w500),
          ),
          Spacer(),
          if (this.hasNavigation)
          Icon(
            LineAwesomeIcons.angle_right, 
            color: Colors.white,
            size: kSpacingUnit.w * 2.5,
          ),
        ],
      ),
    );
  }
}