import 'package:floor/floor.dart';

@Entity(tableName: 'wallet', primaryKeys: ['id'])
class Wallet {
  final int id;

  @ColumnInfo(name: 'name_wallet')
  final String name;

  @ColumnInfo(name: 'balance')
  final String balance;

  @ColumnInfo(name: 'is_active')
  final int isActive;

  @ColumnInfo(name: 'icon')
  final String icon;

  @ColumnInfo(name: 'is_appear')
  final int isAppear;

  Wallet(this.id, this.name, this.balance, this.isActive, this.icon, this.isAppear);
}
