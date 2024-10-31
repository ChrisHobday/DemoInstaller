import QtQuick
import QtQuick.Controls as Controls // Needed for various controls (https://doc.qt.io/qt-6/qtquick-controls-qmlmodule.html)
import QtQuick.Layouts // Needed for Column/Row Layout (https://doc.qt.io/qt-6/qtquicklayouts-index.html)
import org.kde.kirigami as Kirigami // Needed for various KDE controls that follow the KDE Human Interface Guidelines (https://develop.kde.org/docs/getting-started/kirigami/)
import QtQuick.Dialogs // Needed for FileDialog (used to select the location of the CD/ISO)
import Process 1.0 // Needed for running Bash scripts when actions are triggered

Kirigami.ApplicationWindow {
    id: window
    width: Kirigami.Units.gridUnit * 64
    height: Kirigami.Units.gridUnit * 36
    title: qsTr("Demo Installer")
    pageStack.initialPage: welcomePage

    Kirigami.ScrollablePage {
        id: welcomePage
        Layout.fillWidth: true
        title: qsTr("Welcome!")

        actions: [
            Kirigami.Action {
                text:"Next"
                icon.name: "go-next"
                onTriggered: pageStack.push(cdISOLocationPage)
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

        Image {
            id: cover
            source: "./Images/RiskCover.png"
            anchors.top: header.bottom
            anchors.bottom: footer.top
        }

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
        id: cdISOLocationPage
        Layout.fillWidth: true
        title: qsTr("Demo CD/ISO Location")

        Process {
            id: cmd

            property string output: ""

            onStarted: print("Started")
            onFinished: print("Closed")

            onErrorOccurred: console.log("Error Occurred: ", error)

            onReadyReadStandardOutput: {
                output = cmd.readAll()
                txt.text += output
            }
        }

        actions: [
            Kirigami.Action {
                text:"Install"
                icon.name: "install"
                onTriggered: cmd.start("./Test.sh")
            }
        ]


        ColumnLayout {
            spacing: Kirigami.Units.smallSpacing

            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: "Please ensure your Demo CD/ISO is inserted/mounted and it's location is selected in the textbox below, then press the Install button above to proceed."
            }

            RowLayout {
                spacing: Kirigami.Units.smallSpacing

                Controls.TextField {
                    id: cdIsoLocation
                    placeholderText: "Demo CD/ISO Location"
                }

                Controls.Button {
                    id: browseButton
                    text: "Browse"
                    onClicked: {
                        fileDialog.open()
                    }
                }

                FileDialog {
                    id: fileDialog
                    // currentFolder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
                    // onAccepted: image.source = selectedFile
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
