import '../database.dart';

class UserPostsTable extends SupabaseTable<UserPostsRow> {
  @override
  String get tableName => 'user_posts';

  @override
  UserPostsRow createRow(Map<String, dynamic> data) => UserPostsRow(data);
}

class UserPostsRow extends SupabaseDataRow {
  UserPostsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserPostsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get authorFirstName => getField<String>('author_first_name');
  set authorFirstName(String? value) =>
      setField<String>('author_first_name', value);

  String? get authorLastName => getField<String>('author_last_name');
  set authorLastName(String? value) =>
      setField<String>('author_last_name', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  int? get comments => getField<int>('comments');
  set comments(int? value) => setField<int>('comments', value);

  bool get active => getField<bool>('active')!;
  set active(bool value) => setField<bool>('active', value);

  String get authorUserId => getField<String>('author_user_id')!;
  set authorUserId(String value) => setField<String>('author_user_id', value);

  int? get likes => getField<int>('likes');
  set likes(int? value) => setField<int>('likes', value);

  String? get postImage => getField<String>('post_image');
  set postImage(String? value) => setField<String>('post_image', value);

  String? get authorProfileImage => getField<String>('author_profile_image');
  set authorProfileImage(String? value) =>
      setField<String>('author_profile_image', value);
}
