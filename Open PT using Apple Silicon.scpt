#@osa-lang:AppleScript
its setUsingRosetta:false withAppName:"Pro Tools.app"

on setUsingRosetta:boolValue withAppName:appName
	tell application "Finder"
		set theInfo to open information window of application file appName of folder "Applications" of startup disk
	end tell
	-- Set using rosetta to true/false
	its openUsingRosetta(boolValue)
	-- Close information window
	tell theInfo to close
end setUsingRosetta:withAppName:

on openUsingRosetta(boolValue)
	tell application "System Events"
		tell application process "Finder"
			tell front window
				tell scroll area 1
					if value of checkbox 1 is not boolValue as integer then
						click checkbox 1
					end if
				end tell
			end tell
		end tell
	end tell
end openUsingRosetta

tell application "Pro Tools" to activate
