----calculate the aspect ratio of the device:
----local aspectRatio = display.pixelHeight / display.pixelWidth
--local aspectRatio = display.contentHeight / display.contentWidth
----display.contentHeight display.contentWidth
--
--application = {
--   content = {
--      width = aspectRatio > 1.5 and 320 or math.ceil( 480 / aspectRatio ),
--      height = aspectRatio < 1.5 and 480 or math.ceil( 320 * aspectRatio ),
----        height = display.pixelHeight,
----        width = display.pixelWidth,
----      scale = "letterBox",
--        scale = "adaptive",
--      fps = 60,
--
--      imageSuffix = {
--         ["@2x"] = 1.5,
--         ["@4x"] = 3.0,
--      },
--   },
----   license = {
----      google = {
----         key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnZBeAxLp5wy67BRmTo6mJblo6aEFieMyCWXgK71E/LRgm6kE/U122VeCJdk9va0VopUrYOB8iPbRsQuBGiak/TpdnhhnSq//Sx2E4WpmrNk/Yw51c/e76FPA8B+Q8zvG6S9e8t7rQmR7gZnANM7BeN0kJ3kagAWbtXhk4l3us3LTJzeM7dq5Y5jrWPOYFHt8FGsK7IrjA6gj5ddFVMdbYhXAkWbrI9h4eCLhfLJZN4cAPxiR7mYz1lE+w0vkiXJuK2AJJ59yItjLxvs4fftbrw7oprj8kNjXTqg0F20eKoMLHxsxRwSyL7HNWtxW+RLfcYF/mi33exYGeo+lLyk+JQIDAQAB",
----         policy = "serverManaged", 
----      },
----   },
--}

--print("pixHeight: ")print(display.pixelHeight)
--print("pixWidth: ")print(display.pixelWidth)






----calculate the aspect ratio of the device
----local aspectRatio = display.pixelHeight / display.pixelWidth
--aspectRatio = display.pixelHeight / display.pixelWidth
--application = {
--    content = {
--        width = aspectRatio > 1.5 and 800 or math.floor( 1200 / aspectRatio
--        ),
--        height = aspectRatio < 1.5 and 1200 or math.floor( 800 *
--         aspectRatio ),
--        scale = "letterBox",
--        fps = 30,
--        
--        imageSuffix = {
--            ["@2x"] = 1.3,
--        },
--    },
--}





aspectRatio = display.pixelHeight / display.pixelWidth
application = 
{
	content = 
	{
--        width = 750,
--        height = 1334,
        width = 1080,
        height = 1920,
--		scale = "letterBox", -- letterBox // adaptive
        scale = "zoomStretch", -- letterBox // adaptive
		fps = 60,

		imageSuffix =
		{
--			["@2x"] = 1.0,
            ["@2x"] = 1.5,
			["@3x"] = 2.5,
		}
	}
}

