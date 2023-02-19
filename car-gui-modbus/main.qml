import QtQuick 2.12
import QtQuick.Window 2.13
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0
import QtLocation 5.11
import QtPositioning 5.0

Window {
	id : root
	width: 1380
	//maximumWidth : 1280
	//minimumWidth : width
    height: 800
	//maximumHeight : 800
	//minimumHeight : height
	title:"membuat windows"
	color : "#000212"
    visible: true
    //flags: Qt.WindowMaximized //Qt.Dialog
	
	Text {
			anchors.horizontalCenter: parent.horizontalCenter
			y : 10
			text :"IoT CAR CONTROLLER"
			color : "#00FF00"
			font.family : "Seven Segment"
			font.pixelSize: 60
			
		}
	
	
	
	
	
	
	Text {
		id : tombol_overview_color_code
		x:0
		y:0
		text : "red"
		visible : false
		
		
	}
	
	Button {
		id : tombol_overview
		x : 50
		y : 100
		width : 100
		height : 100
		checkable : true
		checked : true
		
		Rectangle {
			id : tombol_preview_color
			height : parent.height
			width : parent.width
			color : tombol_overview_color_code.text
			
			Image {
			
			height : parent.height
			width : parent.width
			source : "car_white.png"
			
			}
			
			
			
		}
		
		onClicked:{
			tombol_control.checked = false
			tombol_peta.checked = false
		}
		
	}
	
	
	Button {
		id : tombol_control
		x : 50
		y : 230
		width : 100
		height : 100
		checkable : true
		
		Rectangle {
			id : tombol_control_color
			height : parent.height
			width : parent.width
		
			Image {
			
			height : parent.height
			width : parent.width
			source : "control_white.png"
			
			}
		
		}
		
		onClicked:{
			tombol_overview.checked = false
			tombol_peta.checked = false
			
		}
	
		
		
	}
	
	
	Button {
		id : tombol_peta
		x : 50
		y : 360
		width : 100
		height : 100
		checkable : true
		
		Rectangle {
			id : tombol_peta_color
			height : parent.height
			width : parent.width
		
			Image {
			
			height : parent.height
			width : parent.width
			source : "peta.png"
			
			}
		
		}
	
		
		
		onClicked:{
			tombol_overview.checked = false
			tombol_control.checked = false
		}
	
	}
	
	
	
	
	
	Rectangle{
		id : halaman_overview
		x: 200
		y : 100
		width : 1020
		height : 600
		color : "transparent"
		border.color : "#39FF14"
		border.width : 10
		visible : tombol_overview.checked
		
		Text {
			anchors.horizontalCenter: parent.horizontalCenter
			y : 10
			text :"HALAMAN OVERVIEW"
			color : "#00FF00"
			font.family : "Seven Segment"
			font.pixelSize: 35
			
		}
		
		
		Rectangle{
		//speedometer
		x: 300
		y : 80
		width : 680
		height : 300
		color : "transparent"
		border.color : "#39FF14"
		border.width : 5
			
			Text {
			anchors.horizontalCenter: parent.horizontalCenter
			y : 10
			text :"ENGINE STATUS"
			color : "#00FF00"
			font.family : "Seven Segment"
			font.pixelSize: 25
			
			}
			
		
		
		CircularGauge {
		id : speed_gauge
		x: 20
		y: 50
		height : 200
		width : 200
		value: 0
		minimumValue: 0
		maximumValue: 200
		
		style: CircularGaugeStyle {
			labelStepSize: 20
			
			
			needle: Rectangle {
					y: outerRadius * 0.15
					implicitWidth: outerRadius * 0.03
					implicitHeight: outerRadius * 0.9
					antialiasing: true
					color: "#04f8fa"
				}
		}
		
	}
	
	
	Text {
			x: 10
			y : 250
			text : "car speed : " + speed_gauge.value + " Km/h"
			color : "#04f8fa"
			font.family : "Seven Segment"
			font.pixelSize: 20
			
		}
		
		
	CircularGauge {
		id : rpm_gauge
		x: 250
		y: 50
		height : 200
		width : 200
		value: 0
		minimumValue: 0
		maximumValue: 2000
		
		style: CircularGaugeStyle {
			labelStepSize: 200
			
			
			needle: Rectangle {
					y: outerRadius * 0.15
					implicitWidth: outerRadius * 0.03
					implicitHeight: outerRadius * 0.9
					antialiasing: true
					color: "#04f8fa"
				}
		}
		
	}
	
	Text {
			x: 250
			y : 250
			text : "wheels speed : " + rpm_gauge.value + " rpm"
			color : "#04f8fa"
			font.family : "Seven Segment"
			font.pixelSize: 20
			
		}
		
	CircularGauge {
		id : fuel_gauge
		x: 500
		y: 100
		height : 150
		width : 150
		value: 34
		minimumValue: 0
		maximumValue: 50
		
		style: CircularGaugeStyle {
			labelStepSize: 5
			
			
			needle: Rectangle {
					y: outerRadius * 0.15
					implicitWidth: outerRadius * 0.03
					implicitHeight: outerRadius * 0.9
					antialiasing: true
					color: "red"
				}
		}
		
	}
	
	Text {
			x: 500
			y : 250
			text : "FUEL : " + fuel_gauge.value + " liter"
			color : "red"
			font.family : "Seven Segment"
			font.pixelSize: 20
			
		}
		
	
	
		
	}
		
		
		
		
		Rectangle{
		//batre
		x: 40
		y : 80
		width : 250
		height : 300
		color : "transparent"
		border.color : "#39FF14"
		border.width : 5
		
		Text {
			anchors.horizontalCenter: parent.horizontalCenter
			y : 10
			text :"BATTERY LEVEL"
			color : "#00FF00"
			font.family : "Seven Segment"
			font.pixelSize: 25
			
		}
		
		Rectangle{
		//buat ngubah posisi batre tanpa mengganggu yg lain
		x : -50
		y : 0
		color : "transparent"
		
		Image {
			x : 30
			y : 130
			height : 80
			width :200
			source : "battery.png"
			rotation : -90
			
			
		}
		
		
		Gauge {
		id : gauge_battery
		x: 75
		y: 95
		height : 170
		width : 70
		minimumValue: 0
		value: 50
		font.pixelSize: 1
		minorTickmarkCount: 0
		maximumValue: 100
		tickmarkStepSize: 100
		
		style: GaugeStyle {
			
			valueBar: Rectangle {
				color: "#04f8fa"
				implicitWidth: 70
			}	
		
			tickmark: Item {
				implicitWidth: 18
				implicitHeight: 1

				Rectangle {
					visible : false
					color: "#c8c8c8"
					anchors.fill: parent
					anchors.leftMargin: 3
					anchors.rightMargin: 3
				}
			}
		
		
		}
		
		}
		
		Text {
			x: 200
			y : 140
			text : gauge_battery.value
			color : "#04f8fa"
			font.family : "Seven Segment"
			font.pixelSize: 80
			
		}
		
		
		
	}
		
		
		
		
		
		}
		
		
		Rectangle{
		//cuaca
		x: 40
		y : 400
		width : 940
		height : 170
		color : "transparent"
		border.color : "#39FF14"
		border.width : 5
			
			Text {
				anchors.horizontalCenter: parent.horizontalCenter
				y : 10
				text :"WEATHER STATION"
				color : "#00FF00"
				font.family : "Seven Segment"
				font.pixelSize: 25
			
			}
		
		Image {
			x : 10
			y : 10
			width : 150
			height : 150
			source : "weather.png"
			
			
		}
		
		Text {
			id : temp_hum
			x: 180
			y : 70
			text : "Temp : 26 °C   Hum : 50%   Wind : 0.3 Kt"
			color : "#04f8fa"
			font.family : "Seven Segment"
			font.pixelSize: 40
			
		}
		
		
		
		
		}
		
		
		
	}
	



	
	Rectangle{
		id : halaman_control
		x: 200
		y : 100
		width : 1020
		height : 600
		color : "transparent"
		border.color : "#39FF14"
		border.width : 10
		visible : tombol_control.checked
		
		Text {
			anchors.horizontalCenter: parent.horizontalCenter
			y : 10
			text :"HALAMAN CONTROL"
			color : "#00FF00"
			font.family : "Seven Segment"
			font.pixelSize: 35
			
		}
		
		
		Rectangle{
		//AC
		x: 40
		y : 80
		width : 450
		height : 100
		color : "transparent"
		border.color : "#39FF14"
		border.width : 2
		
		Text {
			anchors.horizontalCenter: parent.horizontalCenter
			y : 10
			text :"AIR CONDITIONER"
			color : "#00FF00"
			font.family : "Seven Segment"
			font.pixelSize: 20
			
		}
		
		Image {
			x: 10
			y : 30
			width : 50
			height : 50
			source : "fan.png"
			
		}
		
		
		Slider {
		id: slider_ac
		x:80
		y:50
		height: 20
		width: 300
		value: 0
		from:0
		to: 5
		stepSize: 1
		orientation: Qt.Horizontal
		onValueChanged: {
		}
		
		
		
		
	}
		
		Text {
			x: 400
			y : 40
			text : slider_ac.value
			color : "#04f8fa"
			font.family : "Seven Segment"
			font.pixelSize: 40
			
		}
		
		
		
		}
		
	
	Rectangle{
		//turn signal lamp
		x: 500
		y : 80
		width : 490
		height : 220
		color : "transparent"
		border.color : "#39FF14"
		border.width : 2
		
		Text {
			anchors.horizontalCenter: parent.horizontalCenter
			y : 10
			text :"TURN SIGNAL LAMP"
			color : "#00FF00"
			font.family : "Seven Segment"
			font.pixelSize: 20
			
		}
		
		
		Button{
			id : left_lamp
			x : 50
			y : 70
			height : 100
			width : 100
			checkable : true
			
			onClicked:{
			warning_lamp.checked = false
			right_lamp.checked =  false
		}
			
			Rectangle{
			id : left_lamp_color
			height : parent.height
			width : parent.width
			color : "#04f8fa"
			
			Image {
			height : parent.height
			width : parent.width
			rotation : 90	
			source : "arrow.png"
			}
			
			}
			
			
		}
		
		Button{
			id : warning_lamp
			x : 200
			y : 70
			height : 100
			width : 100
			checkable : true
			
			Rectangle{
			id : warning_lamp_color
			height : parent.height
			width : parent.width
			color : "#04f8fa"
			Image {
			height : parent.height
			width : parent.width
			rotation : 0	
			source : "warning sign.png"
			}
			}
			
			onClicked:{
			left_lamp.checked = false
			right_lamp.checked =  false
		}
			
		}
		
		
		Button{
			id : right_lamp
			x : 350
			y : 70
			height : 100
			width : 100
			checkable : true
			
			onClicked:{
			warning_lamp.checked = false
			left_lamp.checked =  false
		}
			Rectangle{
			id : right_lamp_color
			height : parent.height
			width : parent.width
			color : "#04f8fa"
			
			Image {
			height : parent.height
			width : parent.width
			rotation : -90	
			source : "arrow.png"
			}
			
			}
			
			
			
		}
		
		
		
		
	}
	
	
	Rectangle{
		//WIPER
		x: 40
		y : 200
		width : 450
		height : 100
		color : "transparent"
		border.color : "#39FF14"
		border.width : 2
		
		Text {
			anchors.horizontalCenter: parent.horizontalCenter
			y : 10
			text :"WIPER"
			color : "#00FF00"
			font.family : "Seven Segment"
			font.pixelSize: 20
			
		}
		
		
		Image {
			x: 10
			y : 30
			width : 70
			height : 50
			source : "wiper.png"
			
		}
		
		Slider {
		id: slider_wiper
		x:80
		y:50
		height: 20
		width: 300
		value: 0
		from:0
		to: 5
		stepSize: 1
		orientation: Qt.Horizontal
		onValueChanged: {
		}
		
		
		
		
	}
		
		Text {
			x: 400
			y : 40
			text : slider_wiper.value
			color : "#04f8fa"
			font.family : "Seven Segment"
			font.pixelSize: 40
			
		}
		
		
	}
		
	
		Rectangle{
		//MOBIL
		x: 40
		y : 310
		width : 950
		height : 270
		color : "transparent"
		border.color : "#39FF14"
		border.width : 2
		
		Text {
			anchors.horizontalCenter: parent.horizontalCenter
			y : 10
			text :"CAR SENSORS"
			color : "#00FF00"
			font.family : "Seven Segment"
			font.pixelSize: 20
			
		}
		
		
		Text {
			x : 40
			y : 50
			text :"Front Left Tires Pressure : 28 Psi"
			color : "#04f8fa"
			font.family : "Seven Segment"
			font.pixelSize: 20
			
		}
		
		
		Text {
			x : 40
			y : 220
			text :"Front Right Tires Pressure : 28 Psi"
			color : "#04f8fa"
			font.family : "Seven Segment"
			font.pixelSize: 20
			
		}
		
		
		Text {
			x : 500
			y : 50
			text :"Back Left Tires Pressure : 28 Psi"
			color : "#04f8fa"
			font.family : "Seven Segment"
			font.pixelSize: 20
			
		}
		
		
		Text {
			x : 500
			y : 220
			text :"Back Right Tires Pressure : 28 Psi"
			color : "#04f8fa"
			font.family : "Seven Segment"
			font.pixelSize: 20
			
		}
		
		
		Image {
			x : 250
			y : 20
			width : 300
			height : 250
			source : "car top.png"
			
		}
		
		Image {
			x : 570
			y : 110
			width : 150
			height : 70
			source : "ultrasonic.png"
			
		}
		
		Text {
			x : 750
			y : 90
			text :"Parking Sensor : "
			color : "#04f8fa"
			font.family : "Seven Segment"
			font.pixelSize: 20
			
		}
		
		Text {
			id : parking_status
			x : 750
			y : 120
			text :"SAFE"
			color : "#04f8fa"
			font.family : "Seven Segment"
			font.pixelSize: 60
			
		}
		
		
		
		}
		
		
	
	}
	
	
	Rectangle{
		id : halaman_peta
		x: 200
		y : 100
		width : 1020
		height : 600
		color : "transparent"
		border.color : "#39FF14"
		border.width : 10
		visible : tombol_peta.checked
		
		Text {
			anchors.horizontalCenter: parent.horizontalCenter
			y : 10
			text :"HALAMAN PETA"
			color : "#00FF00"
			font.family : "Seven Segment"
			font.pixelSize: 35
			
		}
		
		Rectangle{
		//compass	
		
		x: 30
		y : 70
		width : 240
		height : 500
		color : "transparent"
		border.color : "#39FF14"
		border.width : 3
		
		
		Text {
			anchors.horizontalCenter: parent.horizontalCenter
			y : 10
			text :"COMPASS SENSOR"
			color : "#00FF00"
			font.family : "Seven Segment"
			font.pixelSize: 30
			
		}
		
		
		
		Rectangle{
		//compass	
		
		anchors.horizontalCenter: parent.horizontalCenter
		y : 120
		width : 160
		height : 160
		color : "transparent"
		border.color : "#39FF14"
		border.width : 3
		radius: width*0.5
		
		Text {
			anchors.horizontalCenter: parent.horizontalCenter
			y : -40
			text :"N"
			color : "#00FF00"
			font.family : "Seven Segment"
			font.pixelSize: 30
			
		}
		
		Text {
			x : 170
			anchors.verticalCenter: parent.verticalCenter
			text :"E"
			color : "#00FF00"
			font.family : "Seven Segment"
			font.pixelSize: 30
			
		}
		
		Text {
			x : -30
			anchors.verticalCenter: parent.verticalCenter
			text :"W"
			color : "#00FF00"
			font.family : "Seven Segment"
			font.pixelSize: 30
			
		}
		
		Text {
			anchors.horizontalCenter: parent.horizontalCenter
			y : 170
			text :"S"
			color : "#00FF00"
			font.family : "Seven Segment"
			font.pixelSize: 30
			
		}
		
		Image{
		id : compass_arrow
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.verticalCenter: parent.verticalCenter
		width : 70
		height : 70
		source : "navigasi.png"
		rotation : 270
		
			
		}
		
		Text {
			anchors.horizontalCenter: parent.horizontalCenter
			y : 220
			text :"COMPASS VALUE : "
			color : "#04f8fa"
			font.family : "Seven Segment"
			font.pixelSize: 30
			
		}
		
		Text {
			anchors.horizontalCenter: parent.horizontalCenter
			y : 270
			text : compass_arrow.rotation + " °"
			color : "#04f8fa"
			font.family : "Seven Segment"
			font.pixelSize: 60
			
		}
		
		
		
		}
	}
		
		
		
		
		
		Rectangle {
            id: map1
            x : 280
            y: 70
            width: 600
            height: 500
            color: "#958c8c"
            //radius: 6
            //border.color: "#6c6c6c"
            //border.width: 7
			border.color : "#39FF14"
			border.width : 10
			
			Text{
			id : theme
			x : 100
			y : 0
			text : ""

			}				
			
			
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#958c8c"
                }

                GradientStop {
                    position: 1
                    color: "#808080"
                }



            }
	
	
	
	
	
	
	
	
	Rectangle {
                id: mapGroup
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width - 10
                height: parent.height - 10
				
                property int count : 0
                property real lati : -6.000507
                property real longi : 106.687493	
				
				Map{
                    id: map
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width 
                    height: parent.height 
                    color: "#f9f9f9"
                    anchors.rightMargin: 8
                    anchors.centerIn: parent;
                    anchors.fill: parent
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: 0
                    anchors.bottomMargin: 0
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0
					zoomLevel : 150
                    maximumZoomLevel: 150.4
                    copyrightsVisible: true
                    antialiasing: true
                    maximumTilt: 189.3
                    plugin: mapPlugin
                    activeMapType: supportedMapTypes[3]

                    center: QtPositioning.coordinate(latitude_position_value.text, longitude_position_value.text)

                    gesture.enabled: true
                    gesture.acceptedGestures: MapGestureArea.PinchGesture | MapGestureArea.PanGesture
				
				
				
				Plugin {
					id: mapPlugin
                             name: "osm" // "mapboxgl", "esri", ...
                             // specify plugin parameters if necessary
                             
							 PluginParameter {
                                 name: "osm.mapping.providersrepository.enabled"
                                 value: "true"
                             }
                             PluginParameter {
                                 name: "osm.mapping.providersrepository.address"
                                 value: "http://maps-redirect.qt.io/osm/5.6/"
                             }		 
                         }
				
				Line{
                    id: line
                }
                Line1{
                    id: line1
                }
				
				
				ListModel{
					id: md
				}
				
				ListModel{
					id: md1
				}
				
				
				
				Timer {

                    function updateloc() {
                       
					if (line1.pathLength() < 500){
                                var text = md1.count + 1;

                                md1.append({"coords": QtPositioning.coordinate(latitude_position_value.text, longitude_position_value.text),
                                               "title": text})
											   
					}

					
                       if (clear_line_track.checked == false){
							var text = md1.count + 1;

                            md1.append({"coords": QtPositioning.coordinate(latitude_position_value.text, longitude_position_value.text),
                                           "title": text})
                            line1.addCoordinate(QtPositioning.coordinate(latitude_position_value.text, longitude_position_value.text))
                        }

                        if (line1.pathLength() >= 50){
						if (clear_line_track.checked == true){
                            for (var index = line1.pathLength(); index >= 0; index--)
                            {
                                line1.removeCoordinate([index]);
                            }
						
						clear_line_track.checked = false						
						
						
                        }
						}
						
                    }
                    interval: 1000; running: true; repeat: true
                    onTriggered: {
                        updateloc()
                    }
                }


				
				Text {
                id: latitude_position_value
                x: 10
                y: 10
                width: 83
                height: 21
                color: "navy"
                text: qsTr("-6.89812")
                font.pixelSize: 14
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                font.family: "Verdana"
                font.bold: true
				visible  : false
            }

            Text {
                id: longitude_position_value
                x: 10
                y: 50
                width: 83
                height: 21
                color: "navy"
                text: qsTr("107.6088")
                font.pixelSize: 14
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                font.family: "Verdana"
                font.bold: true
				visible : false
            }
				
			
			
			
			
			
			
			
				MouseArea {
                        hoverEnabled: true
                        property var coordinate: map.toCoordinate(Qt.point(mouseX, mouseY))
                        x: 0
                        y: 0
                        width: parent.width
                        height: parent.height
                        

                        Label
                        {
                            x: parent.mouseX - width
                            y: parent.mouseY - height - 5
                            text: (parent.coordinate.latitude).toFixed(6) + "," +(parent.coordinate.longitude).toFixed(6)
                            color:"navy"

                        }
						
						
						Text{
						id : lat_mouse
						x: parent.mouseX - width
                        y: parent.mouseY - height - 5
						text: (parent.coordinate.latitude).toFixed(6)
						color : "red"
						visible : false
						
						}
					
						Text{
						id : long_mouse
						x: parent.mouseX - width
                        y: parent.mouseY - height - 5
						text: (parent.coordinate.longitude).toFixed(6)
						color : "red"
						visible : false
						
						}
						
						property var panjanglintasan: line.pathLength()
						property var path: line.path
						
                        onPressAndHold: {
                            //var crd = map.toCoordinate(Qt.point(mouseX, mouseY))
							
							
							console.log("clicked")
                            if (md.count < 1){
                                
                            }
                            else if (md.count > 0){
                                
                            }

                            markerModel.append({ "latitude":lat_mouse.text, "longitude": long_mouse.text})
                            var text = md.count + 1;
                            md.append({"coords": coordinate, "title": text})
                            line.addCoordinate(coordinate)

                            
                        }

                        onDoubleClicked: {
                            var coor = map.toCoordinate(Qt.point(mouseX, mouseY))
                            var text1 = md1.count + 1;
                            md1.append({"coords": coordinate, "title": text1})
                            line1.addCoordinate(coordinate)
                        }
						
						
						
                    }

					
				
				MapQuickItem{
                    id : marker
                    sourceItem : Image{
                        id: imagenavigasi
                        width: 53
                        height: 47
                        //transformOrigin: Item.Center
                        source:"car top.png"
						//source:"segitiga.png"
                        //rotation: 0
                        fillMode: Image.PreserveAspectFit
                        transform: [
                            Rotation {
                                id: markerdirect
                                origin.x: 15
                                origin.y: 14
                                angle: 0
                            }]
                    }
                    coordinate: QtPositioning.coordinate(latitude_position_value.text, longitude_position_value.text)
                    //coordinate: QtPositioning.coordinate(2.73706666666667, 125.36065)
                    anchorPoint.x : 15
                    anchorPoint.y : 14
                    //anchorPoint.x : parent
                    //anchorPoint.y : parent

                }
				
				
				
				
				MapItemView {
                    id: mivMarker
                    model: ListModel {
                        id: markerModel
                    }
                    delegate: Component {
                        MapQuickItem {
                            coordinate: QtPositioning.coordinate(latitude, longitude)
                            property real slideIn: 0
                        }
                    } 
                }
				
				}
				
				
				
               

		   }


	
	}
	
	
	
	
	Button {
            id: clear_line_track
            x: 900
            y: 500
            text : "clear line track"
			//width: 34
            //height: 31
            checkable: true
            checked: false
			
			
		Rectangle {
			width : parent.width
			height : parent.height
			color : "#df1c39"
		   
		   
		}
		   onClicked:{
						markerModel.clear()
						md.clear()
						 for (var index = line.pathLength(); index >= 0; index--)
                                {
                                    //console.log(li.pathLength())
                                    line.removeCoordinate([index]);
                                    line1.removeCoordinate([index]);
                                    //li.removeCoordinate(li.coordinateAt[index]);
                                    //console.log("Removing ", li.pathLength[index])
                                    //console.log(li.pathLength())
                                }
					}
			
        }
    
		
		
		
		
	}
	
	
	
	
	
	Timer{
		id: gui_timer
		interval: 50
		repeat: true
		running: true
		onTriggered: {
			if(tombol_overview.checked == true){
				tombol_overview_color_code.text = "#04f8fa";
				
			}else
				if(tombol_overview.checked == false){
				tombol_overview_color_code.text = "#df1c39";
		 
			}
			
			if(tombol_control.checked == true){
				tombol_control_color.color = "#04f8fa";
				
			}else
				if(tombol_control.checked == false){
				tombol_control_color.color = "#df1c39";
		 
			}
			
			if(tombol_peta.checked == true){
				tombol_peta_color.color = "#04f8fa";
				
			}else
				if(tombol_peta.checked == false){
				tombol_peta_color.color = "#df1c39";
		 
			}
			
			
			if(left_lamp.checked == true){
				left_lamp_color.color = "#04f8fa";
				
			}else
				if(left_lamp.checked == false){
				left_lamp_color.color = "#df1c39";
		 
			}
			
			
			if(warning_lamp.checked == true){
				warning_lamp_color.color = "#04f8fa";
				
			}else
				if(warning_lamp.checked == false){
				warning_lamp_color.color = "#df1c39";
		 
			}
			
			if(right_lamp.checked == true){
				right_lamp_color.color = "#04f8fa";
				
			}else
				if(right_lamp.checked == false){
				right_lamp_color.color = "#df1c39";
		 
			}
			
			backend.left(left_lamp.checked)
			backend.warning(warning_lamp.checked)
			backend.right(right_lamp.checked)
			
			gauge_battery.value = backend.battery()
			temp_hum.text = "Temp : " + backend.temperature() +  " °C Hum : " + backend.humidity() +   "  Wind : 0.3 Kt"
			parking_status.text = backend.infrared()
			
			if(parking_status.text == "SAFE"){
				parking_status.color = "#04f8fa";
				
			}else
				if(parking_status.text == "DANGER"){
				parking_status.color = "#df1c39";
		 
			}
			
		}
		
	}
	
	
}













