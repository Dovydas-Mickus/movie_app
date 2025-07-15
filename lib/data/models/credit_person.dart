class CreditPerson {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String creditId;
  final String department;
  final String job;

  CreditPerson({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.creditId,
    required this.department,
    required this.job,
  });

  factory CreditPerson.fromMap(Map<String, dynamic> map) {
    return CreditPerson(
      adult: map['adult'] ?? false,
      gender: map['gender'] ?? 0,
      id: map['id'] ?? 0,
      knownForDepartment: map['known_for_department'] ?? '',
      name: map['name'] ?? '',
      originalName: map['original_name'] ?? '',
      popularity: (map['popularity'] ?? 0).toDouble(),
      profilePath: map['profile_path'],
      creditId: map['credit_id'] ?? '',
      department: map['department'] ?? '',
      job: map['job'] ?? '',
    );
  }
}
