# nanna_flutter_platform

Questa libreria fornisce componenti cross-platform unificati per app Flutter.
Invece di dover scrivere codice condizionale basato sulla piattaforma (`if (Platform.isIOS) ...`) in ogni schermata, `nanna_flutter_platform` espone widget generici (come `NaPlatformButton`) che si traducono automaticamente nel design system nativo appropriato:
- **Material Design** per Android, Web e Linux
- **Cupertino** per iOS e macOS
- **Fluent UI** per Windows

## Stato dei Widget Supportati

| Flutter Widget (Material) | Cupertino Equivalente | Fluent UI Equivalente | Implementato | Nome Componente |
| --- | --- | --- | :---: | --- |
| `Scaffold` | `CupertinoPageScaffold` | `ScaffoldPage` | ✅ | `NaPlatformScaffold` |
| `AppBar` | `CupertinoNavigationBar`| `PageHeader` | ✅ | (Integrato in `NaPlatformScaffold`) |
| `ElevatedButton` | `CupertinoButton` | `Button` | ✅ | `NaPlatformButton` |
| `IconButton` | `CupertinoButton` (icon) | `IconButton` | ✅ | `NaPlatformIconButton` |
| `TextField` | `CupertinoTextField` | `TextBox` | ✅ | `NaPlatformTextField` |
| `Switch` | `CupertinoSwitch` | `ToggleSwitch` | ✅ | `NaPlatformSwitch` |
| `Checkbox` | `CupertinoCheckbox` | `Checkbox` | ✅ | `NaPlatformCheckbox` |
| `Slider` | `CupertinoSlider` | `Slider` | ✅ | `NaPlatformSlider` |
| `CircularProgressIndicator`| `CupertinoActivityIndicator`| `ProgressRing` | ✅ | `NaPlatformProgressIndicator` |
| `Card` | `Container` (decorato) | `Card` | ✅ | `NaPlatformCard` |
| `AlertDialog` | `CupertinoAlertDialog` | `ContentDialog` | ✅ | `NaPlatformAlertDialog` |
| `BottomNavigationBar` | `CupertinoTabBar` | `NavigationView` | ❌ | - |
| `DatePicker` | `CupertinoDatePicker` | `DatePicker` | ❌ | - |
| `TimePicker` | `CupertinoTimerPicker` | `TimePicker` | ❌ | - |
| `ListTile` | `CupertinoListTile` | `ListTile` | ❌ | - |
| `Radio` | `CupertinoRadio` | `RadioButton` | ❌ | - |
| `Dialog Action` | `CupertinoDialogAction` | `Button` (in dialog) | ❌ | - |

