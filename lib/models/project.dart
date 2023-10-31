
class Project {
    int? projectId;
    String? projectName;
    String? image;
    int? targetCapital;
    double? sharedRevenue;
    double? mutiplier;
    int? duration;
    int? capital;
    String? brand;
    String? startDate;
    String? endDate;
    String? status;
    int? numberOfStage;
    String? projectDescription;
    int? areaId;
    String? areaName;
    int? fieldId;
    String? fieldName;
    int? investmentTargetCapital;
    int? paidAmount;
    int? remainingAmount;
    String? businessLicense;

    Project({this.projectId, this.projectName, this.image, this.targetCapital, this.sharedRevenue, this.mutiplier, this.duration, this.capital, this.brand, this.startDate, this.endDate, this.status, this.numberOfStage, this.projectDescription, this.areaId, this.areaName, this.fieldId, this.fieldName, this.investmentTargetCapital, this.paidAmount, this.remainingAmount, this.businessLicense});

    Project.fromJson(Map<String, dynamic> json) {
        projectId = json["projectId"];
        projectName = json["projectName"];
        image = json["image"];
        targetCapital = json["targetCapital"];
        sharedRevenue = json["sharedRevenue"];
        mutiplier = json["mutiplier"];
        duration = json["duration"];
        capital = json["capital"];
        brand = json["brand"];
        startDate = json["startDate"];
        endDate = json["endDate"];
        status = json["status"];
        numberOfStage = json["numberOfStage"];
        projectDescription = json["projectDescription"];
        areaId = json["areaId"];
        areaName = json["areaName"];
        fieldId = json["fieldId"];
        fieldName = json["fieldName"];
        investmentTargetCapital = json["investmentTargetCapital"];
        paidAmount = json["paidAmount"];
        remainingAmount = json["remainingAmount"];
        businessLicense = json["businessLicense"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["projectId"] = projectId;
        _data["projectName"] = projectName;
        _data["image"] = image;
        _data["targetCapital"] = targetCapital;
        _data["sharedRevenue"] = sharedRevenue;
        _data["mutiplier"] = mutiplier;
        _data["duration"] = duration;
        _data["capital"] = capital;
        _data["brand"] = brand;
        _data["startDate"] = startDate;
        _data["endDate"] = endDate;
        _data["status"] = status;
        _data["numberOfStage"] = numberOfStage;
        _data["projectDescription"] = projectDescription;
        _data["areaId"] = areaId;
        _data["areaName"] = areaName;
        _data["fieldId"] = fieldId;
        _data["fieldName"] = fieldName;
        _data["investmentTargetCapital"] = investmentTargetCapital;
        _data["paidAmount"] = paidAmount;
        _data["remainingAmount"] = remainingAmount;
        _data["businessLicense"] = businessLicense;
        return _data;
    }
}