

; This example creates a browser window, navigates to a webpage and
; downloads all images to a local folder using the source image name.

#include <IE.au3>
Opt("TrayIconHide", 1)
$sImgDir = "c:\foo\"
DirCreate($sImgDir)

$sWebPage = "http://www.google.com"; webpage with images

$oIE = _IECreate()
_IENavigate($oIE, $sWebPage)
$oIMGs = _IETagNameGetCollection($oIE, "img")

; Loop through all IMG tags and save file to local directory using INetGet
For $oIMG in $oIMGs
    $sImgUrl = $oIMG.src
    $sImgFileName = $oIMG.nameProp
    INetGet($sImgUrl,  $sImgDir & $sImgFileName)
Next

ShellExecute($sImgDir)