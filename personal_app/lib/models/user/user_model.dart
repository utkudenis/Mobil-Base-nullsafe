
class UserModel {
  String id;

  String hrbp;

  String language;

  String companyCode;

  int companyId;

  String parentId;

  String employeeId;

  String matrixManagerId;

  String firstName;

  String lastName;

  String username;

  String fullName;

  String gender;

  String email;

  String position;

  String department;

  String departmentId;

  String location;

  String country;

  String timeZone;

  DateTime hireDate;

  bool active;

  String custom01;

  String custom02;

  String custom04;

  String custom05;

  String custom09;

  String custom12;

  String custom13;

  String custom14;

  String imageUrl;

  String uploadedImageUrl;

  String createdBy;

  DateTime createdAt;

  String changedBy;

  DateTime changedAt;

  UserModel changedByNavigation;

  UserModel createdByNavigation;

  bool isDeleted;

  UserModel();

  @override
  String toString() {
    return 'UserModel[id=$id, hrbp=$hrbp, language=$language, companyCode=$companyCode, companyId=$companyId, parentId=$parentId, employeeId=$employeeId, matrixManagerId=$matrixManagerId, firstName=$firstName, lastName=$lastName, username=$username, fullName=$fullName, gender=$gender, email=$email, position=$position, department=$department, departmentId=$departmentId, location=$location, country=$country, timeZone=$timeZone, hireDate=$hireDate, active=$active, custom01=$custom01, custom02=$custom02, custom04=$custom04, custom05=$custom05, custom09=$custom09, custom12=$custom12, custom13=$custom13, custom14=$custom14, imageUrl=$imageUrl, uploadedImageUrl=$uploadedImageUrl, createdBy=$createdBy, createdAt=$createdAt, changedBy=$changedBy, changedAt=$changedAt, changedByNavigation=$changedByNavigation, createdByNavigation=$createdByNavigation, isDeleted=$isDeleted, ]';
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['Id'];
    hrbp = json['HRBP'];
    language = json['Language'];
    companyCode = json['CompanyCode'];
    companyId = json['CompanyId'];
    parentId = json['ParentId'];
    employeeId = json['EmployeeId'];
    matrixManagerId = json['MatrixManagerId'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    username = json['Username'];
    fullName = json['FullName'];
    gender = json['Gender'];
    email = json['Email'];
    position = json['Position'];
    department = json['Department'];
    departmentId = json['DepartmentId'];
    location = json['Location'];
    country = json['Country'];
    timeZone = json['TimeZone'];
    hireDate = json['HireDate'] == null ? null : DateTime.parse(json['HireDate']);
    active = json['Active'];
    custom01 = json['Custom01'];
    custom02 = json['Custom02'];
    custom04 = json['Custom04'];
    custom05 = json['Custom05'];
    custom09 = json['Custom09'];
    custom12 = json['Custom12'];
    custom13 = json['Custom13'];
    custom14 = json['Custom14'];
    imageUrl = json['ImageUrl'];
    uploadedImageUrl = json['UploadedImageUrl'];
    createdBy = json['CreatedBy'];
    createdAt = (json['CreatedAt'] == null || json['CreatedAt'] == '') ? null : DateTime.parse(json['CreatedAt']);
    changedBy = json['ChangedBy'];
    changedAt = (json['ChangedAt'] == null || json['ChangedAt'] == '') ? null : DateTime.parse(json['ChangedAt']);
    changedByNavigation = new UserModel.fromJson(json['ChangedByNavigation']);
    createdByNavigation = new UserModel.fromJson(json['CreatedByNavigation']);
    isDeleted = json['IsDeleted'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'HRBP': hrbp,
      'Language': language,
      'CompanyCode': companyCode,
      'CompanyId': companyId,
      'ParentId': parentId,
      'EmployeeId': employeeId,
      'MatrixManagerId': matrixManagerId,
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'FullName': fullName,
      'Gender': gender,
      'Email': email,
      'Position': position,
      'Department': department,
      'DepartmentId': departmentId,
      'Location': location,
      'Country': country,
      'TimeZone': timeZone,
      'HireDate': hireDate == null ? '' : hireDate.toUtc().toIso8601String(),
      'Active': active,
      'Custom01': custom01,
      'Custom02': custom02,
      'Custom04': custom04,
      'Custom05': custom05,
      'Custom09': custom09,
      'Custom12': custom12,
      'Custom13': custom13,
      'Custom14': custom14,
      'ImageUrl': imageUrl,
      'UploadedImageUrl': uploadedImageUrl,
      'CreatedBy': createdBy,
      'CreatedAt': createdAt == null ? '' : createdAt.toUtc().toIso8601String(),
      'ChangedBy': changedBy,
      'ChangedAt': changedAt == null ? '' : changedAt.toUtc().toIso8601String(),
      'ChangedByNavigation': changedByNavigation,
      'CreatedByNavigation': createdByNavigation,
      'IsDeleted': isDeleted
    };
  }

  static List<UserModel> listFromJson(List<dynamic> json) {
    List<UserModel> _list = List<UserModel>.empty(growable: true);
    return json == null ? _list : json.map((value) => new UserModel.fromJson(value)).toList();
  }

  static Map<String, UserModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, UserModel>();
    if (json != null && json.length > 0) {
      
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserModel.fromJson(value));
    }
    return map;
  }
}
