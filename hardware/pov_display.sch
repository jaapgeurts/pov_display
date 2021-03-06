EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Rotating POV Display"
Date "2020-01-19"
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L PIC16F676-IP:PIC16F676-IP U1
U 1 1 5E0B438D
P 5650 3300
F 0 "U1" H 5650 4067 50  0000 C CNN
F 1 "PIC16F676-IP" H 5650 3976 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 5650 3300 50  0001 L BNN
F 3 "Microchip" H 5650 3300 50  0001 L BNN
F 4 "PDIP-14 Microchip" H 5650 3300 50  0001 L BNN "Field4"
	1    5650 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5E0DC58A
P 5850 1850
F 0 "C3" H 5965 1896 50  0000 L CNN
F 1 "100n" H 5965 1805 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5888 1700 50  0001 C CNN
F 3 "~" H 5850 1850 50  0001 C CNN
	1    5850 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5E0DEB9C
P 5850 2000
F 0 "#PWR05" H 5850 1750 50  0001 C CNN
F 1 "GND" H 5855 1827 50  0000 C CNN
F 2 "" H 5850 2000 50  0001 C CNN
F 3 "" H 5850 2000 50  0001 C CNN
	1    5850 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 2600 6950 3000
Wire Wire Line
	6950 3000 6750 3000
Wire Wire Line
	7000 2750 7000 3100
Wire Wire Line
	7000 3100 6750 3100
Wire Wire Line
	7050 2900 7050 3200
Wire Wire Line
	7050 3200 6750 3200
Wire Wire Line
	6750 1700 6750 2800
$Comp
L power:GND #PWR02
U 1 1 5E0FB0C0
P 2850 3600
F 0 "#PWR02" H 2850 3350 50  0001 C CNN
F 1 "GND" H 2855 3427 50  0000 C CNN
F 2 "" H 2850 3600 50  0001 C CNN
F 3 "" H 2850 3600 50  0001 C CNN
	1    2850 3600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Male J6
U 1 1 5E0FD8E1
P 3800 2400
F 0 "J6" H 3908 2781 50  0000 C CNN
F 1 "Conn_01x06_Male" H 3908 2690 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 3800 2400 50  0001 C CNN
F 3 "~" H 3800 2400 50  0001 C CNN
	1    3800 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2300 4400 2300
Wire Wire Line
	4000 2400 4950 2400
Wire Wire Line
	4950 2400 4950 2000
Wire Wire Line
	4950 2000 5850 2000
Connection ~ 5850 2000
Wire Wire Line
	4000 2500 4550 2500
Wire Wire Line
	4550 2500 4550 3000
Wire Wire Line
	4550 3100 4250 3100
Wire Wire Line
	4250 3100 4250 2600
Wire Wire Line
	4250 2600 4000 2600
$Comp
L power:VDD #PWR06
U 1 1 5E105251
P 6750 1700
F 0 "#PWR06" H 6750 1550 50  0001 C CNN
F 1 "VDD" H 6767 1873 50  0000 C CNN
F 2 "" H 6750 1700 50  0001 C CNN
F 3 "" H 6750 1700 50  0001 C CNN
	1    6750 1700
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR03
U 1 1 5E105918
P 4400 1550
F 0 "#PWR03" H 4400 1400 50  0001 C CNN
F 1 "VDD" H 4417 1723 50  0000 C CNN
F 2 "" H 4400 1550 50  0001 C CNN
F 3 "" H 4400 1550 50  0001 C CNN
	1    4400 1550
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR01
U 1 1 5E105E5F
P 3550 2350
F 0 "#PWR01" H 3550 2200 50  0001 C CNN
F 1 "VDD" H 3567 2523 50  0000 C CNN
F 2 "" H 3550 2350 50  0001 C CNN
F 3 "" H 3550 2350 50  0001 C CNN
	1    3550 2350
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR04
U 1 1 5E10831B
P 5850 1700
F 0 "#PWR04" H 5850 1550 50  0001 C CNN
F 1 "VDD" H 5867 1873 50  0000 C CNN
F 2 "" H 5850 1700 50  0001 C CNN
F 3 "" H 5850 1700 50  0001 C CNN
	1    5850 1700
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5E109F1C
P 4100 1600
F 0 "#FLG01" H 4100 1675 50  0001 C CNN
F 1 "PWR_FLAG" H 4100 1773 50  0000 C CNN
F 2 "" H 4100 1600 50  0001 C CNN
F 3 "~" H 4100 1600 50  0001 C CNN
	1    4100 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 1550 4400 1600
