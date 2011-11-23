function draw_ships_for_game(){
  var game_ship_ids_array = document.getElementById("game_ship_ids").innerHTML.replace(' ', '').split(',');
  var x_array = document.getElementById("game_ship_x").innerHTML.replace(' ', '').split(',');
  var y_array = document.getElementById("game_ship_y").innerHTML.replace(' ', '').split(',');
  var game_ships_lengths_array = document.getElementById("game_ship_length").innerHTML.replace(' ', '').split(',');
  var orientation_array = document.getElementById("game_ship_orientation").innerHTML.replace(' ', '').split(',');
  for (k = 0; k < game_ship_ids_array.length; k++ ){


    var trimmed_x = x_array[k].replace(/^\s+|\s+$/g, '') ;
    var trimmed_y = y_array[k].replace(/^\s+|\s+$/g, '') ;
    var trimmed_orientation = orientation_array[k].replace(/^\s+|\s+$/g, '') ;

    var ship_object = document.getElementById("player_board_" + trimmed_x + "_" + trimmed_y)

    if (ship_object != null){

        document.getElementById("player_board_" + trimmed_x + "_" + trimmed_y).style.backgroundColor = "#6D6969"

        for(i = 0; i < (game_ships_lengths_array[k] - 1) ; i++){

            if (game_ships_lengths_array[k] > 1){
                if (trimmed_orientation == "horizontal"){
                    trimmed_x = parseFloat(trimmed_x)
                    trimmed_x = parseInt(trimmed_x + 1);


                    document.getElementById("player_board_" + trimmed_x + "_" + trimmed_y).style.backgroundColor = "#6D6969"
                }else if (trimmed_orientation == "vertical") {
                    trimmed_y = parseFloat(trimmed_y)
                    trimmed_y = parseInt(trimmed_y + 1);

                    document.getElementById("player_board_" + trimmed_x + "_" + trimmed_y).style.backgroundColor = "#6D6969"

                }
            }

        }

    }



  }
}