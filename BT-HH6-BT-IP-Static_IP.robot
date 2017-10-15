# ============================================================================
#
# Copyright : (c) 2017 SAGEMCOM - ATR-SST
#
# The information and source code contained herein is the exclusive
# property of SAGEMCOM and may not be disclosed, examined, or
# reproduced in whole or in part without explicit written authorization
# of the company.
# Author : BEN CHAABEN Wissem : G507954
# ============================================================================

*** Setting ***
Library			OperatingSystem
Library           	SikuliLibrary
Library			Selenium2Library
Library			String
Library			Process
Suite Setup          	Init Suite

Documentation        	Static ip HH6 Test

*** variables ***
${IMAGE_DIR}      ${CURDIR}//imgHH6

*** Test cases ***

HH6-6525		# The BT should be in reset mode to make this test running
	Test Setup
	Enable Static IP and try to enter an ip address
	Typing defaut IP 0.0.0.0 should not be possible
	Typing localhost IP 127.0.0.1 should not be possible
	Typing multicast IP 224.0.0.0/4 address should not be possible
	Typing any address in range 10.0.0.0/8 should not be possible
	Typing any address in range 172.16.0.0/12 should not be possible
	Typing any address in range 192.168.0.0/16 should not be possible
	Typing any address in range 100.64.0.0/10 should not be possible
	Typing any address in range 169.254.0.0/16 should not be possible
	Typing any address in range 192.88.99.0/24 should not be possible
	Typing any address in range 198.18.0.0/15 should not be possible
	Typing any address in range 203.0.113.0/24 should not be possible
	Typing any address in range 233.252.0.0/24 should not be possible
	Typing any address in range 240.0.0.0/4 should not be possible
	Typing address 255.255.255.255 should not be possible
	Typing a valid IP should be saved
	Test Teardown

HH6-6526
	open chromeBrowser
	MultiNAT mapping should not be editable when whilst is disabled
	After disabling and enabling the multinat rule works as expected
	close chromeBrowser


HH6-6531
	open chromeBrowser
	When enabling Public static IP address the device should got a random static address
	When enabling Use fixed IP address the device still have the public ip
	#When When enabling Use fixed IP address we are able to asseign a custom ip address	
	#IP address should be modified
	close chromeBrowser



*** keywords ****

Add Needed Image Path
    Add Image Path    ${CURDIR}//imgHH6


Test Setup        
	Open Browser                 http://192.168.1.254		chrome
	

Test Teardown     Close Browser

Enable Static IP and try to enter an ip address

	Wait Until Screen Contain	AdvSetting.png		20	
	Click	 	 		AdvSetting.png
	Click		 		staticIp.png
	SikuliLibrary.Input Text	passwordIputText.png			root
	Click				Oki.png
	CLick				OnStaticIp.png
	Click				blankRouterAddress.png
	${is_exist}			Exists				AreyousurePopup.png		1		
	Should be Equal			'${is_exist}'			'True'	
	
Typing defaut IP 0.0.0.0 should not be possible

	Click				yesButton.png
	Click				addressfield.png
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Click				disabledSetButton.png
	${is_exist}			Exists				popupSetAddress.png		1
	Should Be Equal			'${is_exist}'			'True'	
	Click				cancel.png						

Typing localhost IP 127.0.0.1 should not be possible

	Click				blankRouterAddress.png
	Exists				AreyousurePopup.png
	Click				yesButton.png
	Click				addressfield.png
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		127
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		1
	Click				disabledSetButton.png
	${is_exist}			Exists				popupSetAddress.png		1
	Should Be Equal			'${is_exist}'			'True'	
	Click				cancel.png			

Typing multicast IP 224.0.0.0/4 address should not be possible

	Click				blankRouterAddress.png
	Exists				AreyousurePopup.png
	Click				yesButton.png
	Click				addressfield.png
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		224
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		1
	Click				disabledSetButton.png
	${is_exist}			Exists				popupSetAddress.png		1
	Should Be Equal			'${is_exist}'			'True'	
	Click				cancel.png			

Typing any address in range 10.0.0.0/8 should not be possible


	Click				blankRouterAddress.png
	Exists				AreyousurePopup.png
	Click				yesButton.png
	Click				addressfield.png
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		10
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		1
	Click				disabledSetButton.png
	${is_exist}			Exists				popupSetAddress.png		1
	Should Be Equal			'${is_exist}'			'True'	
	Click				cancel.png			

