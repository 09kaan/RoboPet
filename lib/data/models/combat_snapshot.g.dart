// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combat_snapshot.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCombatSnapshotCollection on Isar {
  IsarCollection<CombatSnapshot> get combatSnapshots => this.collection();
}

const CombatSnapshotSchema = CollectionSchema(
  name: r'CombatSnapshot',
  id: 4129541001345168742,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'equippedDefIds': PropertySchema(
      id: 1,
      name: r'equippedDefIds',
      type: IsarType.stringList,
    ),
    r'ownerUid': PropertySchema(
      id: 2,
      name: r'ownerUid',
      type: IsarType.string,
    ),
    r'resolvedAttack': PropertySchema(
      id: 3,
      name: r'resolvedAttack',
      type: IsarType.long,
    ),
    r'resolvedDefense': PropertySchema(
      id: 4,
      name: r'resolvedDefense',
      type: IsarType.long,
    ),
    r'resolvedHp': PropertySchema(
      id: 5,
      name: r'resolvedHp',
      type: IsarType.long,
    ),
    r'resolvedSpeed': PropertySchema(
      id: 6,
      name: r'resolvedSpeed',
      type: IsarType.long,
    ),
    r'robotInstanceId': PropertySchema(
      id: 7,
      name: r'robotInstanceId',
      type: IsarType.string,
    ),
    r'schemaVersion': PropertySchema(
      id: 8,
      name: r'schemaVersion',
      type: IsarType.long,
    ),
    r'snapshotId': PropertySchema(
      id: 9,
      name: r'snapshotId',
      type: IsarType.string,
    )
  },
  estimateSize: _combatSnapshotEstimateSize,
  serialize: _combatSnapshotSerialize,
  deserialize: _combatSnapshotDeserialize,
  deserializeProp: _combatSnapshotDeserializeProp,
  idName: r'id',
  indexes: {
    r'snapshotId': IndexSchema(
      id: -7574188874426247601,
      name: r'snapshotId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'snapshotId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _combatSnapshotGetId,
  getLinks: _combatSnapshotGetLinks,
  attach: _combatSnapshotAttach,
  version: '3.1.0+1',
);

int _combatSnapshotEstimateSize(
  CombatSnapshot object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.equippedDefIds.length * 3;
  {
    for (var i = 0; i < object.equippedDefIds.length; i++) {
      final value = object.equippedDefIds[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.ownerUid.length * 3;
  bytesCount += 3 + object.robotInstanceId.length * 3;
  bytesCount += 3 + object.snapshotId.length * 3;
  return bytesCount;
}

void _combatSnapshotSerialize(
  CombatSnapshot object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeStringList(offsets[1], object.equippedDefIds);
  writer.writeString(offsets[2], object.ownerUid);
  writer.writeLong(offsets[3], object.resolvedAttack);
  writer.writeLong(offsets[4], object.resolvedDefense);
  writer.writeLong(offsets[5], object.resolvedHp);
  writer.writeLong(offsets[6], object.resolvedSpeed);
  writer.writeString(offsets[7], object.robotInstanceId);
  writer.writeLong(offsets[8], object.schemaVersion);
  writer.writeString(offsets[9], object.snapshotId);
}

CombatSnapshot _combatSnapshotDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CombatSnapshot();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.equippedDefIds = reader.readStringList(offsets[1]) ?? [];
  object.id = id;
  object.ownerUid = reader.readString(offsets[2]);
  object.resolvedAttack = reader.readLong(offsets[3]);
  object.resolvedDefense = reader.readLong(offsets[4]);
  object.resolvedHp = reader.readLong(offsets[5]);
  object.resolvedSpeed = reader.readLong(offsets[6]);
  object.robotInstanceId = reader.readString(offsets[7]);
  object.schemaVersion = reader.readLong(offsets[8]);
  object.snapshotId = reader.readString(offsets[9]);
  return object;
}

P _combatSnapshotDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _combatSnapshotGetId(CombatSnapshot object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _combatSnapshotGetLinks(CombatSnapshot object) {
  return [];
}

void _combatSnapshotAttach(
    IsarCollection<dynamic> col, Id id, CombatSnapshot object) {
  object.id = id;
}

extension CombatSnapshotByIndex on IsarCollection<CombatSnapshot> {
  Future<CombatSnapshot?> getBySnapshotId(String snapshotId) {
    return getByIndex(r'snapshotId', [snapshotId]);
  }

  CombatSnapshot? getBySnapshotIdSync(String snapshotId) {
    return getByIndexSync(r'snapshotId', [snapshotId]);
  }

  Future<bool> deleteBySnapshotId(String snapshotId) {
    return deleteByIndex(r'snapshotId', [snapshotId]);
  }

  bool deleteBySnapshotIdSync(String snapshotId) {
    return deleteByIndexSync(r'snapshotId', [snapshotId]);
  }

  Future<List<CombatSnapshot?>> getAllBySnapshotId(
      List<String> snapshotIdValues) {
    final values = snapshotIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'snapshotId', values);
  }

  List<CombatSnapshot?> getAllBySnapshotIdSync(List<String> snapshotIdValues) {
    final values = snapshotIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'snapshotId', values);
  }

  Future<int> deleteAllBySnapshotId(List<String> snapshotIdValues) {
    final values = snapshotIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'snapshotId', values);
  }

  int deleteAllBySnapshotIdSync(List<String> snapshotIdValues) {
    final values = snapshotIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'snapshotId', values);
  }

  Future<Id> putBySnapshotId(CombatSnapshot object) {
    return putByIndex(r'snapshotId', object);
  }

  Id putBySnapshotIdSync(CombatSnapshot object, {bool saveLinks = true}) {
    return putByIndexSync(r'snapshotId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySnapshotId(List<CombatSnapshot> objects) {
    return putAllByIndex(r'snapshotId', objects);
  }

  List<Id> putAllBySnapshotIdSync(List<CombatSnapshot> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'snapshotId', objects, saveLinks: saveLinks);
  }
}

