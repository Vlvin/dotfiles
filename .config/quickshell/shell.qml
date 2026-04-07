import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts


PanelWindow {
  id: root
  property var default_color: "#FF7700"
  property var background_color: "#00000000"
  property var default_font_size: 13
  property var home: Quickshell.env("HOME")
  anchors {
    top: true
    left: true
    right: true
  }
  implicitHeight: 26
  implicitWidth: 10
  color: root.background_color
  RowLayout {
    Layout.fillHeight: true
    anchors.fill: parent
    anchors.topMargin: 1
    anchors.leftMargin: 10
    anchors.rightMargin: 10
    // tags/workspaces
    Repeater {
      model: 9
      Rectangle {
        radius: 10
        implicitWidth: 20
        implicitHeight: 20
        property var ws: false
        property bool isActive: false
        Layout.bottomMargin: isActive ? (root.implicitHeight - implicitHeight)/2 : (implicitHeight - root.implicitHeight)/2
        Process {
          id: tagsActiveProc
          command: [root.home+"/.config/quickshell/scripts/tags.sh", "selected"]
          stdout: SplitParser {
            onRead: data => {
              if (!data) return
              var tags = data.trim().split('\n')
              isActive = tags[0].includes(""+(index+1))
            }
          }
        }
        Timer {
          interval: 100
          running: true
          repeat: true
          onTriggered: tagsNEProc.running = true
        }
        Process {
          id: tagsNEProc
          command: [root.home+"/.config/quickshell/scripts/tags.sh", "non_empty"]
          stdout: SplitParser {
            onRead: data => {
              if (!data) return
              var tags = data.trim().split('\n')
              ws = tags[0].includes((index+1))
            }
          }
        }
        Timer {
          interval: 100
          running: true
          repeat: true
          onTriggered: tagsActiveProc.running = true
        }
        color: isActive ? "#dd00ff" : (ws ? "#7aa2f7" : root.default_color)
        MouseArea {
          anchors.fill: parent
          acceptedButtons: Qt.LeftButton | Qt.RightButton
          onClicked: (mouse) => {
            if (mouse.button === Qt.LeftButton) {
              Quickshell.execDetached(["mmsg", "-t", (index+1) + ""])
            } else if (mouse.button === Qt.RightButton) {
              Quickshell.execDetached(["mmsg", "-t", (index+1) + "^"])
            }
          }
        }
        Text {
          anchors.centerIn: parent

          color: "white"
          text: index + 1
          font { pixelSize: root.default_font_size; bold: true }
        }
      }
    }
    // Item { Layout.fillWidth: true }
  // // appname
    ClippingRectangle {
        Layout.bottomMargin: (implicitHeight - root.implicitHeight)/2
      // implicitWidth: appnameText.contentWidth + 15
      radius: 10
      implicitHeight: 20
      color: root.default_color
      Text {
        id: appnameText
        anchors.left: parent.left
        color: "white"
        text: " " + appnameProc.stdout.text
        font { pixelSize: root.default_font_size; bold: true }
      }
      Layout.fillWidth: true
      Process {
        id: appnameProc
        command: [root.home+"/.config/quickshell/scripts/app.sh"]
        stdout: StdioCollector {
          waitForEnd: true
        }
      }
      Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: appnameProc.running = true
      }
    }
    // ipstat
    Rectangle {
        Layout.bottomMargin: (implicitHeight - root.implicitHeight)/2
      implicitWidth: ipstatText.contentWidth + 15
      radius: 10
      implicitHeight: 20
      color: root.default_color
      Text {
        id: ipstatText
        anchors.centerIn: parent
        color: "white"
        text: ipstatProc.stdout.text
        font { pixelSize: root.default_font_size; bold: true }
      }
      Process {
        id: ipstatProc
        command: [root.home+"/.config/quickshell/scripts/ip.sh"]
        stdout: StdioCollector {
          waitForEnd: true
        }
      }
      Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: ipstatProc.running = true
      }
    }
    // memstat
    Rectangle {
        Layout.bottomMargin: (implicitHeight - root.implicitHeight)/2
      implicitWidth: memstatText.contentWidth + 15
      radius: 10
      implicitHeight: 20
      color: root.default_color
      Text {
        id: memstatText
        anchors.centerIn: parent
        color: "white"
        text: "   " + memstatProc.stdout.text
        font { pixelSize: root.default_font_size; bold: true }
      }
      Process {
        id: memstatProc
        command: [root.home+"/.config/quickshell/scripts/mem.sh"]
        stdout: StdioCollector {
          waitForEnd: true
        }
      }
      Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: memstatProc.running = true
      }
    }
    // cpustat
    Rectangle {
        Layout.bottomMargin: (implicitHeight - root.implicitHeight)/2
      implicitWidth: cpustatText.contentWidth + 15
      implicitHeight: 20
      radius: 10
      color: root.default_color
      Text {
        id: cpustatText
        anchors.centerIn: parent
        color: "white"
        text: "󰍛  " + cpustatProc.stdout.text
        font { pixelSize: root.default_font_size; bold: true }
      }
      Process {
        id: cpustatProc
        command: [root.home+"/.config/quickshell/scripts/cpu.sh"]
        stdout: StdioCollector {
          waitForEnd: true
        }
      }
      Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: cpustatProc.running = true
      }
    }
    Rectangle {
        Layout.bottomMargin: (implicitHeight - root.implicitHeight)/2
      id: batstat
      implicitWidth: batstatText.contentWidth + 15
      implicitHeight: 20
      radius: 10
      color: root.default_color
      Text {
        id: batstatText
        anchors.centerIn: parent
        color: "white"
        // text: ""
        text: batstatProc.stdout.text
        font { pixelSize: root.default_font_size; bold: true }
      }
      Process {
        id: batstatProc
        command: [root.home+"/.config/quickshell/scripts/bat.sh"]
        stdout: StdioCollector {
          waitForEnd: true
        }
      }
      Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: batstatProc.running = true
      }
    }
    // Layout
    Rectangle {
        Layout.bottomMargin: (implicitHeight - root.implicitHeight)/2
      id: langlayout
      implicitWidth: langlayoutText.contentWidth + 15
      implicitHeight: 20
      radius: 10
      color: root.default_color
      Text {
        id: langlayoutText
        anchors.centerIn: parent
        color: "white"
        // text: ""
        text: langlayoutProc.stdout.text
        font { pixelSize: root.default_font_size; bold: true }
      }
      Process {
        id: langlayoutProc
        command: [root.home+"/.config/quickshell/scripts/layout.sh"]
        stdout: StdioCollector {
          waitForEnd: true
        }
      }
      Timer {
        interval: 100
        running: true
        repeat: true
        onTriggered: langlayoutProc.running = true
      }
    }
    // timedate
    Rectangle {
        Layout.bottomMargin: (implicitHeight - root.implicitHeight)/2
      implicitWidth: timedateText.contentWidth + 15
      radius: 10
      implicitHeight: 20
      color: root.default_color
      Text {
        id: timedateText
        anchors.centerIn: parent
        color: "white"
        text: timedateProc.stdout.text
        font { pixelSize: root.default_font_size; bold: true }
      }
      Process {
        id: timedateProc
        command: ["date","+%Y-%m-%d %a %H:%M:%S"]
        stdout: StdioCollector {
          waitForEnd: true
        }
      }
      Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: timedateProc.running = true
      }
    }
  }
}
