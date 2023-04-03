use List::Util qw/shuffle/;

print 'Names (delimiter : ",") : ';
$all_players_string = <STDIN>;
print 'Number of teams : ';
$no_of_teams = <STDIN>;

@players = split ',', $all_players_string;

if ($no_of_teams <= 0 || $no_of_teams > @players) {
    print("\nInvalid number of teams");
    exit 1;
}

sub trim {
    my $string = @_[0];
    $string =~ s/^\s*(.*[^\s])\s*$/\1/;
    $string;
}

foreach $player (@players) {
    $player = &trim($player);
}

@players = shuffle @players;
@players = shuffle @players;
@players = shuffle @players;

$no_of_players_per_team = @players / $no_of_teams;
$no_of_remaining_players = @players % $no_of_teams;

$team_index = 0;
$player_in_team_index = 0;

foreach $player (@players) {
    if ($player_in_team_index == 0) {
        printf "\nTeam %d\n", $team_index + 1;
        print "====================\n";
    }
    print "$player\n";
    $player_in_team_index++;
    if ($player_in_team_index > $no_of_players_per_team - 1) {
        if ($team_index >= $no_of_remaining_players) {
            $player_in_team_index = 0;
            $team_index++;
        } elsif ($player_in_team_index > $no_of_players_per_team) {
            $player_in_team_index = 0;
            $team_index++;
        }
    }
}