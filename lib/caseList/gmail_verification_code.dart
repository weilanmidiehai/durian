import 'package:durian/widget/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import '../util/app_theme.dart';

class GmailVerificationCode extends StatelessWidget {
  const GmailVerificationCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'GmailVerificationCode',
        actions: [
          Container(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                  onTap: () async {
                    await sendVerificationCode('1627687057@qq.com', '123456');
                  },
                  child: const Text(
                    '发送',
                    style: AppTheme.title,
                  )))
        ],
        body: bodyContainer());
  }

  Future<void> sendVerificationCode(
      String recipientEmail, String verificationCode) async {
    // 账号和第三方應用程式密碼
    // itosocswrupvjyyb
    final smtpServer = gmail('xl1627687057@gmail.com', 'prjl qxet eghn vkxo');

    final message = Message()
      ..from = const Address('xl1627687057@gmail.com')
      ..recipients.add(recipientEmail)
      ..subject = '主题 ： Verification Code'
      ..text = '你的验证码是: $verificationCode';

    try {
      final sendReport = await send(message, smtpServer);
      debugPrint('Message sent(已发送): $sendReport');
    } catch (e) {
      debugPrint('Error sending email（出错啦）: $e');
    }
  }
}

Widget bodyContainer() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: const Column(
      children: [
        TextField(
          autofocus: true,
          decoration: InputDecoration(
            labelText: "发件人",
            hintText: "xl1627687057@gmail.com",
          ),
        ),
        TextField(
          autofocus: true,
          decoration: InputDecoration(
            labelText: "收件人",
            hintText: "收件人",
          ),
        ),
        TextField(
          autofocus: true,
          decoration: InputDecoration(
            labelText: "主题",
            hintText: "主题",
          ),
        ),TextField(
          autofocus: true,
          decoration: InputDecoration(
            labelText: "内容",
            hintText: "内容",
          ),

        ),
        TextField(
          maxLength: 4,
        ),
      ],
    ),
  );
}

// 放假期间由于国庆节点餐系统的压力，需要人值班以便应对突发状况，大家辛苦一下，具体排班情况另行通知！
// 值班时间按国家法定节假日三倍工资计算，
