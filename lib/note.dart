import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable()
class Note {

  String desc;
  DateTime timestamp = DateTime.now();

  Note(this.desc);

  String toString() {
    return timestampDate() + ", " + timestampHour() + " - " + desc;
  }

  /*
    Comparing
  */

  int compareTimestampTo(Note other) {
      return timestamp.compareTo(other.timestamp);
  }

  /*
    Setters
  */

  set setDesc(String aDesc) => desc = aDesc;

  set setTimestamp(DateTime aDateTime) => timestamp = aDateTime;

  /*
    Getters
  */

  String get getDesc => desc;

  DateTime get getTimestamp => timestamp;

  /*
    Timestamp string formatters
  */


  String _timesStringFormatter(int timeValue) {
    return (timeValue < 10 ? "0" : "") + timeValue.toString();
  }

  String timestampHour() {
    return _timesStringFormatter(timestamp.hour) + ":"
        + _timesStringFormatter(timestamp.minute);
  }

  String timestampDate() {
    return _timesStringFormatter(timestamp.day) + "/"
        + _timesStringFormatter(timestamp.month) + "/"
        + _timesStringFormatter(timestamp.year);
  }

  /*
    JSON functions
  */

  /// A necessary factory constructor for creating a new Note instance
  /// from a map. Pass the map to the generated `_$NoteFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Note.
  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$NoteToJson`.
  Map<String, dynamic> toJson() => _$NoteToJson(this);

}