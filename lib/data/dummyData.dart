import 'package:medical_app/model/test.dart';

List<Test> dummyTest = [
  Test.fromJson({
    'testName': 'Blood Test',
    'testDescription': 'Include 3 Tests',
    'testReportTime': '24 hours',
    'testNormalPrice': 1000,
    'testDiscountPrice': 500,
  }),
  Test.fromJson({
    'testName': 'Thyroid Profile',
    'testDescription': 'Includes 4 Tests',
    'testReportTime': '36 hours',
    'testNormalPrice': 900,
    'testDiscountPrice': 600,
  }),
  Test.fromJson({
    'testName': 'Iron Study Test',
    'testDescription': 'Includes 2 Tests',
    'testReportTime': '48 hours',
    'testNormalPrice': 1200,
    'testDiscountPrice': 699,
  }),
  Test.fromJson({
    'testName': 'Lipid Profile Test',
    'testDescription': 'Includes 5 Tests',
    'testReportTime': '12 hours',
    'testNormalPrice': 1300,
    'testDiscountPrice': 899,
  }),
];
