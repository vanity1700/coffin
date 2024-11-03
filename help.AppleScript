property botprefix : ";"
property color : "blue"

on helpCommand(commandName)
    if commandName is not "" then
        displayCommandInfo(commandName)
    else
        displayHelpMenu()
    end if
end helpCommand

on displayCommandInfo(commandName)
    set commandInfo to my getCommand(commandName)

    if commandInfo is not missing value then
        set commandTitle to "Command: " & commandName
        set commandDescription to "Description: " & commandInfo's description
        set commandSubcommands to if commandInfo's sub is not missing value then "Subcommands: " & commandInfo's sub as string else "Subcommands: None"
        set commandAliases to if commandInfo's aliases is not missing value then "Aliases: " & commandInfo's aliases as string else "Aliases: N/A"

        display dialog commandTitle & return & commandDescription & return & commandSubcommands & return & commandAliases buttons {"OK"} default button "OK"
    else
        display dialog "This command does not exist, use '" & botprefix & "help' for the list of commands." buttons {"OK"} default button "OK"
    end if
end displayCommandInfo

on displayHelpMenu()
    set helpText to "For regular commands do '" & botprefix & "help [cmd]'" & return & return & "Total commands: 10"
    set categories to {¬
        {"__**Server**__", "prefix, reset, autoreaction, starboard, goodbye, guildedit, autoresponder, fakepermissions"}, ¬
        {"__**Information**__", "help, avatar, banner, boosters, botinfo, bots, firstmessage, invites, membercount, oldest, ping, roleinfo, roles, serverbanner, servericon, serverinfo, uptime, userinfo, vanityuses"}, ¬
        {"__**Moderation**__", "ban, cleanup, hide, kick, lock, nuke, striproles, timeout, untimeout"}, ¬
        {"__**Utility**__", "anime, appstore, cashapp, chatgpt, fortnite, github, google, instagram, twitter, urban, youtube"}, ¬
        {"__**Economy**__", "autofarm, balance, daily, gamble, work, blankcard, withdraw, taxes, rob, give, deposit"}, ¬
        {"__**Lastfm**__", "lastfm, fm, globalwhoknows, recommend"} ¬
    }

    repeat with category in categories
        set helpText to helpText & return & item 1 of category & return & item 2 of category
    end repeat

    display dialog helpText buttons {"OK"} default button "OK"
end displayHelpMenu

on getCommand(commandName)
    if commandName is "help" then
        return {description:"Shows help embed", sub:missing value, aliases:{"h", "commands"}}
    else if commandName is "ping" then
        return {description:"Checks bot latency", sub:missing value, aliases:{}}
    else
        return missing value 
    end if
end getCommand

helpCommand("")
