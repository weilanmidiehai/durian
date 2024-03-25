class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = 'assets/bg/4.png',
    this.darkImagePath = 'assets/bg/18.png',
    this.title,
  });

  String? navigateScreen;
  String imagePath;
  String darkImagePath;
  String? title;

  static List<HomeList> homeList = [
    HomeList(
      navigateScreen: '/FanChart',
      title: '图形（饼图）\n插件：fl_chart',
    ),
    HomeList(
      navigateScreen: '/PdfView',
      title: 'Pdf预览\n插件：flutter_pdfview',
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
    HomeList(
      navigateScreen: '/TransitionsHomePage',
      title: '动画组件',
    ),
    HomeList(
      navigateScreen: '/GuideIndex',
      title: '新手引导',
    ),HomeList(
      navigateScreen: '/TimePicker',
      title: '时间选择器',
    ),
  ];
}
