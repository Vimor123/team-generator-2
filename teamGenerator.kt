fun main() {
    print("Names (delimiter : \",\") : ")
    val players = ArrayList(readln().split(','))
    print("Number of teams : ")
    val no_of_teams = readln().toInt()

    if (no_of_teams <= 0 || no_of_teams > players.size) {
        println("\nInvalid number of teams")
        return
    }

    for (i in 0 .. players.size - 1) {
        players[i] = players[i].trim()
    }

    players.shuffle()

    val no_of_players_per_team = players.size / no_of_teams
    val no_of_remaining_players = players.size % no_of_teams

    var team_index = 0
    var player_in_team_index = 0

    for (player in players) {
        if (player_in_team_index == 0) {
            println("\nTeam ${team_index + 1}")
            println("====================")
        }
        println(player)
        player_in_team_index++
        if (player_in_team_index >= no_of_players_per_team) {
            if (team_index >= no_of_remaining_players) {
                player_in_team_index = 0
                team_index++
            } else if(player_in_team_index >= no_of_players_per_team + 1) {
                player_in_team_index = 0
                team_index++
            }
        }
    }
}