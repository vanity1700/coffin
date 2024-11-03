tell application "Discord"
    activate
end tell

delay 1 

on sendMessage(content)
    tell application "System Events"
        keystroke content
        delay 0.1
        keystroke return 
    end tell
end sendMessage

on paginate(embeds)
    set pageIndex to 1
    set totalPages to count of embeds

    repeat
        set currentEmbed to item pageIndex of embeds
        sendMessage(currentEmbed) 

        set userInput to display dialog "Current Page: " & pageIndex & " / " & totalPages & return & "Type 'next', 'prev', or 'skip [number]'" default answer ""
        set userResponse to text returned of userInput

        if userResponse is "next" then
            if pageIndex < totalPages then
                set pageIndex to pageIndex + 1
            else
                set pageIndex to 1 
            end if
        else if userResponse is "prev" then
            if pageIndex > 1 then
                set pageIndex to pageIndex - 1
            else
                set pageIndex to totalPages 
            end if
        else if userResponse starts with "skip" then
            set skipPage to last word of userResponse
            if skipPage is not "" and skipPage is not missing value then
                set skipPage to (skipPage as integer)
                if skipPage ≥ 1 and skipPage ≤ totalPages then
                    set pageIndex to skipPage
                else
                    display dialog "Invalid page number. Please enter a number between 1 and " & totalPages
                end if
            end if
        else
            exit repeat
        end if
    end repeat
end paginate

set exampleEmbeds to {"Page 1 Content", "Page 2 Content", "Page 3 Content", "Page 4 Content"}
paginate(exampleEmbeds)
