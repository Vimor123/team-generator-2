use std::io::{self, Write};
use rand::thread_rng;
use rand::seq::SliceRandom;

fn main() {
    
    let mut all_players_string = String::new();
    let mut no_of_teams_string = String::new();

    print!("Names (delimiter : \",\") : ");
    io::stdout().flush().expect("Couldn't flush :(");
    let stdin = io::stdin();
    stdin.read_line(&mut all_players_string).expect("Didn't receive input");
    all_players_string.pop();
    
    print!("Number of teams : ");
    io::stdout().flush().expect("Couldn't flush :(");
    stdin.read_line(&mut no_of_teams_string).expect("Didn't receive input");
    no_of_teams_string.pop();

    let no_of_teams: i32 = no_of_teams_string.trim().parse().expect("Not an integer >:(");

    let players_untrimmed: Vec<&str> = all_players_string.split(",").collect();
    let mut players: Vec<&str> = Vec::new();

    for player in players_untrimmed.iter() {
        players.push(player.trim());
    }

    players.shuffle(&mut thread_rng());

    let no_of_players_per_team: i32 = (players.len() as i32) / no_of_teams;
    let no_of_remaining_players: i32 = (players.len() as i32) % no_of_teams;

    let mut player_index: i32 = 0;
    let mut team_index: i32 = 0;

    for player in players.iter() {
        if player_index == 0 {
            println!("\nTeam {}", team_index + 1);
            println!("====================");
        }
        println!("{}", player);
        player_index += 1;
        if player_index >= no_of_players_per_team {
            if team_index >= no_of_remaining_players {
                player_index = 0;
                team_index += 1;
            } else if player_index >= no_of_players_per_team + 1 {
                player_index = 0;
                team_index += 1;
            }
        }
    }
}