Connection ~ 4400 1600
Connection ~ 4100 1600
NoConn ~ 4000 2700
$Comp
L Device:C C2
U 1 1 5E1194E9
P 3750 3450
F 0 "C2" H 3865 3496 50  0000 L CNN
F 1 "100n" H 3865 3405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3788 3300 50  0001 C CNN
F 3 "~" H 3750 3450 50  0001 C CNN
	1    3750 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3300 3750 3300
Wire Wire Line
	3750 3600 3550 3600
Wire Wire Line
	4550 3400 4250 3400
Wire Wire Line
	4250 3600 3750 3600
Connection ~ 3750 3600
Wire Wire Line
	4400 3300 4450 3300
NoConn ~ 3000 2700
$Comp
L Diode:1N4148 D1
U 1 1 5E12A1FC
P 1750 2500
F 0 "D1" V 1704 2579 50  0000 L CNN
F 1 "1N4148" V 1795 2579 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 1750 2325 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 1750 2500 50  0001 C CNN
	1    1750 2500
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4148 D3
U 1 1 5E12B2A9
P 2200 2500
F 0 "D3" V 2154 2579 50  0000 L CNN
F 1 "1N4148" V 2245 2579 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2200 2325 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 2200 2500 50  0001 C CNN
	1    2200 2500
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4148 D2
U 1 1 5E12C267
P 1750 3000
F 0 "D2" V 1704 3079 50  0000 L CNN
F 1 "1N4148" V 1795 3079 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 1750 2825 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 1750 3000 50  0001 C CNN
	1    1750 3000
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4148 D4
U 1 1 5E12D61E
P 2200 3000
F 0 "D4" V 2154 3079 50  0000 L CNN
F 1 "1N4148" V 2245 3079 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2200 2825 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 2200 3000 50  0001 C CNN
	1    2200 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	2200 2650 2200 2800
Wire Wire Line
	1750 2650 1750 2700
Wire Wire Line
	1750 2350 2200 2350
Wire Wire Line
	2200 2350 2550 2350
Connection ~ 2200 2350
Wire Wire Line
	2200 3600 2200 3150
Wire Wire Line
	2200 3150 1750 3150
Connection ~ 2200 3150
Wire Wire Line
	1750 2700 1200 2700
Connection ~ 1750 2700
Wire Wire Line
	1750 2700 1750 2850
Wire Wire Line
	1200 2800 2200 2800
Connection ~ 2200 2800
Wire Wire Line
	2200 2800 2200 2850
$Comp
L Device:CP C1
U 1 1 5E13DF5D
P 2550 2800
F 0 "C1" H 2668 2846 50  0000 L CNN
F 1 "0.33uF" H 2668 2755 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 2588 2650 50  0001 C CNN
F 3 "~" H 2550 2800 50  0001 C CNN
	1    2550 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 2650 2550 2350
Wire Wire Line
	2550 2950 2550 3600
Connection ~ 2550 3600
Wire Wire Line
	2550 3600 2200 3600
$Comp
L Connector:Conn_01x01_Male J4
U 1 1 5E14505B
P 3350 3000
F 0 "J4" V 3504 2912 50  0000 R CNN
F 1 "Conn_01x01_Male" V 3413 2912 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 3350 3000 50  0000 C CNN
F 3 "~" H 3350 3000 50  0001 C CNN
	1    3350 3000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J3
U 1 1 5E1461D6
P 3350 3200
F 0 "J3" H 3458 3381 50  0000 C CNN
F 1 "Conn_01x01_Male" H 3458 3290 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 3350 3200 50  0001 C CNN
F 3 "~" H 3350 3200 50  0001 C CNN
	1    3350 3200
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J1
U 1 1 5E14C138
P 1000 2700
F 0 "J1" H 1108 2881 50  0000 C CNN
F 1 "Conn_01x01_Male" H 1108 2790 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 1000 2700 50  0001 C CNN
F 3 "~" H 1000 2700 50  0001 C CNN
	1    1000 2700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J2
