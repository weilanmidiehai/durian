import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class GmailVerificationCode extends StatelessWidget {
  const GmailVerificationCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GmailVerificationCode'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "发送邮箱",
                  hintText: "邮箱账号",
                  prefixIcon: Icon(Icons.person)),
            ),
            const TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "发送主题",
                  hintText: "主题",
                  prefixIcon: Icon(Icons.person)),
            ),
            const TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "发送内容",
                  hintText: "内容",
                  prefixIcon: Icon(Icons.person)),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await sendVerificationCode('498200480@qq.com', '123456');
                },
                child: const Text('Send Verification Code'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendVerificationCode(
      String recipientEmail, String verificationCode) async {
    //账号和第三方應用程式密碼
    // prjl qxet eghn vkxo
    final smtpServer = gmail('xl1627687057@gmail.com', 'itosocswrupvjyyb');

    final message = Message()
      ..from = const Address('xl1627687057@gmail.com')
      ..recipients.add(recipientEmail)
      ..subject = 'Fairwood Staff SIT [UAT] Verification Code'
      ..text = '你的验证码是: $verificationCode';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent(已发送): $sendReport');
    } catch (e) {
      print('Error sending email（出错啦）: $e');
    }
  }
}
