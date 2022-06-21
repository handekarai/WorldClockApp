// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on HomeViewModelBase, Store {
  late final _$selectedTimeZoneAtom =
      Atom(name: 'HomeViewModelBase.selectedTimeZone', context: context);

  @override
  dynamic get selectedTimeZone {
    _$selectedTimeZoneAtom.reportRead();
    return super.selectedTimeZone;
  }

  @override
  set selectedTimeZone(dynamic value) {
    _$selectedTimeZoneAtom.reportWrite(value, super.selectedTimeZone, () {
      super.selectedTimeZone = value;
    });
  }

  late final _$userTimeZoneAtom =
      Atom(name: 'HomeViewModelBase.userTimeZone', context: context);

  @override
  dynamic get userTimeZone {
    _$userTimeZoneAtom.reportRead();
    return super.userTimeZone;
  }

  @override
  set userTimeZone(dynamic value) {
    _$userTimeZoneAtom.reportWrite(value, super.userTimeZone, () {
      super.userTimeZone = value;
    });
  }

  late final _$isLightAtom =
      Atom(name: 'HomeViewModelBase.isLight', context: context);

  @override
  bool get isLight {
    _$isLightAtom.reportRead();
    return super.isLight;
  }

  @override
  set isLight(bool value) {
    _$isLightAtom.reportWrite(value, super.isLight, () {
      super.isLight = value;
    });
  }

  late final _$getUserTimeZoneAsyncAction =
      AsyncAction('HomeViewModelBase.getUserTimeZone', context: context);

  @override
  Future getUserTimeZone() {
    return _$getUserTimeZoneAsyncAction.run(() => super.getUserTimeZone());
  }

  late final _$getRegionTimeZoneAsyncAction =
      AsyncAction('HomeViewModelBase.getRegionTimeZone', context: context);

  @override
  Future getRegionTimeZone() {
    return _$getRegionTimeZoneAsyncAction.run(() => super.getRegionTimeZone());
  }

  late final _$HomeViewModelBaseActionController =
      ActionController(name: 'HomeViewModelBase', context: context);

  @override
  dynamic changeTheme() {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedTimeZone: ${selectedTimeZone},
userTimeZone: ${userTimeZone},
isLight: ${isLight}
    ''';
  }
}
