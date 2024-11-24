

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import LearnQt
import QtQuick.Studio.DesignEffects
import QtQuick.Layouts

Rectangle {
    id: rectangle
    width: 400
    height: 800
    color: "#fffefe"

    Button {
        id: add_todo_button
        y: 731
        height: 61
        text: qsTr("START TODO / RESET")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        anchors.bottomMargin: 8

        Connections {
            id: connections
            target: add_todo_button
            onClicked: addToDoDialog.visible = !addToDoDialog.visible
        }
        Connections {
            target: add_todo_button
            onClicked: toDoTextInput.text=""
        }
    }

    Rectangle {
        id: addToDoDialog
        y: 533
        height: 203
        color: "#e0e0e0"
        radius: 30
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 10
        anchors.rightMargin: 6
        anchors.bottomMargin: 64
        gradient: none.none
        property bool isAddDialogOpen: true

        DesignEffect {}

        RowLayout {
            x: 8
            y: 143
            width: 368
            height: 56
            spacing: 20
            Button {
                id: cancelButton
                width: 150
                text: qsTr("CANCEL")
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredWidth: -1
                Layout.preferredHeight: 40

                Connections {
                    id: connections1
                    target: cancelButton
                    onClicked: toDoTextInput.text = ""

                }

                Connections {
                    target: cancelButton
                    onClicked: addToDoDialog.visible = false
                }
            }

            Button {
                id: addButton
                width: 150
                text: qsTr(" ADD   ")
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: 40

                Connections {
                    target: addButton
                    onClicked:
                    if(toDoTextInput.text !== ""){
                    myListModel.append(myListModel.createListElement())
                }


                }
                Connections {
                    target: addButton
                    onClicked:
                        if(toDoTextInput.text !== ""){
                            addToDoDialog.visible = false
                        }
                }
            }
        }

        TextField {
            id: toDoTextInput
            y: 8
            height: 129
            color: "#080809"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 8
            anchors.rightMargin: 8
            anchors.bottomMargin: 66
            font.pointSize: 16
            placeholderText: "Now or Never"
            layer.enabled: false
            placeholderTextColor: "#c102060b"

            DesignEffect {
                effects: [
                    DesignDropShadow {}
                ]
            }
        }
    }

    Image {
        id: image
        x: 27
        height: 70
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 9
        anchors.rightMargin: 306
        anchors.topMargin: 2
        source: "images/曹县.svg"
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: _text
        height: 38
        text: qsTr("TODO LIST")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 17
        font.pixelSize: 24
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Column {
        id: column
        height: 400
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 75
        spacing: 10

        Repeater {
            id: repeater
            anchors.fill: parent
            model: ListModel {
                id : myListModel
                ListElement {
                    name: ""
                }
                function createListElement() {
                    return {
                        "name": toDoTextInput.text
                    }
                }
            }

            Rectangle {
                id: toDoItem
                x: 0
                y: 3
                height: 55
                visible: model.name !==""
                color: "#e0e0e0"
                radius: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                anchors.bottomMargin: 21
                clip: false

                CheckBox {
                    id: checkBox
                    text: name
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pointSize: 22
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                }
            }
        }
    }
    states: [
        State {
            name: "clicked"
        }
    ]
}
