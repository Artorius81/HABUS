import '../database.dart';

class AchievementsTable extends SupabaseTable<AchievementsRow> {
  @override
  String get tableName => 'achievements';

  @override
  AchievementsRow createRow(Map<String, dynamic> data) => AchievementsRow(data);
}

class AchievementsRow extends SupabaseDataRow {
  AchievementsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AchievementsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get achivTitle => getField<String>('achiv_title');
  set achivTitle(String? value) => setField<String>('achiv_title', value);

  String? get achivDesc => getField<String>('achiv_desc');
  set achivDesc(String? value) => setField<String>('achiv_desc', value);

  String? get achivImage => getField<String>('achiv_image');
  set achivImage(String? value) => setField<String>('achiv_image', value);
}
