import 'package:sqfentity_gen/sqfentity_gen.dart';

const user = SqfEntityTable(
  tableName: 'user',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  useSoftDeleting: true,
  fields: [
    SqfEntityField('name', DbType.text),
    SqfEntityField('description', DbType.text),
    SqfEntityField('salary', DbType.real, defaultValue: 0),
  ],
);
const userTable = SqfEntityTable(
  tableName: 'user_table',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  useSoftDeleting: true,
  fields: [
    SqfEntityField('name', DbType.text),
    SqfEntityField('userId', DbType.text),
  ],
);
