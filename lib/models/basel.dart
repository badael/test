import 'package:floor/floor.dart';
import 'package:test_database_floor/models/wallet.dart';

@Entity(
  tableName: 'basel',
  foreignKeys: [
    ForeignKey(
      childColumns: ['owner_id'],
      parentColumns: ['id'],
      entity: Wallet,
    )
  ],
)
class Basel {
  @PrimaryKey()
  final int id;

  final String name;

  @ColumnInfo(name: 'owner_id')
  final int ownerId;

  Basel(this.id, this.name, this.ownerId);
}
