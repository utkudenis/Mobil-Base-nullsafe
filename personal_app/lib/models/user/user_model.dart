class UserModel {
  late String id;

  late String language;

  late String companyCode;

  late int companyId;

  late String parentId;

  late String employeeId;

  late String firstName;

  late String lastName;

  late String username;

  late String fullName;

  late String gender;

  late String email;

  late String position;

  late String department;

  late String departmentId;

  late String location;

  late String country;

  late String timeZone;

  late DateTime hireDate;

  late bool active;

  late String imageUrl;

  late String uploadedImageUrl;

  late String createdBy;

  late DateTime createdAt;

  late String changedBy;

  late DateTime changedAt;

  late bool isDeleted;

  UserModel();

  @override
  String toString() {
    return 'UserModel[id=$id, language=$language, companyCode=$companyCode, companyId=$companyId, parentId=$parentId, employeeId=$employeeId, firstName=$firstName, lastName=$lastName, username=$username, fullName=$fullName, gender=$gender, email=$email, position=$position, department=$department, departmentId=$departmentId, location=$location, country=$country, timeZone=$timeZone, hireDate=$hireDate, active=$active, imageUrl=$imageUrl, uploadedImageUrl=$uploadedImageUrl, createdBy=$createdBy, createdAt=$createdAt, changedBy=$changedBy, changedAt=$changedAt, isDeleted=$isDeleted, ]';
  }

  UserModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    id = json['Id'];
    language = json['Language'];
    companyCode = json['CompanyCode'];
    companyId = json['CompanyId'];
    parentId = json['ParentId'];
    employeeId = json['EmployeeId'];
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
    hireDate = (json['HireDate'] == null ? null : DateTime.parse(json['HireDate']))!;
    active = json['Active'];
    uploadedImageUrl = json['UploadedImageUrl'];
    createdBy = json['CreatedBy'];
    createdAt = ((json['CreatedAt'] == null || json['CreatedAt'] == '') ? null : DateTime.parse(json['CreatedAt']))!;
    changedBy = json['ChangedBy'];
    changedAt = ((json['ChangedAt'] == null || json['ChangedAt'] == '') ? null : DateTime.parse(json['ChangedAt']))!;
    isDeleted = json['IsDeleted'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Language': language,
      'CompanyCode': companyCode,
      'CompanyId': companyId,
      'ParentId': parentId,
      'EmployeeId': employeeId,
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
      'HireDate': hireDate.toUtc().toIso8601String(),
      'Active': active,
      'ImageUrl': imageUrl,
      'UploadedImageUrl': uploadedImageUrl,
      'CreatedBy': createdBy,
      'CreatedAt': createdAt.toUtc().toIso8601String(),
      'ChangedBy': changedBy,
      'ChangedAt': changedAt.toUtc().toIso8601String(),
      'IsDeleted': isDeleted
    };
  }

  static List<UserModel> listFromJson(List<dynamic>? json) {
    List<UserModel> _list = List<UserModel>.empty(growable: true);
    return json == null ? _list : json.map((value) => new UserModel.fromJson(value)).toList();
  }

  static Map<String, UserModel> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, UserModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new UserModel.fromJson(value));
    }
    return map;
  }
}
