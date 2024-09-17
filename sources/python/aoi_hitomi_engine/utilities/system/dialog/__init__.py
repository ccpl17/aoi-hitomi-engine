from win32more import Void
from win32more.Windows.UI.Popups import MessageDialog
from win32more.Windows.Win32.UI.Shell import IInitializeWithWindow
from win32more.Windows.Win32.UI.WindowsAndMessaging import FindWindow


def show_message_dialog(message: str,
                        window_title: str) -> Void:
    dialog: MessageDialog = MessageDialog(message)

    shell: IInitializeWithWindow = dialog.as_(IInitializeWithWindow)
    shell.Initialize(FindWindow(None, window_title))

    dialog.ShowAsync()
