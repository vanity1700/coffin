tell application "Discord"
    activate
end tell

delay 1


on sendMessage(command)
    tell application "System Events"
        keystroke command
        delay 0.1
        keystroke return 
    end tell
end sendMessage

sendMessage("?join") 
delay 1 
sendMessage("You need to be in a voice channel first!") 
delay 1
sendMessage("?help") 
sendMessage("Here are the commands you can use!") 
sendCooldown("skip 2sec")


sendMessage("?leave")
sendMessage("Left the voice channel!") 
