import 'package:floor/floor.dart';

@Entity(tableName: 'wallet')
class Wallet {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String name;
  final String ammunt;

  Wallet({this.name, this.ammunt, this.id});
}
