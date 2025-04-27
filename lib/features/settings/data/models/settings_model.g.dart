// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSettingsModelCollection on Isar {
  IsarCollection<SettingsModel> get settingsModels => this.collection();
}

const SettingsModelSchema = CollectionSchema(
  name: r'SettingsModel',
  id: 4013777327486952906,
  properties: {
    r'autoComplete': PropertySchema(
      id: 0,
      name: r'autoComplete',
      type: IsarType.bool,
    ),
    r'autoLineBreak': PropertySchema(
      id: 1,
      name: r'autoLineBreak',
      type: IsarType.bool,
    ),
    r'autoSave': PropertySchema(
      id: 2,
      name: r'autoSave',
      type: IsarType.bool,
    ),
    r'codeBlock': PropertySchema(
      id: 3,
      name: r'codeBlock',
      type: IsarType.bool,
    ),
    r'compileArch': PropertySchema(
      id: 4,
      name: r'compileArch',
      type: IsarType.byte,
      enumMap: _SettingsModelcompileArchEnumValueMap,
    ),
    r'compileMode': PropertySchema(
      id: 5,
      name: r'compileMode',
      type: IsarType.byte,
      enumMap: _SettingsModelcompileModeEnumValueMap,
    ),
    r'compilePlatforms': PropertySchema(
      id: 6,
      name: r'compilePlatforms',
      type: IsarType.byteList,
      enumMap: _SettingsModelcompilePlatformsEnumValueMap,
    ),
    r'customSymbols': PropertySchema(
      id: 7,
      name: r'customSymbols',
      type: IsarType.string,
    ),
    r'extensions': PropertySchema(
      id: 8,
      name: r'extensions',
      type: IsarType.stringList,
    ),
    r'fontFamily': PropertySchema(
      id: 9,
      name: r'fontFamily',
      type: IsarType.string,
    ),
    r'fontLigadures': PropertySchema(
      id: 10,
      name: r'fontLigadures',
      type: IsarType.bool,
    ),
    r'fontSize': PropertySchema(
      id: 11,
      name: r'fontSize',
      type: IsarType.double,
    ),
    r'highlightError': PropertySchema(
      id: 12,
      name: r'highlightError',
      type: IsarType.bool,
    ),
    r'lineHighlight': PropertySchema(
      id: 13,
      name: r'lineHighlight',
      type: IsarType.bool,
    ),
    r'lineNumbers': PropertySchema(
      id: 14,
      name: r'lineNumbers',
      type: IsarType.bool,
    ),
    r'themeOption': PropertySchema(
      id: 15,
      name: r'themeOption',
      type: IsarType.byte,
      enumMap: _SettingsModelthemeOptionEnumValueMap,
    ),
    r'trimSpaces': PropertySchema(
      id: 16,
      name: r'trimSpaces',
      type: IsarType.bool,
    ),
    r'useSystemShell': PropertySchema(
      id: 17,
      name: r'useSystemShell',
      type: IsarType.bool,
    )
  },
  estimateSize: _settingsModelEstimateSize,
  serialize: _settingsModelSerialize,
  deserialize: _settingsModelDeserialize,
  deserializeProp: _settingsModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _settingsModelGetId,
  getLinks: _settingsModelGetLinks,
  attach: _settingsModelAttach,
  version: '3.1.0+1',
);

