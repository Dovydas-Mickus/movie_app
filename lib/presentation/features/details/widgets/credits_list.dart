import 'package:flutter/material.dart';

import '../../../../data/models/credit_person.dart';

Widget buildCreditsList(List<CreditPerson> crew) {
  // Only include specific jobs
  const allowedJobs = {'Director', 'Story', 'Screenplay', 'Characters'};

  // Map of person name to their relevant jobs
  final Map<String, Set<String>> peopleRoles = {};

  for (var person in crew) {
    if (allowedJobs.contains(person.job)) {
      if (!peopleRoles.containsKey(person.name)) {
        peopleRoles[person.name] = {};
      }
      peopleRoles[person.name]!.add(person.job);
    }
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: peopleRoles.entries.map((entry) {
      final name = entry.key;
      final roles = entry.value.toList();

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              roles.join(', '),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}
