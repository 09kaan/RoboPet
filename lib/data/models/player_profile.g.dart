// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_profile.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlayerProfileCollection on Isar {
  IsarCollection<PlayerProfile> get playerProfiles => this.collection();
}

const PlayerProfileSchema = CollectionSchema(
  name: r'PlayerProfile',
  id: -7715882953709164590,
  properties: {
    r'activeRobotId': PropertySchema(
      id: 0,
      name: r'activeRobotId',
      type: IsarType.string,
    ),
    r'combatLevel': PropertySchema(
      id: 1,
      name: r'combatLevel',
      type: IsarType.long,
    ),
    r'currencies': PropertySchema(
      id: 2,
      name: r'currencies',
      type: IsarType.object,
      target: r'Currencies',
    ),
    r'displayName': PropertySchema(
      id: 3,
      name: r'displayName',
      type: IsarType.string,
    ),
    r'economyVersion': PropertySchema(
      id: 4,
      name: r'economyVersion',
      type: IsarType.long,
    ),
    r'epicPityCounter': PropertySchema(
      id: 5,
      name: r'epicPityCounter',
      type: IsarType.long,
    ),
    r'ownedDecor': PropertySchema(
      id: 6,
      name: r'ownedDecor',
      type: IsarType.stringList,
    ),
    r'playerId': PropertySchema(
      id: 7,
      name: r'playerId',
      type: IsarType.string,
    ),
    r'schemaVersion': PropertySchema(
      id: 8,
      name: r'schemaVersion',
      type: IsarType.long,
    )
  },
  estimateSize: _playerProfileEstimateSize,
  serialize: _playerProfileSerialize,
  deserialize: _playerProfileDeserialize,
  deserializeProp: _playerProfileDeserializeProp,
  idName: r'id',
  indexes: {
    r'playerId': IndexSchema(
      id: 8338580293383144444,
      name: r'playerId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'playerId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'Currencies': CurrenciesSchema},
  getId: _playerProfileGetId,
  getLinks: _playerProfileGetLinks,
  attach: _playerProfileAttach,
  version: '3.1.0+1',
);

int _playerProfileEstimateSize(
  PlayerProfile object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.activeRobotId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 +
      CurrenciesSchema.estimateSize(
          object.currencies, allOffsets[Currencies]!, allOffsets);
  bytesCount += 3 + object.displayName.length * 3;
  bytesCount += 3 + object.ownedDecor.length * 3;
  {
    for (var i = 0; i < object.ownedDecor.length; i++) {
      final value = object.ownedDecor[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.playerId.length * 3;
  return bytesCount;
}

void _playerProfileSerialize(
  PlayerProfile object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.activeRobotId);
  writer.writeLong(offsets[1], object.combatLevel);
  writer.writeObject<Currencies>(
    offsets[2],
    allOffsets,
    CurrenciesSchema.serialize,
    object.currencies,
  );
  writer.writeString(offsets[3], object.displayName);
  writer.writeLong(offsets[4], object.economyVersion);
  writer.writeLong(offsets[5], object.epicPityCounter);
  writer.writeStringList(offsets[6], object.ownedDecor);
  writer.writeString(offsets[7], object.playerId);
  writer.writeLong(offsets[8], object.schemaVersion);
}

PlayerProfile _playerProfileDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlayerProfile();
  object.activeRobotId = reader.readStringOrNull(offsets[0]);
  object.combatLevel = reader.readLong(offsets[1]);
  object.currencies = reader.readObjectOrNull<Currencies>(
        offsets[2],
        CurrenciesSchema.deserialize,
        allOffsets,
      ) ??
      Currencies();
  object.displayName = reader.readString(offsets[3]);
  object.economyVersion = reader.readLong(offsets[4]);
  object.epicPityCounter = reader.readLong(offsets[5]);
  object.id = id;
  object.ownedDecor = reader.readStringList(offsets[6]) ?? [];
  object.playerId = reader.readString(offsets[7]);
  object.schemaVersion = reader.readLong(offsets[8]);
  return object;
}

P _playerProfileDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<Currencies>(
            offset,
            CurrenciesSchema.deserialize,
            allOffsets,
          ) ??
          Currencies()) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _playerProfileGetId(PlayerProfile object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _playerProfileGetLinks(PlayerProfile object) {
  return [];
}

void _playerProfileAttach(
    IsarCollection<dynamic> col, Id id, PlayerProfile object) {
  object.id = id;
}

extension PlayerProfileByIndex on IsarCollection<PlayerProfile> {
  Future<PlayerProfile?> getByPlayerId(String playerId) {
    return getByIndex(r'playerId', [playerId]);
  }

  PlayerProfile? getByPlayerIdSync(String playerId) {
    return getByIndexSync(r'playerId', [playerId]);
  }

  Future<bool> deleteByPlayerId(String playerId) {
    return deleteByIndex(r'playerId', [playerId]);
  }

  bool deleteByPlayerIdSync(String playerId) {
    return deleteByIndexSync(r'playerId', [playerId]);
  }

  Future<List<PlayerProfile?>> getAllByPlayerId(List<String> playerIdValues) {
    final values = playerIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'playerId', values);
  }

  List<PlayerProfile?> getAllByPlayerIdSync(List<String> playerIdValues) {
    final values = playerIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'playerId', values);
  }

  Future<int> deleteAllByPlayerId(List<String> playerIdValues) {
    final values = playerIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'playerId', values);
  }

  int deleteAllByPlayerIdSync(List<String> playerIdValues) {
    final values = playerIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'playerId', values);
  }

  Future<Id> putByPlayerId(PlayerProfile object) {
    return putByIndex(r'playerId', object);
  }

  Id putByPlayerIdSync(PlayerProfile object, {bool saveLinks = true}) {
    return putByIndexSync(r'playerId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPlayerId(List<PlayerProfile> objects) {
    return putAllByIndex(r'playerId', objects);
  }

  List<Id> putAllByPlayerIdSync(List<PlayerProfile> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'playerId', objects, saveLinks: saveLinks);
  }
}

