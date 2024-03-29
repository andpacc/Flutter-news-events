// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Page not found`
  String get error_pageNotFound {
    return Intl.message(
      'Page not found',
      name: 'error_pageNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Go to home`
  String get error_goToHome {
    return Intl.message(
      'Go to home',
      name: 'error_goToHome',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Empty field`
  String get emptyField {
    return Intl.message(
      'Empty field',
      name: 'emptyField',
      desc: '',
      args: [],
    );
  }

  /// `Too long`
  String get tooLong {
    return Intl.message(
      'Too long',
      name: 'tooLong',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get requiredField {
    return Intl.message(
      'Required',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `This process may take several minutes`
  String get creationTimeWarning {
    return Intl.message(
      'This process may take several minutes',
      name: 'creationTimeWarning',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `New project`
  String get newProject {
    return Intl.message(
      'New project',
      name: 'newProject',
      desc: '',
      args: [],
    );
  }

  /// `Generating project...`
  String get generatingProject {
    return Intl.message(
      'Generating project...',
      name: 'generatingProject',
      desc: '',
      args: [],
    );
  }

  /// `Creation error`
  String get creationError {
    return Intl.message(
      'Creation error',
      name: 'creationError',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get viewAction {
    return Intl.message(
      'View',
      name: 'viewAction',
      desc: '',
      args: [],
    );
  }

  /// `Rename`
  String get renameAction {
    return Intl.message(
      'Rename',
      name: 'renameAction',
      desc: '',
      args: [],
    );
  }

  /// `Duplicate`
  String get duplicateAction {
    return Intl.message(
      'Duplicate',
      name: 'duplicateAction',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get deleteAction {
    return Intl.message(
      'Delete',
      name: 'deleteAction',
      desc: '',
      args: [],
    );
  }

  /// `Rename`
  String get rename {
    return Intl.message(
      'Rename',
      name: 'rename',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Name in use`
  String get nameInUse {
    return Intl.message(
      'Name in use',
      name: 'nameInUse',
      desc: '',
      args: [],
    );
  }

  /// `Change directory`
  String get changeDirectory {
    return Intl.message(
      'Change directory',
      name: 'changeDirectory',
      desc: '',
      args: [],
    );
  }

  /// `Projects`
  String get projects {
    return Intl.message(
      'Projects',
      name: 'projects',
      desc: '',
      args: [],
    );
  }

  /// `{projectCount} projects found`
  String numProjectsFound(Object projectCount) {
    return Intl.message(
      '$projectCount projects found',
      name: 'numProjectsFound',
      desc: '',
      args: [projectCount],
    );
  }

  /// `Error creating the project: {motive}`
  String projectCreationFailure(Object motive) {
    return Intl.message(
      'Error creating the project: $motive',
      name: 'projectCreationFailure',
      desc: '',
      args: [motive],
    );
  }

  /// `Operation error`
  String get operationError {
    return Intl.message(
      'Operation error',
      name: 'operationError',
      desc: '',
      args: [],
    );
  }

  /// `Project name {name} in use`
  String projectNameTaken(Object name) {
    return Intl.message(
      'Project name $name in use',
      name: 'projectNameTaken',
      desc: '',
      args: [name],
    );
  }

  /// `Transcrip.`
  String get transcriptions {
    return Intl.message(
      'Transcrip.',
      name: 'transcriptions',
      desc: '',
      args: [],
    );
  }

  /// `Library`
  String get library {
    return Intl.message(
      'Library',
      name: 'library',
      desc: '',
      args: [],
    );
  }

  /// `Workspace`
  String get workspace {
    return Intl.message(
      'Workspace',
      name: 'workspace',
      desc: '',
      args: [],
    );
  }

  /// `Analytics`
  String get analytics {
    return Intl.message(
      'Analytics',
      name: 'analytics',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