U 1 1 5E14C6E8
P 1000 2800
F 0 "J2" H 1108 2981 50  0000 C CNN
F 1 "Conn_01x01_Male" H 1108 2890 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 1000 2800 50  0001 C CNN
F 3 "~" H 1000 2800 50  0001 C CNN
	1    1000 2800
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM7805_TO220 U2
U 1 1 5E212030
P 2850 2350
F 0 "U2" H 2850 2592 50  0000 C CNN
F 1 "LM7805_TO220" H 2850 2501 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 2850 2575 50  0001 C CIN
F 3 "http://www.fairchildsemi.com/ds/LM/LM7805.pdf" H 2850 2300 50  0001 C CNN
	1    2850 2350
	1    0    0    -1  
$EndComp
Connection ~ 2550 2350
Connection ~ 3550 2350
$Comp
L Device:CP C4
U 1 1 5E21A4A0
P 3250 2800
F 0 "C4" H 3368 2846 50  0000 L CNN
F 1 "0.1uF" H 3368 2755 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 3288 2650 50  0001 C CNN
F 3 "~" H 3250 2800 50  0001 C CNN
	1    3250 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2350 3250 2350
Wire Wire Line
	3250 2650 3250 2350
Connection ~ 3250 2350
Wire Wire Line
	3250 2350 3550 2350
Wire Wire Line
	3550 2350 3550 3000
$Comp
L Connector:Conn_01x01_Male J5
U 1 1 5E147E89
P 3350 3100
F 0 "J5" V 3412 3144 50  0000 L CNN
F 1 "Conn_01x01_Male" V 3503 3144 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 3350 3100 50  0001 C CNN
F 3 "~" H 3350 3100 50  0001 C CNN
	1    3350 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 3100 3900 3100
Wire Wire Line
	3900 3100 3900 3200
Wire Wire Line
	3900 3200 4550 3200
Wire Wire Line
	3550 3200 3550 3600
Connection ~ 3550 3600
Wire Wire Line
	3550 3600 3250 3600
Wire Wire Line
	3250 2950 3250 3600
Connection ~ 3250 3600
Wire Wire Line
	2850 2650 2850 3600
Connection ~ 2850 3600
Wire Wire Line
	2850 3600 2550 3600
Wire Wire Line
	2850 3600 3250 3600
$Comp
L Mechanical:MountingHole H1
U 1 1 5E24B221
P 1800 1450
F 0 "H1" H 1900 1496 50  0000 L CNN
F 1 "MountingHole" H 1900 1405 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1800 1450 50  0001 C CNN
F 3 "~" H 1800 1450 50  0001 C CNN
	1    1800 1450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5E24EF5B
P 2100 1450
F 0 "H3" H 2200 1496 50  0000 L CNN
F 1 "MountingHole" H 2200 1405 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 2100 1450 50  0001 C CNN
F 3 "~" H 2100 1450 50  0001 C CNN
	1    2100 1450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5E24F211
P 1800 1700
F 0 "H2" H 1900 1746 50  0000 L CNN
F 1 "MountingHole" H 1900 1655 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1800 1700 50  0001 C CNN
F 3 "~" H 1800 1700 50  0001 C CNN
	1    1800 1700
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5E24F457
P 2100 1650
F 0 "H4" H 2200 1696 50  0000 L CNN
F 1 "MountingHole" H 2200 1605 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 2100 1650 50  0001 C CNN
F 3 "~" H 2100 1650 50  0001 C CNN
	1    2100 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1650 4100 1600
Wire Wire Line
	4100 1600 4400 1600
$Comp
L Device:R R1
U 1 1 5E1046F4
P 4100 1800
F 0 "R1" H 4170 1846 50  0000 L CNN
F 1 "10k" H 4170 1755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4030 1800 50  0001 C CNN
F 3 "~" H 4100 1800 50  0001 C CNN
	1    4100 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 1950 4100 3300
$Comp
L Diode:BAT42 D12
U 1 1 5E124279
P 4250 3300
F 0 "D12" H 4250 3084 50  0000 C CNN
F 1 "BAT42" H 4250 3175 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4250 3125 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85660/bat42.pdf" H 4250 3300 50  0001 C CNN
	1    4250 3300
	-1   0    0    1   
$EndComp
Connection ~ 4100 3300
Wire Wire Line
	4250 3400 4250 3600
