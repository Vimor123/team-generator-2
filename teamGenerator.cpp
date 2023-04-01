#include <iostream>
#include <string>
#include <bits/stdc++.h>
#include <time.h>

using namespace std;

int main()
{
    string all_players_string;
    cout << "Names (delimiter : \",\") : ";
    getline(cin, all_players_string);
    
    int no_of_teams;
    cout << "Number of teams : ";
    cin >> no_of_teams;
    
    int no_of_players = 1;
    for (char &c : all_players_string) {
        if (c == ',') no_of_players++;
    }
    
    if (no_of_teams <= 0 || no_of_teams > no_of_players) {
        cout << endl << "Invalid number of teams" << endl;
        return 1;
    }
    
    string all_players[no_of_players];
    int current_player_index = 0;
    bool name_started = false;
    for (char &c : all_players_string) {
        if (c == ',') {
            current_player_index++;
            name_started = false;
        } else {
            if (!name_started && c != ' ') {
                name_started = true;
            }
            if (name_started) {
                all_players[current_player_index] += c;
            }
        }
    }
    
    unsigned seed = time(NULL);
    
    shuffle(all_players, all_players + no_of_players, default_random_engine(seed));
    
    int no_of_players_per_team = no_of_players / no_of_teams;
    int no_of_remaining_players = no_of_players % no_of_teams;
    
    int team_index = 0;
    int player_in_team_index = 0;
    
    for (int i = 0; i < no_of_players; i++) {
        if (player_in_team_index == 0) {
            cout << endl;
            cout << "Team " << team_index + 1 << endl;
            cout << "====================" << endl;
        }
        cout << all_players[i] << endl;
        player_in_team_index++;
        if (player_in_team_index >= no_of_players_per_team) {
            if (team_index >= no_of_remaining_players) {
                player_in_team_index = 0;
                team_index++;
            } else if (player_in_team_index > no_of_players_per_team) {
                player_in_team_index = 0;
                team_index++;
            }
        }
    }

    return 0;
}