int _settingsModelEstimateSize(
  SettingsModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.compilePlatforms.length;
  bytesCount += 3 + object.customSymbols.length * 3;
  bytesCount += 3 + object.extensions.length * 3;
  {
    for (var i = 0; i < object.extensions.length; i++) {
      final value = object.extensions[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.fontFamily.length * 3;
  return bytesCount;
}

void _settingsModelSerialize(
  SettingsModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.autoComplete);
  writer.writeBool(offsets[1], object.autoLineBreak);
  writer.writeBool(offsets[2], object.autoSave);
  writer.writeBool(offsets[3], object.codeBlock);
  writer.writeByte(offsets[4], object.compileArch.index);
  writer.writeByte(offsets[5], object.compileMode.index);
  writer.writeByteList(
      offsets[6], object.compilePlatforms.map((e) => e.index).toList());
  writer.writeString(offsets[7], object.customSymbols);
  writer.writeStringList(offsets[8], object.extensions);
  writer.writeString(offsets[9], object.fontFamily);
  writer.writeBool(offsets[10], object.fontLigadures);
  writer.writeDouble(offsets[11], object.fontSize);
  writer.writeBool(offsets[12], object.highlightError);
  writer.writeBool(offsets[13], object.lineHighlight);
  writer.writeBool(offsets[14], object.lineNumbers);
  writer.writeByte(offsets[15], object.themeOption.index);
  writer.writeBool(offsets[16], object.trimSpaces);
  writer.writeBool(offsets[17], object.useSystemShell);
}

SettingsModel _settingsModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SettingsModel(
    autoComplete: reader.readBoolOrNull(offsets[0]) ?? false,
    autoLineBreak: reader.readBoolOrNull(offsets[1]) ?? false,
    autoSave: reader.readBoolOrNull(offsets[2]) ?? false,
    codeBlock: reader.readBoolOrNull(offsets[3]) ?? false,
    compileArch: _SettingsModelcompileArchValueEnumMap[
            reader.readByteOrNull(offsets[4])] ??
        CompileArch.arm,
    compileMode: _SettingsModelcompileModeValueEnumMap[
            reader.readByteOrNull(offsets[5])] ??
        CompileMode.debug,
    compilePlatforms: reader
            .readByteList(offsets[6])
            ?.map((e) =>
                _SettingsModelcompilePlatformsValueEnumMap[e] ??
                CompilePlatform.windows)
            .toList() ??
        const [],
    customSymbols: reader.readStringOrNull(offsets[7]) ?? '',
    extensions: reader.readStringList(offsets[8]) ?? const [],
    fontFamily: reader.readStringOrNull(offsets[9]) ?? 'Roboto',
    fontLigadures: reader.readBoolOrNull(offsets[10]) ?? false,
    fontSize: reader.readDoubleOrNull(offsets[11]) ?? 14.0,
    highlightError: reader.readBoolOrNull(offsets[12]) ?? false,
    lineHighlight: reader.readBoolOrNull(offsets[13]) ?? false,
    lineNumbers: reader.readBoolOrNull(offsets[14]) ?? false,
    themeOption: _SettingsModelthemeOptionValueEnumMap[
            reader.readByteOrNull(offsets[15])] ??
        ThemeOption.dark,
    trimSpaces: reader.readBoolOrNull(offsets[16]) ?? false,
    useSystemShell: reader.readBoolOrNull(offsets[17]) ?? false,
  );
  return object;
}

P _settingsModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 1:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 2:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 3:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 4:
      return (_SettingsModelcompileArchValueEnumMap[
              reader.readByteOrNull(offset)] ??
          CompileArch.arm) as P;
    case 5:
      return (_SettingsModelcompileModeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          CompileMode.debug) as P;
    case 6:
      return (reader
              .readByteList(offset)
              ?.map((e) =>
                  _SettingsModelcompilePlatformsValueEnumMap[e] ??
                  CompilePlatform.windows)
              .toList() ??
          const []) as P;
    case 7:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 8:
      return (reader.readStringList(offset) ?? const []) as P;
    case 9:
      return (reader.readStringOrNull(offset) ?? 'Roboto') as P;
    case 10:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 11:
      return (reader.readDoubleOrNull(offset) ?? 14.0) as P;
    case 12:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 13:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 14:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 15:
      return (_SettingsModelthemeOptionValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ThemeOption.dark) as P;
    case 16:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 17:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SettingsModelcompileArchEnumValueMap = {
  'arm': 0,
  'arm64': 1,
  'x32': 2,
  'x64': 3,
};
const _SettingsModelcompileArchValueEnumMap = {
  0: CompileArch.arm,
  1: CompileArch.arm64,
  2: CompileArch.x32,
  3: CompileArch.x64,
};
const _SettingsModelcompileModeEnumValueMap = {
  'debug': 0,
  'profile': 1,
  'release': 2,
};
const _SettingsModelcompileModeValueEnumMap = {
  0: CompileMode.debug,
  1: CompileMode.profile,
  2: CompileMode.release,
};
const _SettingsModelcompilePlatformsEnumValueMap = {
  'windows': 0,
  'linux': 1,
  'macos': 2,
  'web': 3,
  'ios': 4,
  'android': 5,
};
const _SettingsModelcompilePlatformsValueEnumMap = {
  0: CompilePlatform.windows,
  1: CompilePlatform.linux,
  2: CompilePlatform.macos,
  3: CompilePlatform.web,
  4: CompilePlatform.ios,
  5: CompilePlatform.android,
};
const _SettingsModelthemeOptionEnumValueMap = {
  'light': 0,
  'dark': 1,
  'materialYou': 2,
  'darkAmoled': 3,
};
const _SettingsModelthemeOptionValueEnumMap = {
  0: ThemeOption.light,
  1: ThemeOption.dark,
  2: ThemeOption.materialYou,
  3: ThemeOption.darkAmoled,
};

Id _settingsModelGetId(SettingsModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _settingsModelGetLinks(SettingsModel object) {
  return [];
}

void _settingsModelAttach(
    IsarCollection<dynamic> col, Id id, SettingsModel object) {}

extension SettingsModelQueryWhereSort
    on QueryBuilder<SettingsModel, SettingsModel, QWhere> {
  QueryBuilder<SettingsModel, SettingsModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SettingsModelQueryWhere
    on QueryBuilder<SettingsModel, SettingsModel, QWhereClause> {
  QueryBuilder<SettingsModel, SettingsModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<SettingsModel, SettingsModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterWhereClause> idBetween(
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
}

extension SettingsModelQueryFilter
    on QueryBuilder<SettingsModel, SettingsModel, QFilterCondition> {
  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      autoCompleteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'autoComplete',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      autoLineBreakEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'autoLineBreak',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      autoSaveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'autoSave',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      codeBlockEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codeBlock',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      compileArchEqualTo(CompileArch value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compileArch',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      compileArchGreaterThan(
    CompileArch value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'compileArch',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      compileArchLessThan(
    CompileArch value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'compileArch',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      compileArchBetween(
    CompileArch lower,
    CompileArch upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'compileArch',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      compileModeEqualTo(CompileMode value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compileMode',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      compileModeGreaterThan(
    CompileMode value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'compileMode',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      compileModeLessThan(
    CompileMode value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'compileMode',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      compileModeBetween(
    CompileMode lower,
    CompileMode upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'compileMode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      compilePlatformsElementEqualTo(CompilePlatform value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compilePlatforms',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      compilePlatformsElementGreaterThan(
    CompilePlatform value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'compilePlatforms',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      compilePlatformsElementLessThan(
    CompilePlatform value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'compilePlatforms',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      compilePlatformsElementBetween(
    CompilePlatform lower,
    CompilePlatform upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'compilePlatforms',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      compilePlatformsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'compilePlatforms',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      compilePlatformsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'compilePlatforms',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      compilePlatformsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'compilePlatforms',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      compilePlatformsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'compilePlatforms',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      compilePlatformsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'compilePlatforms',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      compilePlatformsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'compilePlatforms',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      customSymbolsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customSymbols',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      customSymbolsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customSymbols',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      customSymbolsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customSymbols',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      customSymbolsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customSymbols',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      customSymbolsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customSymbols',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      customSymbolsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customSymbols',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      customSymbolsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customSymbols',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      customSymbolsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customSymbols',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      customSymbolsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customSymbols',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      customSymbolsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customSymbols',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      extensionsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extensions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      extensionsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'extensions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      extensionsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'extensions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      extensionsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'extensions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      extensionsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'extensions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      extensionsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'extensions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      extensionsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'extensions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      extensionsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'extensions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      extensionsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extensions',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      extensionsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'extensions',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      extensionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'extensions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      extensionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'extensions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      extensionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'extensions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      extensionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'extensions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      extensionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'extensions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      extensionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'extensions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      fontFamilyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fontFamily',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      fontFamilyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fontFamily',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      fontFamilyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fontFamily',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      fontFamilyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fontFamily',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      fontFamilyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fontFamily',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      fontFamilyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fontFamily',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      fontFamilyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fontFamily',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      fontFamilyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fontFamily',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      fontFamilyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fontFamily',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      fontFamilyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fontFamily',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      fontLigaduresEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fontLigadures',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      fontSizeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fontSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      fontSizeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fontSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      fontSizeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fontSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      fontSizeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fontSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      highlightErrorEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'highlightError',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
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

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lineHighlightEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lineHighlight',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      lineNumbersEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lineNumbers',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      themeOptionEqualTo(ThemeOption value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themeOption',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      themeOptionGreaterThan(
    ThemeOption value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'themeOption',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      themeOptionLessThan(
    ThemeOption value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'themeOption',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      themeOptionBetween(
    ThemeOption lower,
    ThemeOption upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'themeOption',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      trimSpacesEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trimSpaces',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
      useSystemShellEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'useSystemShell',
        value: value,
      ));
    });
  }
}

extension SettingsModelQueryObject
    on QueryBuilder<SettingsModel, SettingsModel, QFilterCondition> {}

extension SettingsModelQueryLinks
    on QueryBuilder<SettingsModel, SettingsModel, QFilterCondition> {}

extension SettingsModelQuerySortBy
    on QueryBuilder<SettingsModel, SettingsModel, QSortBy> {
  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByAutoComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoComplete', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByAutoCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoComplete', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByAutoLineBreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoLineBreak', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByAutoLineBreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoLineBreak', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByAutoSave() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSave', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByAutoSaveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSave', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByCodeBlock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codeBlock', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByCodeBlockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codeBlock', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByCompileArch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compileArch', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByCompileArchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compileArch', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByCompileMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compileMode', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByCompileModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compileMode', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByCustomSymbols() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customSymbols', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByCustomSymbolsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customSymbols', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByFontFamily() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontFamily', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByFontFamilyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontFamily', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByFontLigadures() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontLigadures', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByFontLigaduresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontLigadures', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByFontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSize', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByFontSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSize', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByHighlightError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highlightError', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByHighlightErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highlightError', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByLineHighlight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineHighlight', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByLineHighlightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineHighlight', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByLineNumbers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineNumbers', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByLineNumbersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineNumbers', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByThemeOption() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeOption', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByThemeOptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeOption', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByTrimSpaces() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trimSpaces', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByTrimSpacesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trimSpaces', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByUseSystemShell() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'useSystemShell', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      sortByUseSystemShellDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'useSystemShell', Sort.desc);
    });
  }
}

extension SettingsModelQuerySortThenBy
    on QueryBuilder<SettingsModel, SettingsModel, QSortThenBy> {
  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByAutoComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoComplete', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByAutoCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoComplete', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByAutoLineBreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoLineBreak', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByAutoLineBreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoLineBreak', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByAutoSave() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSave', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByAutoSaveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSave', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByCodeBlock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codeBlock', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByCodeBlockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codeBlock', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByCompileArch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compileArch', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByCompileArchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compileArch', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByCompileMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compileMode', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByCompileModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compileMode', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByCustomSymbols() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customSymbols', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByCustomSymbolsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customSymbols', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByFontFamily() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontFamily', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByFontFamilyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontFamily', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByFontLigadures() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontLigadures', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByFontLigaduresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontLigadures', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByFontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSize', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByFontSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSize', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByHighlightError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highlightError', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByHighlightErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highlightError', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByLineHighlight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineHighlight', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByLineHighlightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineHighlight', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByLineNumbers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineNumbers', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByLineNumbersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineNumbers', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByThemeOption() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeOption', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByThemeOptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeOption', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByTrimSpaces() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trimSpaces', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByTrimSpacesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trimSpaces', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByUseSystemShell() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'useSystemShell', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
      thenByUseSystemShellDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'useSystemShell', Sort.desc);
    });
  }
}

extension SettingsModelQueryWhereDistinct
    on QueryBuilder<SettingsModel, SettingsModel, QDistinct> {
  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByAutoComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoComplete');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByAutoLineBreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoLineBreak');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct> distinctByAutoSave() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoSave');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct> distinctByCodeBlock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codeBlock');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByCompileArch() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compileArch');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByCompileMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compileMode');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByCompilePlatforms() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compilePlatforms');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct> distinctByCustomSymbols(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customSymbols',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct> distinctByExtensions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'extensions');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct> distinctByFontFamily(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fontFamily', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByFontLigadures() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fontLigadures');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct> distinctByFontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fontSize');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByHighlightError() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'highlightError');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByLineHighlight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lineHighlight');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByLineNumbers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lineNumbers');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByThemeOption() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'themeOption');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct> distinctByTrimSpaces() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trimSpaces');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
      distinctByUseSystemShell() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'useSystemShell');
    });
  }
}