Wire Wire Line
	4400 1600 4400 2300
Wire Wire Line
	4000 2200 4450 2200
Wire Wire Line
	4450 2200 4450 3300
Connection ~ 4450 3300
Wire Wire Line
	4450 3300 4550 3300
Wire Wire Line
	4550 3500 4550 4000
Wire Wire Line
	7300 4000 4550 4000
Wire Wire Line
	7200 3500 6750 3500
Wire Wire Line
	7150 3400 6750 3400
Wire Wire Line
	7150 3200 7150 3400
Wire Wire Line
	7300 3200 7150 3200
Wire Wire Line
	7100 3300 6750 3300
Wire Wire Line
	7100 3050 7100 3300
Wire Wire Line
	7300 3050 7100 3050
Wire Wire Line
	7300 2900 7050 2900
Wire Wire Line
	7300 2750 7000 2750
Wire Wire Line
	7300 2600 6950 2600
Wire Wire Line
	7200 3350 7200 3500
Wire Wire Line
	7300 3350 7200 3350
Wire Wire Line
	7300 3500 7300 4000
$Comp
L Device:R R8
U 1 1 5E0C2307
P 7450 3350
F 0 "R8" V 7400 3200 50  0000 C CNN
F 1 "330" V 7450 3350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7380 3350 50  0001 C CNN
F 3 "~" H 7450 3350 50  0001 C CNN
	1    7450 3350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 5E0C2627
P 7450 3200
F 0 "R7" V 7400 3050 50  0000 C CNN
F 1 "330" V 7450 3200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7380 3200 50  0001 C CNN
F 3 "~" H 7450 3200 50  0001 C CNN
	1    7450 3200
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R6
U 1 1 5E0C2761
P 7450 3050
F 0 "R6" V 7400 2900 50  0000 C CNN
F 1 "330" V 7450 3050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7380 3050 50  0001 C CNN
F 3 "~" H 7450 3050 50  0001 C CNN
	1    7450 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R5
U 1 1 5E0C5DC6
P 7450 2900
F 0 "R5" V 7400 2750 50  0000 C CNN
F 1 "330" V 7450 2900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7380 2900 50  0001 C CNN
F 3 "~" H 7450 2900 50  0001 C CNN
	1    7450 2900
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R4
U 1 1 5E0C5F92
P 7450 2750
F 0 "R4" V 7400 2600 50  0000 C CNN
F 1 "330" V 7450 2750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7380 2750 50  0001 C CNN
F 3 "~" H 7450 2750 50  0001 C CNN
	1    7450 2750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 5E0C61D6
P 7450 2600
F 0 "R3" V 7400 2450 50  0000 C CNN
F 1 "330" V 7450 2600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7380 2600 50  0001 C CNN
F 3 "~" H 7450 2600 50  0001 C CNN
	1    7450 2600
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D9
U 1 1 5E0D0D74
P 7750 3200
F 0 "D9" H 7900 3150 50  0000 C CNN
F 1 "LED" H 7750 3200 50  0000 C CNN
F 2 "LED_THT:LED_Rectangular_W5.0mm_H5.0mm" H 7750 3200 50  0001 C CNN
F 3 "~" H 7750 3200 50  0001 C CNN
	1    7750 3200
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D7
U 1 1 5E0D144B
P 7750 2900
F 0 "D7" H 7900 2850 50  0000 C CNN
F 1 "LED" H 7750 2900 50  0000 C CNN
F 2 "LED_THT:LED_Rectangular_W5.0mm_H5.0mm" H 7750 2900 50  0001 C CNN
F 3 "~" H 7750 2900 50  0001 C CNN
	1    7750 2900
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D6
U 1 1 5E0D1764
P 7750 2750
F 0 "D6" H 7900 2700 50  0000 C CNN
F 1 "LED" H 7750 2750 50  0000 C CNN
F 2 "LED_THT:LED_Rectangular_W5.0mm_H5.0mm" H 7750 2750 50  0001 C CNN
F 3 "~" H 7750 2750 50  0001 C CNN
	1    7750 2750
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D10
U 1 1 5E0D0A12
P 7750 3350
F 0 "D10" H 7900 3300 50  0000 C CNN
F 1 "LED" H 7750 3350 50  0000 C CNN
F 2 "LED_THT:LED_Rectangular_W5.0mm_H5.0mm" H 7750 3350 50  0001 C CNN
F 3 "~" H 7750 3350 50  0001 C CNN
	1    7750 3350
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D11
U 1 1 5E0CFB03
P 7750 3500
F 0 "D11" H 7900 3450 50  0000 C CNN
F 1 "LED" H 7750 3500 50  0000 C CNN
F 2 "LED_THT:LED_Rectangular_W5.0mm_H5.0mm" H 7750 3500 50  0001 C CNN
F 3 "~" H 7750 3500 50  0001 C CNN
	1    7750 3500
	-1   0    0    1   
