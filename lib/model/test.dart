class Test {
  String testName;
  String testDescription;
  String testReportTime;
  int testNormalPrice;
  int testDiscountPrice;

  Test({
    required this.testName,
    required this.testDescription,
    required this.testReportTime,
    required this.testNormalPrice,
    required this.testDiscountPrice,
  });
  //!Initial State ------------->
  factory Test.initialState() {
    return Test(
      testName: '',
      testDescription: '',
      testReportTime: '',
      testNormalPrice: 0,
      testDiscountPrice: 0,
    );
  }
  //!From Json ------------->
  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      testName: json['testName'],
      testDescription: json['testDescription'],
      testReportTime: json['testReportTime'],
      testNormalPrice: json['testNormalPrice'],
      testDiscountPrice: json['testDiscountPrice'],
    );
  }
}
