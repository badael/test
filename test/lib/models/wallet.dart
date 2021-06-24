import 'package:floor/floor.dart';

@Entity(tableName: 'wallet', primaryKeys: ['id'])
class Wallet {
  final int id;

  @ColumnInfo(name: 'name_wallet')
  final String name;

  Wallet(this.id, this.name);
}
