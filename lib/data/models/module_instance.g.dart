// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_instance.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModuleInstanceCollection on Isar {
  IsarCollection<ModuleInstance> get moduleInstances => this.collection();
}

const ModuleInstanceSchema = CollectionSchema(
  name: r'ModuleInstance',
  id: 5475633444527733422,
  properties: {
    r'acquiredAt': PropertySchema(
      id: 0,
      name: r'acquiredAt',
      type: IsarType.dateTime,
    ),
    r'defId': PropertySchema(
      id: 1,
      name: r'defId',
      type: IsarType.string,
    ),
    r'equippedRobotId': PropertySchema(
      id: 2,
      name: r'equippedRobotId',
      type: IsarType.string,
    ),
    r'instanceId': PropertySchema(
      id: 3,
      name: r'instanceId',
      type: IsarType.string,
    ),
    r'level': PropertySchema(
      id: 4,
      name: r'level',
      type: IsarType.long,
    ),
    r'rarity': PropertySchema(
      id: 5,
      name: r'rarity',
      type: IsarType.string,
      enumMap: _ModuleInstancerarityEnumValueMap,
    ),
    r'schemaVersion': PropertySchema(
      id: 6,
      name: r'schemaVersion',
      type: IsarType.long,
    )
  },
  estimateSize: _moduleInstanceEstimateSize,
  serialize: _moduleInstanceSerialize,
  deserialize: _moduleInstanceDeserialize,
  deserializeProp: _moduleInstanceDeserializeProp,
  idName: r'id',
  indexes: {
    r'instanceId': IndexSchema(
      id: -6720444513014720235,
      name: r'instanceId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'instanceId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'equippedRobotId': IndexSchema(
      id: -6178630254786803526,
      name: r'equippedRobotId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'equippedRobotId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _moduleInstanceGetId,
  getLinks: _moduleInstanceGetLinks,
  attach: _moduleInstanceAttach,
  version: '3.1.0+1',
);

int _moduleInstanceEstimateSize(
  ModuleInstance object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.defId.length * 3;
  {
    final value = object.equippedRobotId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.instanceId.length * 3;
  bytesCount += 3 + object.rarity.name.length * 3;
  return bytesCount;
}

void _moduleInstanceSerialize(
  ModuleInstance object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.acquiredAt);
  writer.writeString(offsets[1], object.defId);
  writer.writeString(offsets[2], object.equippedRobotId);
  writer.writeString(offsets[3], object.instanceId);
  writer.writeLong(offsets[4], object.level);
  writer.writeString(offsets[5], object.rarity.name);
  writer.writeLong(offsets[6], object.schemaVersion);
}

ModuleInstance _moduleInstanceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModuleInstance();
  object.acquiredAt = reader.readDateTime(offsets[0]);
  object.defId = reader.readString(offsets[1]);
  object.equippedRobotId = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.instanceId = reader.readString(offsets[3]);
  object.level = reader.readLong(offsets[4]);
  object.rarity =
      _ModuleInstancerarityValueEnumMap[reader.readStringOrNull(offsets[5])] ??
          ModuleRarity.common;
  object.schemaVersion = reader.readLong(offsets[6]);
  return object;
}

P _moduleInstanceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (_ModuleInstancerarityValueEnumMap[
              reader.readStringOrNull(offset)] ??
          ModuleRarity.common) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ModuleInstancerarityEnumValueMap = {
  r'common': r'common',
  r'rare': r'rare',
  r'epic': r'epic',
};
const _ModuleInstancerarityValueEnumMap = {
  r'common': ModuleRarity.common,
  r'rare': ModuleRarity.rare,
  r'epic': ModuleRarity.epic,
};

Id _moduleInstanceGetId(ModuleInstance object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _moduleInstanceGetLinks(ModuleInstance object) {
  return [];
}

void _moduleInstanceAttach(
    IsarCollection<dynamic> col, Id id, ModuleInstance object) {
  object.id = id;
}

extension ModuleInstanceByIndex on IsarCollection<ModuleInstance> {
  Future<ModuleInstance?> getByInstanceId(String instanceId) {
    return getByIndex(r'instanceId', [instanceId]);
  }

  ModuleInstance? getByInstanceIdSync(String instanceId) {
    return getByIndexSync(r'instanceId', [instanceId]);
  }

  Future<bool> deleteByInstanceId(String instanceId) {
    return deleteByIndex(r'instanceId', [instanceId]);
  }

  bool deleteByInstanceIdSync(String instanceId) {
    return deleteByIndexSync(r'instanceId', [instanceId]);
  }

  Future<List<ModuleInstance?>> getAllByInstanceId(
      List<String> instanceIdValues) {
    final values = instanceIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'instanceId', values);
  }

  List<ModuleInstance?> getAllByInstanceIdSync(List<String> instanceIdValues) {
    final values = instanceIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'instanceId', values);
  }

  Future<int> deleteAllByInstanceId(List<String> instanceIdValues) {
    final values = instanceIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'instanceId', values);
  }

  int deleteAllByInstanceIdSync(List<String> instanceIdValues) {
    final values = instanceIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'instanceId', values);
  }

  Future<Id> putByInstanceId(ModuleInstance object) {
    return putByIndex(r'instanceId', object);
  }

  Id putByInstanceIdSync(ModuleInstance object, {bool saveLinks = true}) {
    return putByIndexSync(r'instanceId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByInstanceId(List<ModuleInstance> objects) {
    return putAllByIndex(r'instanceId', objects);
  }

  List<Id> putAllByInstanceIdSync(List<ModuleInstance> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'instanceId', objects, saveLinks: saveLinks);
  }
}