extension PlayerProfileQueryWhereSort
    on QueryBuilder<PlayerProfile, PlayerProfile, QWhere> {
  QueryBuilder<PlayerProfile, PlayerProfile, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlayerProfileQueryWhere
    on QueryBuilder<PlayerProfile, PlayerProfile, QWhereClause> {
  QueryBuilder<PlayerProfile, PlayerProfile, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterWhereClause> idBetween(
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

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterWhereClause> playerIdEqualTo(
      String playerId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'playerId',
        value: [playerId],
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterWhereClause>
      playerIdNotEqualTo(String playerId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playerId',
              lower: [],
              upper: [playerId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playerId',
              lower: [playerId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playerId',
              lower: [playerId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'playerId',
              lower: [],
              upper: [playerId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PlayerProfileQueryFilter
    on QueryBuilder<PlayerProfile, PlayerProfile, QFilterCondition> {
  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      activeRobotIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'activeRobotId',
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      activeRobotIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'activeRobotId',
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      activeRobotIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeRobotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      activeRobotIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activeRobotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      activeRobotIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activeRobotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      activeRobotIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activeRobotId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      activeRobotIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activeRobotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      activeRobotIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activeRobotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      activeRobotIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activeRobotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      activeRobotIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activeRobotId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      activeRobotIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeRobotId',
        value: '',
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      activeRobotIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activeRobotId',
        value: '',
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      combatLevelEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'combatLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      combatLevelGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'combatLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      combatLevelLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'combatLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      combatLevelBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'combatLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      displayNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      displayNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      displayNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      displayNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      displayNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      displayNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      displayNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      displayNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      displayNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      displayNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      economyVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'economyVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      economyVersionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'economyVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      economyVersionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'economyVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      economyVersionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'economyVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      epicPityCounterEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'epicPityCounter',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      epicPityCounterGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'epicPityCounter',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      epicPityCounterLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'epicPityCounter',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      epicPityCounterBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'epicPityCounter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
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

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      ownedDecorElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownedDecor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      ownedDecorElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ownedDecor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      ownedDecorElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ownedDecor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      ownedDecorElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ownedDecor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      ownedDecorElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ownedDecor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      ownedDecorElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ownedDecor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      ownedDecorElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ownedDecor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      ownedDecorElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ownedDecor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      ownedDecorElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownedDecor',
        value: '',
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      ownedDecorElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ownedDecor',
        value: '',
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      ownedDecorLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ownedDecor',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      ownedDecorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ownedDecor',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      ownedDecorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ownedDecor',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      ownedDecorLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ownedDecor',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      ownedDecorLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ownedDecor',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      ownedDecorLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ownedDecor',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      playerIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      playerIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      playerIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      playerIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      playerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'playerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      playerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'playerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      playerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'playerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      playerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'playerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      playerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerId',
        value: '',
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      playerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'playerId',
        value: '',
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
      schemaVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'schemaVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
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

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
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

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition>
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
}

extension PlayerProfileQueryObject
    on QueryBuilder<PlayerProfile, PlayerProfile, QFilterCondition> {
  QueryBuilder<PlayerProfile, PlayerProfile, QAfterFilterCondition> currencies(
      FilterQuery<Currencies> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'currencies');
    });
  }
}

extension PlayerProfileQueryLinks
    on QueryBuilder<PlayerProfile, PlayerProfile, QFilterCondition> {}

extension PlayerProfileQuerySortBy
    on QueryBuilder<PlayerProfile, PlayerProfile, QSortBy> {
  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      sortByActiveRobotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeRobotId', Sort.asc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      sortByActiveRobotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeRobotId', Sort.desc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy> sortByCombatLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'combatLevel', Sort.asc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      sortByCombatLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'combatLevel', Sort.desc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy> sortByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      sortByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      sortByEconomyVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'economyVersion', Sort.asc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      sortByEconomyVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'economyVersion', Sort.desc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      sortByEpicPityCounter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'epicPityCounter', Sort.asc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      sortByEpicPityCounterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'epicPityCounter', Sort.desc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy> sortByPlayerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerId', Sort.asc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      sortByPlayerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerId', Sort.desc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      sortBySchemaVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemaVersion', Sort.asc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      sortBySchemaVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemaVersion', Sort.desc);
    });
  }
}

extension PlayerProfileQuerySortThenBy
    on QueryBuilder<PlayerProfile, PlayerProfile, QSortThenBy> {
  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      thenByActiveRobotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeRobotId', Sort.asc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      thenByActiveRobotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeRobotId', Sort.desc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy> thenByCombatLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'combatLevel', Sort.asc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      thenByCombatLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'combatLevel', Sort.desc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy> thenByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      thenByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      thenByEconomyVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'economyVersion', Sort.asc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      thenByEconomyVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'economyVersion', Sort.desc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      thenByEpicPityCounter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'epicPityCounter', Sort.asc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      thenByEpicPityCounterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'epicPityCounter', Sort.desc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy> thenByPlayerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerId', Sort.asc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      thenByPlayerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerId', Sort.desc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      thenBySchemaVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemaVersion', Sort.asc);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QAfterSortBy>
      thenBySchemaVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemaVersion', Sort.desc);
    });
  }
}