Typing any address in range 172.16.0.0/12 should not be possible


	Click				blankRouterAddress.png
	Exists				AreyousurePopup.png
	Click				yesButton.png
	Click				addressfield.png
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		172
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		16
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		1
	Click				disabledSetButton.png
	${is_exist}			Exists				popupSetAddress.png		1
	Should Be Equal			'${is_exist}'			'True'	
	Click				cancel.png
			
Typing any address in range 192.168.0.0/16 should not be possible

	Click				blankRouterAddress.png
	Exists				AreyousurePopup.png
	Click				yesButton.png
	Click				addressfield.png
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		192
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		168
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		1
	Click				disabledSetButton.png
	${is_exist}			Exists				popupSetAddress.png		1
	Should Be Equal			'${is_exist}'			'True'
	Click				cancel.png				

Typing any address in range 100.64.0.0/10 should not be possible

	Click				blankRouterAddress.png
	Exists				AreyousurePopup.png
	Click				yesButton.png
	Click				addressfield.png
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		100
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		64
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		8
	Click				disabledSetButton.png
	${is_exist}			Exists				popupSetAddress.png		1
	Should Be Equal			'${is_exist}'			'True'	
	Click				cancel.png
			
Typing any address in range 169.254.0.0/16 should not be possible

	Click				blankRouterAddress.png
	Exists				AreyousurePopup.png
	Click				yesButton.png
	Click				addressfield.png
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		169
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		254
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		12
	Click				disabledSetButton.png
	${is_exist}			Exists				popupSetAddress.png		1
	Should Be Equal			'${is_exist}'			'True'	
	Click				cancel.png			


Typing any address in range 192.88.99.0/24 should not be possible
	
	Click				blankRouterAddress.png
	Exists				AreyousurePopup.png
	Click				yesButton.png
	Click				addressfield.png
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		192
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		88
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		99
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		100
	Click				disabledSetButton.png
	${is_exist}			Exists				popupSetAddress.png		1
	Should Be Equal			'${is_exist}'			'True'	
	Click				cancel.png			

Typing any address in range 198.18.0.0/15 should not be possible

	Click				blankRouterAddress.png
	Exists				AreyousurePopup.png
	Click				yesButton.png
	Click				addressfield.png
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		198
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		18
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		10
	Click				disabledSetButton.png
	${is_exist}			Exists				popupSetAddress.png		1
	Should Be Equal			'${is_exist}'			'True'
	Click				cancel.png				


Typing any address in range 203.0.113.0/24 should not be possible

	Click				blankRouterAddress.png
	Exists				AreyousurePopup.png
	Click				yesButton.png
	Click				addressfield.png
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		203
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		113
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		10
	Click				disabledSetButton.png
	${is_exist}			Exists				popupSetAddress.png		1
	Should Be Equal			'${is_exist}'			'True'	
	Click				cancel.png			

Typing any address in range 233.252.0.0/24 should not be possible


	Click				blankRouterAddress.png
	Exists				AreyousurePopup.png
	Click				yesButton.png
	Click				addressfield.png
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		233
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		252
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		10
	Click				disabledSetButton.png
	${is_exist}			Exists				popupSetAddress.png		1
	Should Be Equal			'${is_exist}'			'True'	
	Click				cancel.png			

Typing any address in range 240.0.0.0/4 should not be possible

	Click				blankRouterAddress.png
	Exists				AreyousurePopup.png
	Click				yesButton.png
	Click				addressfield.png
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		240
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		0
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		10
	Click				disabledSetButton.png
	${is_exist}			Exists				popupSetAddress.png		1
	Should Be Equal			'${is_exist}'			'True'	
	Click				cancel.png			

Typing address 255.255.255.255 should not be possible

	Click				blankRouterAddress.png
	Exists				AreyousurePopup.png
	Click				yesButton.png
	Click				addressfield.png
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		255
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		255
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		255
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		255
	Click				disabledSetButton.png
	${is_exist}			Exists				popupSetAddress.png		1
	Should Be Equal			'${is_exist}'			'True'	
	Click				cancel.png			