extension ModuleInstanceQueryWhereSort
    on QueryBuilder<ModuleInstance, ModuleInstance, QWhere> {
  QueryBuilder<ModuleInstance, ModuleInstance, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModuleInstanceQueryWhere
    on QueryBuilder<ModuleInstance, ModuleInstance, QWhereClause> {
  QueryBuilder<ModuleInstance, ModuleInstance, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterWhereClause> idBetween(
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

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterWhereClause>
      instanceIdEqualTo(String instanceId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'instanceId',
        value: [instanceId],
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterWhereClause>
      instanceIdNotEqualTo(String instanceId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'instanceId',
              lower: [],
              upper: [instanceId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'instanceId',
              lower: [instanceId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'instanceId',
              lower: [instanceId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'instanceId',
              lower: [],
              upper: [instanceId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterWhereClause>
      equippedRobotIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'equippedRobotId',
        value: [null],
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterWhereClause>
      equippedRobotIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'equippedRobotId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterWhereClause>
      equippedRobotIdEqualTo(String? equippedRobotId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'equippedRobotId',
        value: [equippedRobotId],
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterWhereClause>
      equippedRobotIdNotEqualTo(String? equippedRobotId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'equippedRobotId',
              lower: [],
              upper: [equippedRobotId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'equippedRobotId',
              lower: [equippedRobotId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'equippedRobotId',
              lower: [equippedRobotId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'equippedRobotId',
              lower: [],
              upper: [equippedRobotId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ModuleInstanceQueryFilter
    on QueryBuilder<ModuleInstance, ModuleInstance, QFilterCondition> {
  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      acquiredAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'acquiredAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      acquiredAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'acquiredAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      acquiredAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'acquiredAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      acquiredAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'acquiredAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      defIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      defIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'defId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      defIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'defId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      defIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'defId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      defIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'defId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      defIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'defId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      defIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'defId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      defIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'defId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      defIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defId',
        value: '',
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      defIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'defId',
        value: '',
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      equippedRobotIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'equippedRobotId',
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      equippedRobotIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'equippedRobotId',
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      equippedRobotIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equippedRobotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      equippedRobotIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'equippedRobotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      equippedRobotIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'equippedRobotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      equippedRobotIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'equippedRobotId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      equippedRobotIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'equippedRobotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      equippedRobotIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'equippedRobotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      equippedRobotIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'equippedRobotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      equippedRobotIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'equippedRobotId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      equippedRobotIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equippedRobotId',
        value: '',
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      equippedRobotIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'equippedRobotId',
        value: '',
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
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

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
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

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      instanceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instanceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      instanceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'instanceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      instanceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'instanceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      instanceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'instanceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      instanceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'instanceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      instanceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'instanceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      instanceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'instanceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      instanceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'instanceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      instanceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instanceId',
        value: '',
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      instanceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'instanceId',
        value: '',
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      levelEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      levelGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      levelLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      levelBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'level',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      rarityEqualTo(
    ModuleRarity value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      rarityGreaterThan(
    ModuleRarity value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      rarityLessThan(
    ModuleRarity value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      rarityBetween(
    ModuleRarity lower,
    ModuleRarity upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rarity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      rarityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      rarityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      rarityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      rarityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rarity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      rarityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rarity',
        value: '',
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      rarityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rarity',
        value: '',
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
      schemaVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'schemaVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
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

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
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

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterFilterCondition>
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

extension ModuleInstanceQueryObject
    on QueryBuilder<ModuleInstance, ModuleInstance, QFilterCondition> {}

extension ModuleInstanceQueryLinks
    on QueryBuilder<ModuleInstance, ModuleInstance, QFilterCondition> {}

extension ModuleInstanceQuerySortBy
    on QueryBuilder<ModuleInstance, ModuleInstance, QSortBy> {
  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy>
      sortByAcquiredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acquiredAt', Sort.asc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy>
      sortByAcquiredAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acquiredAt', Sort.desc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy> sortByDefId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defId', Sort.asc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy> sortByDefIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defId', Sort.desc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy>
      sortByEquippedRobotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedRobotId', Sort.asc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy>
      sortByEquippedRobotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedRobotId', Sort.desc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy>
      sortByInstanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instanceId', Sort.asc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy>
      sortByInstanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instanceId', Sort.desc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy> sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy> sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy> sortByRarity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rarity', Sort.asc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy>
      sortByRarityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rarity', Sort.desc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy>
      sortBySchemaVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemaVersion', Sort.asc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy>
      sortBySchemaVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemaVersion', Sort.desc);
    });
  }
}

extension ModuleInstanceQuerySortThenBy
    on QueryBuilder<ModuleInstance, ModuleInstance, QSortThenBy> {
  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy>
      thenByAcquiredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acquiredAt', Sort.asc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy>
      thenByAcquiredAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acquiredAt', Sort.desc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy> thenByDefId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defId', Sort.asc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy> thenByDefIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defId', Sort.desc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy>
      thenByEquippedRobotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedRobotId', Sort.asc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy>
      thenByEquippedRobotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedRobotId', Sort.desc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy>
      thenByInstanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instanceId', Sort.asc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy>
      thenByInstanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instanceId', Sort.desc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy> thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy> thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy> thenByRarity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rarity', Sort.asc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy>
      thenByRarityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rarity', Sort.desc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy>
      thenBySchemaVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemaVersion', Sort.asc);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QAfterSortBy>
      thenBySchemaVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemaVersion', Sort.desc);
    });
  }
}

extension ModuleInstanceQueryWhereDistinct
    on QueryBuilder<ModuleInstance, ModuleInstance, QDistinct> {
  QueryBuilder<ModuleInstance, ModuleInstance, QDistinct>
      distinctByAcquiredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'acquiredAt');
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QDistinct> distinctByDefId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QDistinct>
      distinctByEquippedRobotId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equippedRobotId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QDistinct> distinctByInstanceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'instanceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QDistinct> distinctByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level');
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QDistinct> distinctByRarity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rarity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModuleInstance, ModuleInstance, QDistinct>
      distinctBySchemaVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'schemaVersion');
    });
  }
}

extension ModuleInstanceQueryProperty
    on QueryBuilder<ModuleInstance, ModuleInstance, QQueryProperty> {
  QueryBuilder<ModuleInstance, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ModuleInstance, DateTime, QQueryOperations>
      acquiredAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'acquiredAt');
    });
  }

  QueryBuilder<ModuleInstance, String, QQueryOperations> defIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defId');
    });
  }

  QueryBuilder<ModuleInstance, String?, QQueryOperations>
      equippedRobotIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equippedRobotId');
    });
  }

  QueryBuilder<ModuleInstance, String, QQueryOperations> instanceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'instanceId');
    });
  }

  QueryBuilder<ModuleInstance, int, QQueryOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<ModuleInstance, ModuleRarity, QQueryOperations>
      rarityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rarity');
    });
  }

  QueryBuilder<ModuleInstance, int, QQueryOperations> schemaVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'schemaVersion');
    });
  }
}