extension PlayerProfileQueryWhereDistinct
    on QueryBuilder<PlayerProfile, PlayerProfile, QDistinct> {
  QueryBuilder<PlayerProfile, PlayerProfile, QDistinct> distinctByActiveRobotId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeRobotId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QDistinct>
      distinctByCombatLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'combatLevel');
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QDistinct> distinctByDisplayName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QDistinct>
      distinctByEconomyVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'economyVersion');
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QDistinct>
      distinctByEpicPityCounter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'epicPityCounter');
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QDistinct> distinctByOwnedDecor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownedDecor');
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QDistinct> distinctByPlayerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlayerProfile, PlayerProfile, QDistinct>
      distinctBySchemaVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'schemaVersion');
    });
  }
}

extension PlayerProfileQueryProperty
    on QueryBuilder<PlayerProfile, PlayerProfile, QQueryProperty> {
  QueryBuilder<PlayerProfile, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PlayerProfile, String?, QQueryOperations>
      activeRobotIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeRobotId');
    });
  }

  QueryBuilder<PlayerProfile, int, QQueryOperations> combatLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'combatLevel');
    });
  }

  QueryBuilder<PlayerProfile, Currencies, QQueryOperations>
      currenciesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currencies');
    });
  }

  QueryBuilder<PlayerProfile, String, QQueryOperations> displayNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayName');
    });
  }

  QueryBuilder<PlayerProfile, int, QQueryOperations> economyVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'economyVersion');
    });
  }

  QueryBuilder<PlayerProfile, int, QQueryOperations> epicPityCounterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'epicPityCounter');
    });
  }

  QueryBuilder<PlayerProfile, List<String>, QQueryOperations>
      ownedDecorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownedDecor');
    });
  }

  QueryBuilder<PlayerProfile, String, QQueryOperations> playerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playerId');
    });
  }

  QueryBuilder<PlayerProfile, int, QQueryOperations> schemaVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'schemaVersion');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CurrenciesSchema = Schema(
  name: r'Currencies',
  id: 604863731747418347,
  properties: {
    r'premiumGems': PropertySchema(
      id: 0,
      name: r'premiumGems',
      type: IsarType.long,
    ),
    r'rareCogs': PropertySchema(
      id: 1,
      name: r'rareCogs',
      type: IsarType.long,
    ),
    r'scrap': PropertySchema(
      id: 2,
      name: r'scrap',
      type: IsarType.long,
    )
  },
  estimateSize: _currenciesEstimateSize,
  serialize: _currenciesSerialize,
  deserialize: _currenciesDeserialize,
  deserializeProp: _currenciesDeserializeProp,
);

