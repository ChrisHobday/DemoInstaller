import QtQuick
import QtQuick.Controls as Controls // Needed for various controls (https://doc.qt.io/qt-6/qtquick-controls-qmlmodule.html)
import QtQuick.Layouts // Needed for Column/Row Layout (https://doc.qt.io/qt-6/qtquicklayouts-index.html)
import org.kde.kirigami as Kirigami // Needed for various KDE controls that follow the KDE Human Interface Guidelines (https://develop.kde.org/docs/getting-started/kirigami/)
import QtQuick.Dialogs // Needed for FolderDialog (used to select the location of the CD with a dialog)
import DemoInstaller // Needed for Backend type that runs the install script

Kirigami.ApplicationWindow {
    id: installerWindow
    width: Kirigami.Units.gridUnit * 64
    height: Kirigami.Units.gridUnit * 36
    title: qsTr("Demo Installer")
    pageStack.initialPage: welcomePage //Set the initial page stack page to the welcome page

    property string cdMountLocation: ""

    //Tries to get the CD mount location if there is one, by using custom Backend Type to run a bash script
    Backend {
        id: getCDMountLocation

        onScriptRun: (scriptOutput) => {
                         cdMountLocation = scriptOutput
                     }
    }

    Kirigami.ScrollablePage {
        id: welcomePage
        Layout.fillWidth: true
        title: qsTr("Welcome!")

        actions: [
            Kirigami.Action {
                text:"Next"
                icon.name: "go-next"
                onTriggered: {
                    getCDMountLocation.runScript("/var/home/chris/Projects/QT/DemoInstaller/GetMountLocation.sh")
                    pageStack.push(cdLocationPage)
                }
            }
        ]

        ColumnLayout {
            id: header
            spacing: Kirigami.Units.smallSpacing
            anchors.top: parent.top

            Kirigami.Heading {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: "Welcome to the Demo installer!"
                level: 1
            }

            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: "This application will help you install and play your Windows Demo CD based game on Linux. Once installed from CD, whenever you launch this application it will take you directly into your game, no CD needed! Press the Next button above to proceed."
            }
        }

        // Image {
        //     id: cover
        //     source: "./Images/DemoCover.png"
        //     anchors.top: header.bottom
        //     anchors.bottom: footer.top
        // }

        ColumnLayout {
            id: footer
            spacing: Kirigami.Units.smallSpacing
            anchors.bottom: parent.bottom

            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: "Check out our other Installers/Launchers HERE."
            }

            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: "Get support and report issues HERE and HERE respectfully."
            }

            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: "Consider supporting us HERE or HERE (includes priority recommendations and support)."
            }
        }
    }

    Kirigami.ScrollablePage {
        id: cdLocationPage
        Layout.fillWidth: true
        title: qsTr("Demo CD Location")

        actions: [
            Kirigami.Action {
                text:"Install"
                icon.name: "install"
                onTriggered: pageStack.push(installCompletePage)
            }
        ]

        ColumnLayout {
            spacing: Kirigami.Units.smallSpacing

            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: "Please ensure your Demo CD is mounted and it's location is selected in the textbox below, then press the Install button above to proceed."
            }

            RowLayout {
                spacing: Kirigami.Units.smallSpacing

                Controls.TextField {
                    id: cdLocation
                    placeholderText: "Demo CD Location"
                    text: cdMountLocation
                }

                Controls.Button {
                    id: browseButton
                    text: "Browse"
                    onClicked: folderDialog.open()
                }

                FolderDialog {
                    id: folderDialog
                    onAccepted: {
                        var path = folderDialog.currentFolder.toString();
                        // remove prefixed "file:///"
                        path = path.replace(/^(file:\/{3})/,"");
                        // unescape html codes like '%23' for '#'
                        var cleanPath = decodeURIComponent(path);
                        cdLocation.text = cleanPath
                    }
                }
            }
        }
    }

    Kirigami.ScrollablePage {
        id: installCompletePage
        Layout.fillWidth: true
        title: qsTr("Installation Complete!")

        actions: [
            Kirigami.Action {
                text:"Launch"
                icon.name: "launch"
                onTriggered: print ("Launching")
            }
        ]


        ColumnLayout {
            spacing: Kirigami.Units.smallSpacing
            anchors.top: parent.top

            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: "The installation is complete! Now whenever you launch this application it will take you directly into your game, no CD needed! Have fun!"
            }
        }

        ColumnLayout {
            spacing: Kirigami.Units.smallSpacing
            anchors.bottom: parent.bottom

            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: "Check out our other Installers/Launchers HERE."
            }

            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: "Get support and report issues HERE and HERE respectfully."
            }

            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: "Consider supporting us HERE or HERE (includes priority recommendations and support)."
            }
        }
    }
}