Typing a valid IP should be saved
	Click				blankRouterAddress.png
	Exists				AreyousurePopup.png
	Click				yesButton.png
	Click				addressfield.png
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		217
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		35
	Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		118
	#Press Special Key		TAB
	SikuliLibrary.Paste Text	blankImgCurs.png		1			
	Click				enableSetButton.png
	Set Ocr Text Read		true
	${Text}				SikuliLibrary.Get Text				routeraddress.png
	${string} 			Decode Bytes To String				${Text}					UTF-8	
	Should Contain			${string}					${VALID_IP_ADDRESS}
	
	

############################### HH6-6526:  This test works when the BT is in reset mode ##########################

open chromeBrowser
	 Open Browser                 http://192.168.1.254/00000177_B/gui/#/staticIP/configuration		chrome		
close chromeBrowser
	Close Browser
	

MultiNAT mapping should not be editable when whilst is disabled

	Wait Until Screen Contain	passwordPopup.png			20
	SikuliLibrary.Input Text	passwordIputText.png			root
	Click				Oki.png
	Click				multinat.png
	Set Ocr Text Read		true
	${Text}				SikuliLibrary.Get Text				verfitext.png
	${string} 			Decode Bytes To String				${Text}					UTF-8	
	Should be equal 		${string}					${MESSAGE_IPSTATIC_DISABLE}	
	
After disabling and enabling the multinat rule works as expected

	Click				IPStatic_conf.png
	Click				OnStaticIp.png			
	Typing a valid IP should be saved
	Click				subnetmask.png
	Click				maskAddress.png
	Click				enableSetButton.png
	Click				savedmz.png
	${release}			Run Process				${RELEASE_ADDRESS}				shell=True
	${addressDhcp}			Run Process				${DHCP_ADDRESS}					shell=True
	Click				multinat.png
	Click				selectdevice.png
	Click				sst-BT-Test.png
	Click				enableSetButton.png
	Click				selectaddress.png
	Click				addressdevice.png
	Click				enableSetButton.png
	Click				addButton.png
	Click				savedmz.png
	Wait Until Screen Contain	saveOki.png			20
	${is_exist}			Exists				deviceAddressscreen.png		2	
	Should Be Equal			'${is_exist}'			'True'
	Click				IPStatic_conf.png
	Click In			enbaleStaticIp.png		activeSaticIp.png
	CLick				OnStaticIp.png
	Click				multinat.png
	${is_exist}			Exists				deviceAddressscreen.png		2
	Should Be Equal			'${is_exist}'			'True'
	

		

############################### HH6-6531: This test use Public (static) IP ON ###################################


When enabling Public static IP address the device should got a random static address

	Wait Until Screen Contain	passwordPopup.png			20
	SikuliLibrary.Input Text	passwordIputText.png			root
	Click				Oki.png
	Click				advanceSetting.png
	${release}			Run Process				${RELEASE_ADDRESS}				shell=True
	${addressDhcp}			Run Process				${DHCP_ADDRESS}					shell=True
	${rc}				${deviceAddr}=				Run and Return RC and Output		      	${DEVICE_ADDRESS}		
	Should Match Regexp		${deviceAddr}				\\d.\\d.\\d.\\d

When enabling Use fixed IP address the device still have the public ip

	Click				advanceSetting.png
	Click				myNetwork.png
	Wait Until Screen Contain	sst-BT-Test-Region.png			10
	Click				sst-BT-Test-Region.png				
	Click In 			fixedipaddress.png			diableaccess.png
	Click				savedmz.png
	${release}			Run Process				${RELEASE_ADDRESS}				shell=True
	${addressDhcp}			Run Process				${DHCP_ADDRESS}					shell=True
	${rc}				${deviceAddr}=				Run and Return RC and Output		      ${DEVICE_ADDRESS}	
	Run Process		        ${SOURCE_ADDRESS}			shell=True
	${FILE_CONTENT}=   		Get File    				curl.txt
	#Log To Console			${FILE_CONTENT}
	Should Match Regexp		${deviceAddr}				\\d.\\d.\\d.\\d
	Should Match Regexp		${FILE_CONTENT}				\\d.\\d.\\d.\\d
	Should Contain			${deviceAddr}				217.35.118
	Should Be True			'${FILE_CONTENT}' == '${deviceAddr}'
	#Click In 			fixedIPAddressEnabled.png		yes.png
	#Click				savedmz.png
	#Wait Until Screen Contain	saveOki.png				20


init suite
	Import Variables      ${CURDIR}${/}..${/}CONF${/}BTHome${/}BT-HH6-BT-IP-Static_IP.py

