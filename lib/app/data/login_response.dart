// To parse this JSON data, do
//
//     final loginResp = loginRespFromJson(jsonString);

// To parse this JSON data, do
//
//     final loginResp = loginRespFromJson(jsonString);

import 'dart:convert';

LoginResp loginRespFromJson(String str) => LoginResp.fromJson(json.decode(str));

String loginRespToJson(LoginResp data) => json.encode(data.toJson());

class LoginResp {
  LoginResp({
    required this.success,
    required this.message,
    required this.data,
  });

  String success;
  String message;
  List<Datum> data;

  factory LoginResp.fromJson(Map<String, dynamic> json) => LoginResp(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.name,
    this.dob,
    this.gender,
    this.phone,
    this.jdId,
    this.qualification,
    this.maritalStatusId,
    this.religionId,
    this.address,
    this.experience,
    this.email,
    this.password,
    this.employeeId,
    this.branchId,
    this.departmentId,
    this.subdepartmentId,
    this.designationId,
    this.categoryId,
    this.companyDoj,
    this.documents,
    this.accountHolderName,
    this.accountNumber,
    this.bankName,
    this.ifscCode,
    this.branchLocation,
    this.aadhaarNo,
    this.panNo,
    this.voterIdNo,
    this.drivingLicenceNo,
    this.uanNo,
    this.esiNo,
    this.taxPayerId,
    this.salaryType,
    this.salary,
    this.isDa,
    this.isPf,
    this.isEsi,
    this.staffCategoryId,
    this.holidayEligible,
    this.isActive,
    this.clBal,
    this.siklBal,
    this.plBal,
    this.status,
    this.noticePrd,
    this.regnDate,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? userId;
  String? name;
  DateTime? dob;
  String? gender;
  String? phone;
  dynamic? jdId;
  String? qualification;
  dynamic? maritalStatusId;
  dynamic? religionId;
  String? address;
  String? experience;
  String? email;
  String? password;
  String? employeeId;
  String? branchId;
  String? departmentId;
  String? subdepartmentId;
  String? designationId;
  String? categoryId;
  DateTime? companyDoj;
  dynamic? documents;
  String? accountHolderName;
  String? accountNumber;
  String? bankName;
  String? ifscCode;
  dynamic? branchLocation;
  String? aadhaarNo;
  dynamic? panNo;
  String? voterIdNo;
  String? drivingLicenceNo;
  String? uanNo;
  dynamic? esiNo;
  dynamic? taxPayerId;
  String? salaryType;
  String? salary;
  String? isDa;
  String? isPf;
  String? isEsi;
  String? staffCategoryId;
  String? holidayEligible;
  String? isActive;
  String? clBal;
  String? siklBal;
  String? plBal;
  String? status;
  dynamic? noticePrd;
  String? regnDate;
  String? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
        phone: json["phone"],
        jdId: json["jd_id"],
        qualification: json["qualification"],
        maritalStatusId: json["marital_status_id"],
        religionId: json["religion_id"],
        address: json["address"],
        experience: json["experience"],
        email: json["email"],
        password: json["password"],
        employeeId: json["employee_id"],
        branchId: json["branch_id"],
        departmentId: json["department_id"],
        subdepartmentId: json["subdepartment_id"],
        designationId: json["designation_id"],
        categoryId: json["category_id"],
        companyDoj: DateTime.parse(json["company_doj"]),
        documents: json["documents"],
        accountHolderName: json["account_holder_name"],
        accountNumber: json["account_number"],
        bankName: json["bank_name"],
        ifscCode: json["ifsc_code"],
        branchLocation: json["branch_location"],
        aadhaarNo: json["aadhaar_no"],
        panNo: json["pan_no"],
        voterIdNo: json["voter_id_no"],
        drivingLicenceNo: json["driving_licence_no"],
        uanNo: json["uan_no"],
        esiNo: json["esi_no"],
        taxPayerId: json["tax_payer_id"],
        salaryType: json["salary_type"],
        salary: json["salary"],
        isDa: json["is_da"],
        isPf: json["is_pf"],
        isEsi: json["is_esi"],
        staffCategoryId: json["staff_category_id"],
        holidayEligible: json["holiday_eligible"],
        isActive: json["is_active"],
        clBal: json["cl_bal"],
        siklBal: json["sikl_bal"],
        plBal: json["pl_bal"],
        status: json["status"],
        noticePrd: json["notice_prd"],
        regnDate: json["regn_date"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "dob":
            "${dob?.year.toString().padLeft(4, '0')}-${dob?.month.toString().padLeft(2, '0')}-${dob?.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "phone": phone,
        "jd_id": jdId,
        "qualification": qualification,
        "marital_status_id": maritalStatusId,
        "religion_id": religionId,
        "address": address,
        "experience": experience,
        "email": email,
        "password": password,
        "employee_id": employeeId,
        "branch_id": branchId,
        "department_id": departmentId,
        "subdepartment_id": subdepartmentId,
        "designation_id": designationId,
        "category_id": categoryId,
        "company_doj":
            "${companyDoj?.year.toString().padLeft(4, '0')}-${companyDoj?.month.toString().padLeft(2, '0')}-${companyDoj?.day.toString().padLeft(2, '0')}",
        "documents": documents,
        "account_holder_name": accountHolderName,
        "account_number": accountNumber,
        "bank_name": bankName,
        "ifsc_code": ifscCode,
        "branch_location": branchLocation,
        "aadhaar_no": aadhaarNo,
        "pan_no": panNo,
        "voter_id_no": voterIdNo,
        "driving_licence_no": drivingLicenceNo,
        "uan_no": uanNo,
        "esi_no": esiNo,
        "tax_payer_id": taxPayerId,
        "salary_type": salaryType,
        "salary": salary,
        "is_da": isDa,
        "is_pf": isPf,
        "is_esi": isEsi,
        "staff_category_id": staffCategoryId,
        "holiday_eligible": holidayEligible,
        "is_active": isActive,
        "cl_bal": clBal,
        "sikl_bal": siklBal,
        "pl_bal": plBal,
        "status": status,
        "notice_prd": noticePrd,
        "regn_date": regnDate,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
