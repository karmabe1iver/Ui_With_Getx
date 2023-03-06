class PaySlipModel {
  Uri pay;
  String Month;

  PaySlipModel({required this.pay, required this.Month});
}

List<PaySlipModel> PaySlip = <PaySlipModel>[
  PaySlipModel(
    pay: Uri(
        scheme: 'https',
        host: 'africau.edu',
        path: '/images/default/sample.pdf'),
    Month: 'January  2023',
  ),
  PaySlipModel(
    pay: Uri(
        scheme: 'https',
        host: 'educative.io',
        path: '/answers/what-is-the-list-insert-method-in-dart'),
    Month: 'February  2023',
  ),
  PaySlipModel(
    pay: Uri(
      scheme: 'https',
      host: 'youtube.com',
    ),
    Month: 'March  2023',
  ),
  PaySlipModel(
    pay: Uri(
        scheme: 'https',
        host: 'w3.org',
        path: '/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf'),
    Month: 'April  2023',
  ),
  PaySlipModel(
    pay: Uri(
        scheme: 'https',
        host: 'africau.edu',
        path: '/images/default/sample.pdf'),
    Month: 'May  2023',
  ),
  PaySlipModel(
    pay: Uri(
        scheme: 'https',
        host: 'chat.openai.com',
        path: '/chat'),
    Month: 'June 2023',
  ),
  PaySlipModel(
    pay: Uri(
        scheme: 'https',
        host: 'tamilblasters.rent',
        ),
    Month: 'July  2023',
  ),
  PaySlipModel(
    pay: Uri(
        scheme: 'https',
        host: 'africau.edu',
        path: '/images/default/sample.pdf'),
    Month: 'August 2023',
  ),
  PaySlipModel(
    pay: Uri(
        scheme: 'https',
        host: 'africau.edu',
        path: '/images/default/sample.pdf'),
    Month: 'September 2023',
  ),
  PaySlipModel(
    pay: Uri(
        scheme: 'https',
        host: 'africau.edu',
        path: '/images/default/sample.pdf'),
    Month: 'October 2023',
  ),
  PaySlipModel(
    pay: Uri(
        scheme: 'https',
        host: 'instagram.com',
        ),
    Month: 'November 2023',
  ),
  PaySlipModel(
    pay: Uri(
        scheme: 'https',
        host: 'medium.com',
       ),
    Month: 'December 2023',
  ),
];
