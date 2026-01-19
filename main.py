import sys
import os
from PySide6.QtWidgets import QApplication, QDialog
from ui.main_window import MainWindow

# Ensure we can find packages if strictly separated
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

def main():
    app = QApplication(sys.argv)
    
    # Optional: Load stylesheet here if global
    from PySide6.QtGui import QFont, QIcon
    import os
    app.setFont(QFont("Segoe UI", 10))
    
    # Set Icon
    icon_path = os.path.join(os.path.dirname(__file__), "assets", "logo.ico")
    if os.path.exists(icon_path):
        app.setWindowIcon(QIcon(icon_path))
    
    # 1. Check License
    from services.license_manager import LicenseManager
    from ui.activation_dialog import ActivationDialog
    
    lic_mgr = LicenseManager()
    if not lic_mgr.is_activated():
        # Show Activation Dialog
        dialog = ActivationDialog()
        if dialog.exec() != QDialog.Accepted:
            sys.exit(0) # Quit if not activated
    
    # 2. Launch Main Window
    window = MainWindow()
    window.show()
    
    sys.exit(app.exec())

if __name__ == "__main__":
    main()
