// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(projectCount) => "${projectCount} projects found";

  static String m1(motive) => "Error creating the project: ${motive}";

  static String m2(name) => "Project name ${name} in use";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accept": MessageLookupByLibrary.simpleMessage("Accept"),
        "analytics": MessageLookupByLibrary.simpleMessage("Analytics"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "changeDirectory":
            MessageLookupByLibrary.simpleMessage("Change directory"),
        "creationError": MessageLookupByLibrary.simpleMessage("Creation error"),
        "creationTimeWarning": MessageLookupByLibrary.simpleMessage(
            "This process may take several minutes"),
        "deleteAction": MessageLookupByLibrary.simpleMessage("Delete"),
        "duplicateAction": MessageLookupByLibrary.simpleMessage("Duplicate"),
        "emptyField": MessageLookupByLibrary.simpleMessage("Empty field"),
        "error_goToHome": MessageLookupByLibrary.simpleMessage("Go to home"),
        "error_pageNotFound":
            MessageLookupByLibrary.simpleMessage("Page not found"),
        "generatingProject":
            MessageLookupByLibrary.simpleMessage("Generating project..."),
        "library": MessageLookupByLibrary.simpleMessage("Library"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "nameInUse": MessageLookupByLibrary.simpleMessage("Name in use"),
        "newProject": MessageLookupByLibrary.simpleMessage("New project"),
        "numProjectsFound": m0,
        "operationError":
            MessageLookupByLibrary.simpleMessage("Operation error"),
        "projectCreationFailure": m1,
        "projectNameTaken": m2,
        "projects": MessageLookupByLibrary.simpleMessage("Projects"),
        "rename": MessageLookupByLibrary.simpleMessage("Rename"),
        "renameAction": MessageLookupByLibrary.simpleMessage("Rename"),
        "requiredField": MessageLookupByLibrary.simpleMessage("Required"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "tooLong": MessageLookupByLibrary.simpleMessage("Too long"),
        "transcriptions": MessageLookupByLibrary.simpleMessage("Transcrip."),
        "viewAction": MessageLookupByLibrary.simpleMessage("View"),
        "workspace": MessageLookupByLibrary.simpleMessage("Workspace")
      };
}
