import 'package:floor/floor.dart';
import 'package:test_database_floor/models/wallet.dart';

@Entity(
  tableName: 'Currency',
  foreignKeys: [
    ForeignKey(
      childColumns: ['owner_id'],
      parentColumns: ['id'],
      entity: Wallet,
    )
  ],
)
class Currency {
  @PrimaryKey()
  final int id;

  final String name;
  final String image;

  @ColumnInfo(name: 'owner_id')
  final int ownerId;

  Currency(this.id, this.name, this.ownerId, this.image);
}
