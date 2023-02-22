

class LeaveModel {
  String Reason;
  String Category;
  String Status;
  String LeaveFrom;
  String LeaveTo;
  String? ResonDes;
  bool sts;

  LeaveModel(
      {required this.Status,
      required this.Reason,
      required this.Category,
      required this.LeaveFrom,
      required this.LeaveTo,
      this.ResonDes,
      required this.sts});
}

List<LeaveModel> Leavefieldd = <LeaveModel>[
  LeaveModel(
      sts: true,
      Status: 'Pending',
      Reason: 'Going on Trip',
      Category: 'Casual Leave',
      LeaveFrom: 'Jan 5, 2023',
      LeaveTo: 'Jan 25, 2023',
      ResonDes:
          'i am  going for a trip to Goa.Kindly grant me leave for the same'),
  LeaveModel(
      sts: false,
      Status: 'Approved',
      Reason: 'Suffering From Cold',
      Category: 'SicK Leave',
      LeaveFrom: 'Nov 8,2022',
      LeaveTo: 'Nov 7, 2022'),
  LeaveModel(
      sts: false,
      Status: 'Approved',
      Reason: 'Suffering From Cold',
      Category: 'SicK Leave',
      LeaveFrom: 'Nov 8,2022',
      LeaveTo: 'Nov 7, 2022'),
  LeaveModel(
      sts: false,
      Status: 'Approved',
      Reason: 'Suffering From Cold',
      Category: 'SicK Leave',
      LeaveFrom: 'Nov 8,2022',
      LeaveTo: 'Nov 7, 2022'),
  LeaveModel(
      sts: false,
      Status: 'Approved',
      Reason: 'Suffering From Cold',
      Category: 'SicK Leave',
      LeaveFrom: 'Nov 8,2022',
      LeaveTo: 'Nov 7, 2022'),
  LeaveModel(
      sts: false,
      Status: 'Approved',
      Reason: 'Suffering From Cold',
      Category: 'SicK Leave',
      LeaveFrom: 'Nov 8,2022',
      LeaveTo: 'Nov 7, 2022'),
];
