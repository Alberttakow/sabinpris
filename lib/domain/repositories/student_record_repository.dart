import 'package:sabinpris/domain/entity/student_record.dart';

abstract class StudentRecordRepository {
  Future<StudentRecord> registerStudent(StudentRecord record);
  Future<StudentRecord> updateFees(int recordId, int fees);
}