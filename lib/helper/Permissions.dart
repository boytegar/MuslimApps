enum PermissionGroup {
/// The unknown permission only used for return type, never requested
unknown,

/// Android: Calendar
/// iOS: Calendar (Events)
calendar,

/// Android: Camera
/// iOS: Photos (Camera Roll and Camera)
camera,

/// Android: Contacts
/// iOS: AddressBook
contacts,

/// Android: Fine and Coarse Location
/// iOS: CoreLocation (Always and WhenInUse)
location,

/// Android: Microphone
/// iOS: Microphone
microphone,

/// Android: Phone
/// iOS: Nothing
phone,

/// Android: Nothing
/// iOS: Photos
photos,

/// Android: Nothing
/// iOS: Reminders
reminders,

/// Android: Body Sensors
/// iOS: CoreMotion
sensors,

/// Android: Sms
/// iOS: Nothing
sms,

/// Android: External Storage
/// iOS: Nothing
storage,

/// Android: Microphone
/// iOS: Speech
speech,

/// Android: Fine and Coarse Location
/// iOS: CoreLocation - Always
locationAlways,

/// Android: Fine and Coarse Location
/// iOS: CoreLocation - WhenInUse
locationWhenInUse,

/// Android: None
/// iOS: MPMediaLibrary
mediaLibrary,

/// Android: Check notification enable
/// iOS: Check and request notification permission
notification
}

enum PermissionStatus {
  /// Permission to access the requested feature is denied by the user.
  denied,

  /// Permissions to access the feature is granted by the user but the feature is disabled.
  disabled,

  /// Permission to access the requested feature is granted by the user.
  granted,

  /// The user granted restricted access to the requested feature (only on iOS).
  restricted,

  /// Permission is in an unknown state
  unknown,

/// Permission to access the requested feature is denied by the user and never show selected (only on Android).
neverAskAgain
}

enum ServiceStatus {
  /// The unknown service status indicates the state of the service could not be determined.
  unknown,

  /// There is no service for the supplied permission group.
  notApplicable,

  /// The service for the supplied permission group is disabled.
  disabled,

  /// The service for the supplied permission group is enabled.
  enabled
}