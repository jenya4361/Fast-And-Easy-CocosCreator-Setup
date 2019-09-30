@echo off 

SET VAR1="false"

echo #### Start Setup #### 

echo #### check folders #### 

IF not exist ThirdParty ( 
	mkdir ThirdParty && echo ThirdParty created
)
IF not exist CocosCreator ( 
	mkdir CocosCreator && echo CocosCreator created
)

echo #### download NDK #### 
if not exist ThirdParty\ndk_archive.zip (
	powershell -Command "Invoke-WebRequest https://dl.google.com/android/repository/android-ndk-r20-windows-x86_64.zip -OutFile ThirdParty\ndk_archive.zip"
	powershell Expand-Archive ThirdParty\ndk_archive.zip -DestinationPath ThirdParty\	
)

echo #### NDK downloaded ####

echo #### download SDK ####
if not exist ThirdParty\sdk_archive.zip (
	powershell -Command "Invoke-WebRequest https://dl.google.com/android/repository/sdk-tools-windows-4333796.zip -OutFile ThirdParty\sdk_archive.zip"
	powershell Expand-Archive ThirdParty\sdk_archive.zip -DestinationPath ThirdParty\
)
echo #### SDK downloaded ####

echo #### download CocosCreator ####
if not exist CocosCreator\cocos_creator_archive.7z (
	powershell -Command "Invoke-WebRequest https://cocos2d-x.org/filedown/start/442 -OutFile CocosCreator\cocos_creator_archive.7z"
	powershell Expand-Archive CocosCreator\cocos_creator_archive.7z -DestinationPath CocosCreator\
)
echo #### CocosCreator downloaded ####

pause