extension SettingsModelQueryProperty
    on QueryBuilder<SettingsModel, SettingsModel, QQueryProperty> {
  QueryBuilder<SettingsModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations> autoCompleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoComplete');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations> autoLineBreakProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoLineBreak');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations> autoSaveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoSave');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations> codeBlockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codeBlock');
    });
  }

  QueryBuilder<SettingsModel, CompileArch, QQueryOperations>
      compileArchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compileArch');
    });
  }

  QueryBuilder<SettingsModel, CompileMode, QQueryOperations>
      compileModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compileMode');
    });
  }

  QueryBuilder<SettingsModel, List<CompilePlatform>, QQueryOperations>
      compilePlatformsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compilePlatforms');
    });
  }

  QueryBuilder<SettingsModel, String, QQueryOperations>
      customSymbolsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customSymbols');
    });
  }

  QueryBuilder<SettingsModel, List<String>, QQueryOperations>
      extensionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'extensions');
    });
  }

  QueryBuilder<SettingsModel, String, QQueryOperations> fontFamilyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fontFamily');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations> fontLigaduresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fontLigadures');
    });
  }

  QueryBuilder<SettingsModel, double, QQueryOperations> fontSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fontSize');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations> highlightErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'highlightError');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations> lineHighlightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lineHighlight');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations> lineNumbersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lineNumbers');
    });
  }

  QueryBuilder<SettingsModel, ThemeOption, QQueryOperations>
      themeOptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'themeOption');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations> trimSpacesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trimSpaces');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations> useSystemShellProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'useSystemShell');
    });
  }
}
