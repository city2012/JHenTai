import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jhentai/src/consts/eh_consts.dart';
import 'package:jhentai/src/network/eh_request.dart';
import 'package:jhentai/src/routes/routes.dart';
import 'package:jhentai/src/utils/cookie_util.dart';

import '../../../setting/eh_setting.dart';

class SettingEHPage extends StatelessWidget {
  const SettingEHPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ehSetting'.tr),
        elevation: 1,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          ListTile(
            title: Text('site'.tr),
            trailing: Obx(() {
              return CupertinoSlidingSegmentedControl<String>(
                groupValue: EHSetting.site.value,
                children: const {
                  'EH': Text('E-Hentai'),
                  'EX': Text('EXHentai'),
                },
                onValueChanged: (value) {
                  EHSetting.saveSite(value!);
                },
              );
            }),
          ),
          ListTile(
            title: Text('siteSetting'.tr),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: _gotoSiteSettingPage,
          ),
        ],
      ).paddingSymmetric(vertical: 16),
    );
  }

  Future<void> _gotoSiteSettingPage() async {
    List<Cookie> cookies = await EHRequest.getCookie(Uri.parse(EHConsts.EIndex));
    Get.toNamed(
      Routes.webview,
      arguments: EHConsts.EUconfig,
      parameters: {'cookies': CookieUtil.parse2String(cookies)},
    );
  }
}
