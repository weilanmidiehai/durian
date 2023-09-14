class HomeList {
  HomeList({
    this.navigateScreen,
    // this.imagePath = 'assets/bg/4.png',
    this.title,
  });

  String? navigateScreen;
  // String imagePath;
  String? title;

  static List<HomeList> homeList = [
    HomeList(
      navigateScreen: '/FanChart',
      title: '饼图\n插件：fl_chart\n还有折线图、柱状图等',
    ),
    HomeList(
      navigateScreen: '/PdfView',
      title: 'Pdf预览',
    ),
    HomeList(
      navigateScreen: '/GmailVerificationCode',
      title: '邮件发送',
    ),
    HomeList(
      navigateScreen: '/Img',
      title: '图片选择',
    ),
    HomeList(
      navigateScreen: '/FlipCard',
      title: '翻转卡片',
    ),
  ];
}
