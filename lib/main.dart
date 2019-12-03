import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'common/utils/global_toast.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'common/event/http_error_event.dart';
import 'common/event/index.dart';
import 'common/net/code.dart';
import 'common/providers/UserInfoProvider.dart';
import 'common/utils/data_util.dart';
import 'login/register.dart';
import 'model/UserInfo.dart';
import 'navigator/tabNavigator.dart';

void main() {
  isLogin().then((bool b) {
    if (b) {
      // 已经登陆
      getUserInfo().then((UserInfo user) {
        runApp(MultiProvider(
          providers: [
            // 用户信息状态管理
            ChangeNotifierProvider(
              builder: (_) => UserInfoProvider(user),
            )
          ],
          child: MyApp(TabNavigator()),
        ));
      });
    } else {
      runApp(MultiProvider(
        providers: [
          // 用户信息状态管理
          ChangeNotifierProvider(
            builder: (_) => UserInfoProvider(null),
          ),
        ],
        child: MyApp(Register()),
      ));
    }
  });
  if (Platform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

Future<bool> isLogin() async {
  bool res = await DataUtil.getIsLogin();
  return res;
}

Future<UserInfo> getUserInfo() async {
  UserInfo userInfo = await DataUtil.getUserInfo();
  return userInfo;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Widget bodyWidget;
  MyApp(this.bodyWidget);

  @override
  Widget build(BuildContext context) {
    return OKToast(
      dismissOtherOnShow: true,
      child: new RestartWidget(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                backgroundColor: Color(0xFF29CCCC),
                highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
                splashColor: Colors.white70),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en', 'US'),
              const Locale('zh', 'CH'),
            ],
//      home: new Login(),
            home: Scaffold(
              resizeToAvoidBottomPadding: false,
              body: bodyWidget,
            ),
          )),
    );
  }
}

///这个组件用来重新加载整个child Widget的。当我们需要重启APP的时候，可以使用这个方案
///https://stackoverflow.com/questions/50115311/flutter-how-to-force-an-application-restart-in-production-mode
class RestartWidget extends StatefulWidget {
  final Widget child;

  RestartWidget({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  static restartApp(BuildContext context) {
    final _RestartWidgetState state =
        context.ancestorStateOfType(const TypeMatcher<_RestartWidgetState>());
    state.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  StreamSubscription stream;

  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (stream != null) {
      stream.cancel();
      stream = null;
    }
  }

  @override
  void initState() {
    super.initState();
    print("事件监听注册成功————————");

    ///Stream演示event bus
    stream = eventBus.on<HttpErrorEvent>().listen((event) {
      errorHandleFunction(event.code, event.message);
    });
  }

  errorHandleFunction(int code, message) {
    print("code:${code},message:${message}");
    switch (code) {
      case Code.NETWORK_ERROR:
        GlobalToast.globalToast('网络异常！');
        break;
      case 401:
        GlobalToast.globalToast("401${message}");
        break;
      case 403:
        GlobalToast.globalToast("403${message}");
        break;
      case 404:
        GlobalToast.globalToast("404${message}");
        break;
      case Code.NETWORK_TIMEOUT:
        //超时
        GlobalToast.globalToast('请求超时，请重新操作');
        break;
      default:
        GlobalToast.globalToast("error:${message}");
        break;
    }
  }
}