extension CombatSnapshotQueryWhereSort
    on QueryBuilder<CombatSnapshot, CombatSnapshot, QWhere> {
  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CombatSnapshotQueryWhere
    on QueryBuilder<CombatSnapshot, CombatSnapshot, QWhereClause> {
  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterWhereClause>
      snapshotIdEqualTo(String snapshotId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'snapshotId',
        value: [snapshotId],
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterWhereClause>
      snapshotIdNotEqualTo(String snapshotId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'snapshotId',
              lower: [],
              upper: [snapshotId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'snapshotId',
              lower: [snapshotId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'snapshotId',
              lower: [snapshotId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'snapshotId',
              lower: [],
              upper: [snapshotId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CombatSnapshotQueryFilter
    on QueryBuilder<CombatSnapshot, CombatSnapshot, QFilterCondition> {
  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      equippedDefIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equippedDefIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      equippedDefIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'equippedDefIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      equippedDefIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'equippedDefIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      equippedDefIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'equippedDefIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      equippedDefIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'equippedDefIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      equippedDefIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'equippedDefIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      equippedDefIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'equippedDefIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      equippedDefIdsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'equippedDefIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      equippedDefIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equippedDefIds',
        value: '',
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      equippedDefIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'equippedDefIds',
        value: '',
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      equippedDefIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'equippedDefIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      equippedDefIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'equippedDefIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      equippedDefIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'equippedDefIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      equippedDefIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'equippedDefIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      equippedDefIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'equippedDefIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      equippedDefIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'equippedDefIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      ownerUidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      ownerUidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ownerUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      ownerUidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ownerUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      ownerUidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ownerUid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      ownerUidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ownerUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      ownerUidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ownerUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      ownerUidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ownerUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      ownerUidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ownerUid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      ownerUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerUid',
        value: '',
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      ownerUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ownerUid',
        value: '',
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      resolvedAttackEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resolvedAttack',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      resolvedAttackGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resolvedAttack',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      resolvedAttackLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resolvedAttack',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      resolvedAttackBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resolvedAttack',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      resolvedDefenseEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resolvedDefense',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      resolvedDefenseGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resolvedDefense',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      resolvedDefenseLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resolvedDefense',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      resolvedDefenseBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resolvedDefense',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      resolvedHpEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resolvedHp',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      resolvedHpGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resolvedHp',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      resolvedHpLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resolvedHp',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      resolvedHpBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resolvedHp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      resolvedSpeedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resolvedSpeed',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      resolvedSpeedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resolvedSpeed',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      resolvedSpeedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resolvedSpeed',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      resolvedSpeedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resolvedSpeed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      robotInstanceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'robotInstanceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      robotInstanceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'robotInstanceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      robotInstanceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'robotInstanceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      robotInstanceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'robotInstanceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      robotInstanceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'robotInstanceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      robotInstanceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'robotInstanceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      robotInstanceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'robotInstanceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      robotInstanceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'robotInstanceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      robotInstanceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'robotInstanceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      robotInstanceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'robotInstanceId',
        value: '',
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      schemaVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'schemaVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      schemaVersionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'schemaVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      schemaVersionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'schemaVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      schemaVersionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'schemaVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      snapshotIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'snapshotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      snapshotIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'snapshotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      snapshotIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'snapshotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      snapshotIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'snapshotId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      snapshotIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'snapshotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      snapshotIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'snapshotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      snapshotIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'snapshotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      snapshotIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'snapshotId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      snapshotIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'snapshotId',
        value: '',
      ));
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterFilterCondition>
      snapshotIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'snapshotId',
        value: '',
      ));
    });
  }
}

extension CombatSnapshotQueryObject
    on QueryBuilder<CombatSnapshot, CombatSnapshot, QFilterCondition> {}

extension CombatSnapshotQueryLinks
    on QueryBuilder<CombatSnapshot, CombatSnapshot, QFilterCondition> {}

extension CombatSnapshotQuerySortBy
    on QueryBuilder<CombatSnapshot, CombatSnapshot, QSortBy> {
  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy> sortByOwnerUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerUid', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      sortByOwnerUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerUid', Sort.desc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      sortByResolvedAttack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedAttack', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      sortByResolvedAttackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedAttack', Sort.desc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      sortByResolvedDefense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedDefense', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      sortByResolvedDefenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedDefense', Sort.desc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      sortByResolvedHp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedHp', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      sortByResolvedHpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedHp', Sort.desc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      sortByResolvedSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedSpeed', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      sortByResolvedSpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedSpeed', Sort.desc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      sortByRobotInstanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'robotInstanceId', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      sortByRobotInstanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'robotInstanceId', Sort.desc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      sortBySchemaVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemaVersion', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      sortBySchemaVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemaVersion', Sort.desc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      sortBySnapshotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snapshotId', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      sortBySnapshotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snapshotId', Sort.desc);
    });
  }
}

