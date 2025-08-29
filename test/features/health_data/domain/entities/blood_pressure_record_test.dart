import 'package:flutter_test/flutter_test.dart';
import 'package:vitals/features/health_data/domain/entities/blood_pressure_record.dart';

void main() {
  group('BloodPressureRecord', () {
    test('should create blood pressure record with required fields', () {
      // Given
      const id = 'test_id';
      const patientId = 'patient_1';
      const systolic = 120;
      const diastolic = 80;
      final recordedAt = DateTime(2024, 1, 1);

      // When
      final record = BloodPressureRecord(
        id: id,
        patientId: patientId,
        systolic: systolic,
        diastolic: diastolic,
        recordedAt: recordedAt,
      );

      // Then
      expect(record.id, id);
      expect(record.patientId, patientId);
      expect(record.systolic, systolic);
      expect(record.diastolic, diastolic);
      expect(record.recordedAt, recordedAt);
      expect(record.heartRate, null);
      expect(record.notes, null);
      expect(record.level, null);
      expect(record.source, null);
    });

    test('should create blood pressure record with optional fields', () {
      // Given
      const heartRate = 75;
      const notes = 'Morning measurement';
      const source = MeasurementSource.manual;

      // When
      final record = BloodPressureRecord(
        id: 'test_id',
        patientId: 'patient_1',
        systolic: 120,
        diastolic: 80,
        recordedAt: DateTime(2024, 1, 1),
        heartRate: heartRate,
        notes: notes,
        source: source,
      );

      // Then
      expect(record.heartRate, heartRate);
      expect(record.notes, notes);
      expect(record.source, source);
    });

    test('should calculate blood pressure level correctly', () {
      // Test normal blood pressure
      final normalRecord = BloodPressureRecord(
        id: '1',
        patientId: 'patient_1',
        systolic: 115,
        diastolic: 75,
        recordedAt: DateTime(2024, 1, 1),
      );
      expect(normalRecord.calculatedLevel, BloodPressureLevel.normal);

      // Test elevated blood pressure
      final elevatedRecord = BloodPressureRecord(
        id: '2',
        patientId: 'patient_1',
        systolic: 125,
        diastolic: 75,
        recordedAt: DateTime(2024, 1, 1),
      );
      expect(elevatedRecord.calculatedLevel, BloodPressureLevel.elevated);

      // Test stage 1 hypertension
      final stage1Record = BloodPressureRecord(
        id: '3',
        patientId: 'patient_1',
        systolic: 135,
        diastolic: 85,
        recordedAt: DateTime(2024, 1, 1),
      );
      expect(stage1Record.calculatedLevel, BloodPressureLevel.stage1);

      // Test stage 2 hypertension
      final stage2Record = BloodPressureRecord(
        id: '4',
        patientId: 'patient_1',
        systolic: 145,
        diastolic: 95,
        recordedAt: DateTime(2024, 1, 1),
      );
      expect(stage2Record.calculatedLevel, BloodPressureLevel.stage2);

      // Test crisis
      final crisisRecord = BloodPressureRecord(
        id: '5',
        patientId: 'patient_1',
        systolic: 185,
        diastolic: 115,
        recordedAt: DateTime(2024, 1, 1),
      );
      expect(crisisRecord.calculatedLevel, BloodPressureLevel.crisis);
    });

    test('should support JSON serialization', () {
      // Given
      final record = BloodPressureRecord(
        id: 'test_id',
        patientId: 'patient_1',
        systolic: 120,
        diastolic: 80,
        recordedAt: DateTime(2024, 1, 1, 10, 30),
        heartRate: 75,
        notes: 'Test note',
        source: MeasurementSource.manual,
      );

      // When
      final json = record.toJson();
      final fromJson = BloodPressureRecord.fromJson(json);

      // Then
      expect(fromJson, record);
      expect(json['systolic'], 120);
      expect(json['diastolic'], 80);
      expect(json['heartRate'], 75);
      expect(json['notes'], 'Test note');
      expect(json['source'], 'manual');
    });
  });
}
