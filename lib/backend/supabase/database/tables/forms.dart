import '../database.dart';

class FormsTable extends SupabaseTable<FormsRow> {
  @override
  String get tableName => 'forms';

  @override
  FormsRow createRow(Map<String, dynamic> data) => FormsRow(data);
}

class FormsRow extends SupabaseDataRow {
  FormsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FormsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get url => getField<String>('url');
  set url(String? value) => setField<String>('url', value);

  bool get active => getField<bool>('active')!;
  set active(bool value) => setField<bool>('active', value);

  String get authorUserId => getField<String>('author_user_id')!;
  set authorUserId(String value) => setField<String>('author_user_id', value);

  int? get comments => getField<int>('comments');
  set comments(int? value) => setField<int>('comments', value);

  String? get authorFirstName => getField<String>('author_first_name');
  set authorFirstName(String? value) =>
      setField<String>('author_first_name', value);

  String? get authorLastName => getField<String>('author_last_name');
  set authorLastName(String? value) =>
      setField<String>('author_last_name', value);
}
