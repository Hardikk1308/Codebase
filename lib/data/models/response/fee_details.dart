class FeeResponse {
  FeeDetails feeDetails;

  FeeResponse({
    required this.feeDetails,
  });

  factory FeeResponse.fromJson(Map<String, dynamic> json) {
    return FeeResponse(
      feeDetails: FeeDetails.fromJson(json['feeDetails']),
    );
  }
}

class FeeDetails {
  final int studentId;
  final String studentName;
  final String gradeName;
  final String sectionName;
  final FeeSummary feeSummary;
  final List<InstallmentDetails> installmentDetailsList;

  FeeDetails({
    required this.studentId,
    required this.studentName,
    required this.gradeName,
    required this.sectionName,
    required this.feeSummary,
    required this.installmentDetailsList,
  });

  factory FeeDetails.fromJson(Map<String, dynamic> json) {
    return FeeDetails(
      studentId: json['studentId'],
      studentName: json['studentName'],
      gradeName: json['gradeName'],
      sectionName: json['sectionName'],
      feeSummary: FeeSummary.fromJson(json['feeSummary']),
      installmentDetailsList: (json['installmentDetailsList'] as List)
          .map((e) => InstallmentDetails.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'studentId': studentId,
      'studentName': studentName,
      'gradeName': gradeName,
      'sectionName': sectionName,
      'feeSummary': feeSummary.toJson(),
      'installmentDetailsList':
      installmentDetailsList.map((e) => e.toJson()).toList(),
    };
  }
}

class FeeSummary {
  final double totalFees;
  final double totalPaid;
  final double totalUnpaid;
  final int totalInstallments;
  final int installmentsPaid;
  final int installmentsUnpaid;

  FeeSummary({
    required this.totalFees,
    required this.totalPaid,
    required this.totalUnpaid,
    required this.totalInstallments,
    required this.installmentsPaid,
    required this.installmentsUnpaid,
  });

  factory FeeSummary.fromJson(Map<String, dynamic> json) {
    return FeeSummary(
      totalFees: json['totalFees'],
      totalPaid: json['totalPaid'],
      totalUnpaid: json['totalUnpaid'],
      totalInstallments: json['totalInstallments'],
      installmentsPaid: json['installmentsPaid'],
      installmentsUnpaid: json['installmentsUnpaid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalFees': totalFees,
      'totalPaid': totalPaid,
      'totalUnpaid': totalUnpaid,
      'totalInstallments': totalInstallments,
      'installmentsPaid': installmentsPaid,
      'installmentsUnpaid': installmentsUnpaid,
    };
  }
}

class InstallmentDetails {
  final int installmentNo;
  final double installmentAmount;
  final String dueDate;
  final String installStatus;
  final String? paidDate;

  InstallmentDetails({
    required this.installmentNo,
    required this.installmentAmount,
    required this.dueDate,
    required this.installStatus,
    this.paidDate,
  });

  factory InstallmentDetails.fromJson(Map<String, dynamic> json) {
    return InstallmentDetails(
      installmentNo: json['installmentNo'],
      installmentAmount: json['installmentAmount'],
      dueDate: json['dueDate'],
      installStatus: json['installmentStatus'],
      paidDate: json['paidDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'installmentNo': installmentNo,
      'installmentAmount': installmentAmount,
      'dueDate': dueDate,
      'installmentStatus': installStatus,
      'paidDate': paidDate,
    };
  }
}
