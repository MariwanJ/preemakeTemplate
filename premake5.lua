--[[
        Creating Make file or visual studio project automatically
        Author 
        # ***************************************************************************
        # *                                                                         *
        # *  Creating Make file or visual studio project automatically              *
        # *                                                                         *
        # *  Copyright (C) 2021                                                     *
        # *                                                                         *
        # *  This library is free software; you can redistribute it and/or          *
        # *  modify it under the terms of the GNU Lesser General Public             *
        # *  License as published by the Free Software Foundation; either           *
        # *  version 2 of the License, or (at your option) any later version.       *
        # *                                                                         *
        # *  This library is distributed in the hope that it will be useful,        *
        # *  but WITHOUT ANY WARRANTY; without even the implied warranty of         *
        # *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU      *
        # *  Lesser General Public License for more details.                        *
        # *                                                                         *
        # *  You should have received a copy of the GNU Lesser General Public       *
        # *  License along with this library; if not, If not, see                   *
        # *  <http://www.gnu.org/licenses/>.                                        *
        # *                                                                         *
        # *  Author : Mariwan Jalal   mariwan.jalal@gmail.com                       *
        # ***************************************************************************
        
--]]

workspace "yourProjectName"
       architecture "x86"
       configurations 
       { 
            "Debug",
            "Release" 
       }
	   platforms { "Win32"} 
		
 outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
 
 project "yourProjectName"
       location "yourProjectName"
       kind "WindowedApp"
       language "C++"
  
       targetdir ("bin/"..outputdir.."/%{prj.name}")
       objdir ("bin-int/"..outputdir.."/%{prj.name}")

       files{
            "%{prj.name}/src/**.h",
            "%{prj.name}/src/**.cpp",
			"%{prj.name}/src/**.rc",
       }
      includedirs
      {
        "$(SolutionDir)/yourProjectName/src/",
		"$(SolutionDir)vender/fltk/",
		"$(SolutionDir)vender/fltk/"
      }
      filter "configurations:Debug"
        links{ 
            "fltk_imagesd.lib",
            "fltkd.lib",
            "fltk_jpegd.lib",
            "fltk_pngd.lib",
            "fltk_zd.lib",
            "gdiplus.lib",
            "comctl32.lib",
            "ws2_32.lib",
            "kernel32.lib",
            "user32.lib",
            "gdi32.lib",
            "winspool.lib",
            "shell32.lib",
            "ole32.lib",
            "oleaut32.lib",
            "uuid.lib",
            "comdlg32.lib",
            "advapi32.lib",
			 }
	
    filter "configurations:Release"
        links{
          
            "fltk_images.lib",
            "fltk.lib",
            "fltk_jpeg.lib",
            "fltk_png.lib",
            "fltk_z.lib",
            "gdiplus.lib",
            "comctl32.lib",
            "ws2_32.lib",
            "kernel32.lib",
            "user32.lib",
            "gdi32.lib",
            "winspool.lib",
            "shell32.lib",
            "ole32.lib",
            "oleaut32.lib",
            "uuid.lib",
            "comdlg32.lib",
            "advapi32.lib",
			 }
     filter "configurations:Debug"         
	  libdirs { "$(SolutionDir)vender/fltk/lib/Debug"}
	 filter "configurations:Release"
     libdirs { "$(SolutionDir)vender/fltk/lib/Release"}
     filter {"system:windows", "action:vs*"}
     
      filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"
        defines
        {
            "PLATFORM_WINDOWS"
        }

      filter { "configurations:Debug" }
          defines { "DEBUG" ,"WIN32","_WINDOWS" }
		  buildoptions"/MDd"
          symbols "On"
		  

       filter { "configurations:Release" }
          defines { "NDEBUG","WIN32","_WINDOWS" }		  
          
		  buildoptions"/MD"
          optimize "On"

	filter { "platforms:Win32" }
		system "Windows"
		architecture "x32"