int _currenciesEstimateSize(
  Currencies object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _currenciesSerialize(
  Currencies object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.premiumGems);
  writer.writeLong(offsets[1], object.rareCogs);
  writer.writeLong(offsets[2], object.scrap);
}

Currencies _currenciesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Currencies();
  object.premiumGems = reader.readLong(offsets[0]);
  object.rareCogs = reader.readLong(offsets[1]);
  object.scrap = reader.readLong(offsets[2]);
  return object;
}

P _currenciesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CurrenciesQueryFilter
    on QueryBuilder<Currencies, Currencies, QFilterCondition> {
  QueryBuilder<Currencies, Currencies, QAfterFilterCondition>
      premiumGemsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'premiumGems',
        value: value,
      ));
    });
  }

  QueryBuilder<Currencies, Currencies, QAfterFilterCondition>
      premiumGemsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'premiumGems',
        value: value,
      ));
    });
  }

  QueryBuilder<Currencies, Currencies, QAfterFilterCondition>
      premiumGemsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'premiumGems',
        value: value,
      ));
    });
  }

  QueryBuilder<Currencies, Currencies, QAfterFilterCondition>
      premiumGemsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'premiumGems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Currencies, Currencies, QAfterFilterCondition> rareCogsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rareCogs',
        value: value,
      ));
    });
  }

  QueryBuilder<Currencies, Currencies, QAfterFilterCondition>
      rareCogsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rareCogs',
        value: value,
      ));
    });
  }

  QueryBuilder<Currencies, Currencies, QAfterFilterCondition> rareCogsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rareCogs',
        value: value,
      ));
    });
  }

  QueryBuilder<Currencies, Currencies, QAfterFilterCondition> rareCogsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rareCogs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Currencies, Currencies, QAfterFilterCondition> scrapEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scrap',
        value: value,
      ));
    });
  }

  QueryBuilder<Currencies, Currencies, QAfterFilterCondition> scrapGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scrap',
        value: value,
      ));
    });
  }

  QueryBuilder<Currencies, Currencies, QAfterFilterCondition> scrapLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scrap',
        value: value,
      ));
    });
  }

  QueryBuilder<Currencies, Currencies, QAfterFilterCondition> scrapBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scrap',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CurrenciesQueryObject
    on QueryBuilder<Currencies, Currencies, QFilterCondition> {}
