import 'package:floor/floor.dart';

@Entity(tableName: 'Wallet', primaryKeys: ['id'])
class Wallet {
  final int id;

  @ColumnInfo(name: 'name_wallet')
  final String name;
  final String balance;

  Wallet(this.id, this.name, this.balance);
}