$EndComp
$Comp
L Device:R R9
U 1 1 5E0C11FD
P 7450 3500
F 0 "R9" V 7400 3350 50  0000 C CNN
F 1 "330" V 7450 3500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7380 3500 50  0001 C CNN
F 3 "~" H 7450 3500 50  0001 C CNN
	1    7450 3500
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5E0DF1C2
P 8100 3800
F 0 "#PWR07" H 8100 3550 50  0001 C CNN
F 1 "GND" H 8105 3627 50  0000 C CNN
F 2 "" H 8100 3800 50  0001 C CNN
F 3 "" H 8100 3800 50  0001 C CNN
	1    8100 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D5
U 1 1 5E0D19FB
P 7750 2600
F 0 "D5" H 7900 2550 50  0000 C CNN
F 1 "LED" H 7750 2600 50  0000 C CNN
F 2 "LED_THT:LED_Rectangular_W5.0mm_H5.0mm" H 7750 2600 50  0001 C CNN
F 3 "~" H 7750 2600 50  0001 C CNN
	1    7750 2600
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D8
U 1 1 5E0D0F6B
P 7750 3050
F 0 "D8" H 7900 3000 50  0000 C CNN
F 1 "LED" H 7750 3050 50  0000 C CNN
F 2 "LED_THT:LED_Rectangular_W5.0mm_H5.0mm" H 7750 3050 50  0001 C CNN
F 3 "~" H 7750 3050 50  0001 C CNN
	1    7750 3050
	-1   0    0    1   
$EndComp
Wire Wire Line
	7900 3500 8100 3500
Wire Wire Line
	8100 3500 8100 3350
Wire Wire Line
	8100 2600 7900 2600
Wire Wire Line
	8100 3500 8100 3800
Connection ~ 8100 3500
Wire Wire Line
	7900 3350 8100 3350
Connection ~ 8100 3350
Wire Wire Line
	8100 3350 8100 3200
Connection ~ 8100 3200
Wire Wire Line
	8100 3200 8100 3050
Wire Wire Line
	7900 3050 8100 3050
Connection ~ 8100 3050
Wire Wire Line
	8100 3050 8100 2900
Wire Wire Line
	7900 3200 8100 3200
Wire Wire Line
	7900 2900 8100 2900
Connection ~ 8100 2900
Wire Wire Line
	8100 2900 8100 2750
Connection ~ 8100 2750
Wire Wire Line
	8100 2750 8100 2600
Connection ~ 8100 3800
Wire Wire Line
	7900 2750 8100 2750
Wire Wire Line
	6750 3800 8100 3800
$Comp
L Graphic:Logo_Open_Hardware_Small #LOGO1
U 1 1 5E6ACFFD
P 10900 6850
F 0 "#LOGO1" H 10900 7125 50  0001 C CNN
F 1 "Logo_Open_Hardware_Small" H 10900 6625 50  0001 C CNN
F 2 "Symbol:OSHW-Logo2_7.3x6mm_SilkScreen" H 10900 6850 50  0001 C CNN
F 3 "~" H 10900 6850 50  0001 C CNN
	1    10900 6850
	1    0    0    -1  
$EndComp
Text Notes 7000 7100 0    43   ~ 0
Copyright © Jaap Geurts 2020\n\nThis documentation describes Open Hardware and is licensed under the CERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the CERN OHL v.1.1.\n(http://ohwr.org/cernohl). This documentation is distributed WITHOUT ANY EXPRESS OR IMPLIED\nWARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A PARTICULAR PURPOSE. \n\nPlease see the CERN OHL v.1.1 for applicable conditions
$EndSCHEMATC
