/* This file is generated and only relevant for integrating the project into a Qt 6 and cmake based
C++ project. */

import QtQuick
import content
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick3D
import QtQuick3D.Helpers

ApplicationWindow {
    id: window
    width: 1280
    height: 720
    visible: true
    title: "Attempt 1"

    property bool isLandscape: width > height
    ListModel{
        id: objects3dModel
    }

    View3D {
        id: v3d
        anchors.left: window.isLandscape ? controlsPane.right : parent.left
        anchors.top: window.isLandscape ? parent.top : controlsPane.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        camera: OrthographicCamera

        environment: SceneEnvironment {
            id: env
            backgroundMode: SceneEnvironment.Color
            clearColor: "#002b36"
        }

        Node {
            id: originNode
            PerspectiveCamera {
                id: cameraNode
                z: 600
            }
        }

        DirectionalLight {
            id: directionalLight
            color: Qt.rgba(0.4, 0.2, 0.6, 1.0)
            ambientColor: Qt.rgba(0.1, 0.1, 0.1, 1.0)
        }

        PointLight {
            id: pointLight
            position: Qt.vector3d(0, 0, 100)
            color: Qt.rgba(0.1, 1.0, 0.1, 1.0)
            ambientColor: Qt.rgba(0.2, 0.2, 0.2, 1.0)
        }
        Repeater3D{
        id: modelInstantiator
        model: objects3dModel
        delegate: Model {
            visible: true
            scale: Qt.vector3d(100, 100, 100)
            geometry: GridGeometry {
                id: grid
                horizontalLines: i
                verticalLines: j
            }
            materials: [
                DefaultMaterial {
                }
            ]
        }
        }
    }

    Pane {
        id: controlsPane
        width: window.isLandscape ? implicitWidth : window.width
        height: window.isLandscape ? window.height : implicitHeight

        ColumnLayout{
            ListView{
                model: objects3dModel
                delegate: Label{
                    text: ModelName
                }
            }

            Button{
                text: "Add Cube"
            }
            Button{
                text: "Add Cylynder"
            }
            Button{
                text: "Add Sphere"
            }
            Button{
                text: "Add Torus"
                onClicked: objects3dModel.append({"i":20, "j":20, "ModelName": "Grid"})
            }
        }
    }
}


