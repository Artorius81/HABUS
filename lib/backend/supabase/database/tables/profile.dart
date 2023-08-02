import '../database.dart';

class ProfileTable extends SupabaseTable<ProfileRow> {
  @override
  String get tableName => 'profile';

  @override
  ProfileRow createRow(Map<String, dynamic> data) => ProfileRow(data);
}

class ProfileRow extends SupabaseDataRow {
  ProfileRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfileTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get group => getField<String>('group');
  set group(String? value) => setField<String>('group', value);

  String? get department => getField<String>('department');
  set department(String? value) => setField<String>('department', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);
}