extension CombatSnapshotQuerySortThenBy
    on QueryBuilder<CombatSnapshot, CombatSnapshot, QSortThenBy> {
  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy> thenByOwnerUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerUid', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      thenByOwnerUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerUid', Sort.desc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      thenByResolvedAttack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedAttack', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      thenByResolvedAttackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedAttack', Sort.desc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      thenByResolvedDefense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedDefense', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      thenByResolvedDefenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedDefense', Sort.desc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      thenByResolvedHp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedHp', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      thenByResolvedHpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedHp', Sort.desc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      thenByResolvedSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedSpeed', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      thenByResolvedSpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedSpeed', Sort.desc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      thenByRobotInstanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'robotInstanceId', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      thenByRobotInstanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'robotInstanceId', Sort.desc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      thenBySchemaVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemaVersion', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      thenBySchemaVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemaVersion', Sort.desc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      thenBySnapshotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snapshotId', Sort.asc);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QAfterSortBy>
      thenBySnapshotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snapshotId', Sort.desc);
    });
  }
}

extension CombatSnapshotQueryWhereDistinct
    on QueryBuilder<CombatSnapshot, CombatSnapshot, QDistinct> {
  QueryBuilder<CombatSnapshot, CombatSnapshot, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QDistinct>
      distinctByEquippedDefIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equippedDefIds');
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QDistinct> distinctByOwnerUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownerUid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QDistinct>
      distinctByResolvedAttack() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resolvedAttack');
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QDistinct>
      distinctByResolvedDefense() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resolvedDefense');
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QDistinct>
      distinctByResolvedHp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resolvedHp');
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QDistinct>
      distinctByResolvedSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resolvedSpeed');
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QDistinct>
      distinctByRobotInstanceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'robotInstanceId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QDistinct>
      distinctBySchemaVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'schemaVersion');
    });
  }

  QueryBuilder<CombatSnapshot, CombatSnapshot, QDistinct> distinctBySnapshotId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'snapshotId', caseSensitive: caseSensitive);
    });
  }
}

extension CombatSnapshotQueryProperty
    on QueryBuilder<CombatSnapshot, CombatSnapshot, QQueryProperty> {
  QueryBuilder<CombatSnapshot, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CombatSnapshot, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CombatSnapshot, List<String>, QQueryOperations>
      equippedDefIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equippedDefIds');
    });
  }

  QueryBuilder<CombatSnapshot, String, QQueryOperations> ownerUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownerUid');
    });
  }

  QueryBuilder<CombatSnapshot, int, QQueryOperations> resolvedAttackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resolvedAttack');
    });
  }

  QueryBuilder<CombatSnapshot, int, QQueryOperations>
      resolvedDefenseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resolvedDefense');
    });
  }

  QueryBuilder<CombatSnapshot, int, QQueryOperations> resolvedHpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resolvedHp');
    });
  }

  QueryBuilder<CombatSnapshot, int, QQueryOperations> resolvedSpeedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resolvedSpeed');
    });
  }

  QueryBuilder<CombatSnapshot, String, QQueryOperations>
      robotInstanceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'robotInstanceId');
    });
  }

  QueryBuilder<CombatSnapshot, int, QQueryOperations> schemaVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'schemaVersion');
    });
  }

  QueryBuilder<CombatSnapshot, String, QQueryOperations> snapshotIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'snapshotId');
    });
  }
}
