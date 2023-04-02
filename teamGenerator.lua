-- Team Generator --

io.write("Names (delimiter : \",\") : ")
local all_players_string = io.read()
io.write("Number of teams : ")
local no_of_teams = io.read("*n")

local players = {}
local no_of_players = 0
for name in string.gmatch(all_players_string, "([^,]+)") do
    local trimmed_name = name:match("^%s*(.*)%s*$")
    table.insert(players, trimmed_name)
    no_of_players = no_of_players + 1
end

if no_of_teams <= 0 or no_of_teams > no_of_players then
    print("\nInvalid number of teams")
    os.exit()
end

local sorted_players = {}

math.randomseed(os.time())
local no_of_unsorted_players = no_of_players

while (no_of_unsorted_players > 0) do
    local random_index = math.random(no_of_unsorted_players)
    local chosen_player = players[random_index]
    table.insert(sorted_players, chosen_player)
    table.remove(players, random_index)
    no_of_unsorted_players = no_of_unsorted_players - 1
end

local no_of_players_per_team = math.floor(no_of_players / no_of_teams)
local no_of_remaining_players = no_of_players % no_of_teams

local team_index = 1
local player_in_team_index = 1
for _, name in ipairs(sorted_players) do
    if player_in_team_index == 1 then
        print(string.format("\nTeam %d", team_index))
        print("====================")
    end
    print(name)
    player_in_team_index = player_in_team_index + 1
    if player_in_team_index > no_of_players_per_team then
        if team_index > no_of_remaining_players then
            player_in_team_index = 1
            team_index = team_index + 1
        elseif player_in_team_index > no_of_players_per_team + 1 then
            player_in_team_index = 1
            team_index = team_index + 1
        end
    end
end