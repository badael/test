import 'package:floor/floor.dart';
import 'package:floor_test_2/models/wallet.dart';

@Entity(tableName: 'Currency', foreignKeys: [
  ForeignKey(
    entity: Wallet,
    childColumns: ['walletId'],
    parentColumns: ['id'],
  )
])
class Currency {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final String name;
  final int walletId;

  Currency({this.name, this.id, this.walletId});
}
