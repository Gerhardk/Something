function draw_nukes_for_game(){
    var server_nuke_ids_array = document.getElementById("server_nuke_ids").innerHTML.replace(' ', '').split(',');
    var x_array = document.getElementById("server_x").innerHTML.replace(' ', '').split(',');
    var y_array = document.getElementById("server_y").innerHTML.replace(' ', '').split(',');
    var server_hit_miss =  document.getElementById("server_hit_miss").innerHTML.replace(' ', '').split(',');
    ///// Server Nukes
    for (k = 0; k < server_nuke_ids_array.length; k++ ){
        var trimmed_x = x_array[k].replace(/^\s+|\s+$/g, '') ;
        var trimmed_y = y_array[k].replace(/^\s+|\s+$/g, '') ;
        var trimmed_hit_miss = server_hit_miss[k].replace(/^\s+|\s+$/g, '') ;
        var ship_object = document.getElementById("player_board_" + trimmed_x + "_" + trimmed_y)
        if (ship_object != null){
            if (trimmed_hit_miss== "hit"){
                document.getElementById("player_board_" + trimmed_x + "_" + trimmed_y).style.backgroundColor = "#f61313"
            } else{
                document.getElementById("player_board_" + trimmed_x + "_" + trimmed_y).style.backgroundColor = "#2bbf40"
            }
        }

    }

    ///// Player Nukes
    var nuke_ids_array = document.getElementById("nuke_ids").innerHTML.replace(' ', '').split(',');
    var nuke_x_array = document.getElementById("nuke_x").innerHTML.replace(' ', '').split(',');
    var nuke_y_array = document.getElementById("nuke_y").innerHTML.replace(' ', '').split(',');
    var nuke_hit_miss =  document.getElementById("nuke_hit_miss").innerHTML.replace(' ', '').split(',');

    for (i = 0; i < nuke_ids_array.length; i++ ){
      var trimmed_x = nuke_x_array[i].replace(/^\s+|\s+$/g, '') ;
      var trimmed_y = nuke_y_array[i].replace(/^\s+|\s+$/g, '') ;
      var trimmed_hit_miss = nuke_hit_miss[i].replace(/^\s+|\s+$/g, '') ;
      var ship_object = document.getElementById("enemy_board_" + trimmed_x + "_" + trimmed_y)
      if (ship_object != null){
        if (trimmed_hit_miss== "hit"){
          document.getElementById("enemy_board_" + trimmed_x + "_" + trimmed_y).style.backgroundColor = "#f61313"
        } else{
          document.getElementById("enemy_board_" + trimmed_x + "_" + trimmed_y).style.backgroundColor = "#2bbf40"
        }
      }
    }
}