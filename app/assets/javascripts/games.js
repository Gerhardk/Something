function ShipsDraggables() {
    $(".ships").draggable({
        cursor: 'move'

    });
}

function ShipsDroppables() {
    $(".player_placement").droppable({

        activeClass: 'active',
        hoverClass: "hover",
        accept: ".ships",
        drop: function(event, ui) {
            var data_for = {}
            var max_per_game = parseInt(ui.draggable.attr("max_per_game"))
            var data_length = ui.draggable.attr("data_length")
            var total_ships_game = parseInt(ui.draggable.attr("total_ships_game"))
            var x = $(this).attr("data_x");
            var y = $(this).attr("data_y");
            var orientation = ui.draggable.attr("orientation");
            if (data_length == 5 && orientation== "horizontal"){
                if (x != 0 || x != 1){

                  x = x - 2
                }

            } else if((data_length == 4 || data_length == 3 || data_length == 2)  && orientation== "horizontal") {
                if (x != 0 ){

                  x = x - 1
                }
            } else if((data_length == 5 || data_length == 4 ) && orientation== "vertical"){
                if (y != 0 || y != 1){

                  y = y - 2
                }

            }else if(( data_length == 3 || data_length == 2)  && orientation== "vertical"){

                if (y != 0 ){

                  y = y - 1
                }
            }


            var ship_id = ui.draggable.attr("ship_id");

            var game_id = ui.draggable.attr("game_id");
            data_for= {
                game_ship: {
                    ship_id: ship_id,
                    sunk: false,
                    hit_count: 0,
                    x: x,
                    y: y,
                    orientation: orientation,
                    game_id: game_id
                }
            }


            $.ajax({
                dataType: "script",
                type: "Post",
                data: data_for,
                beforeSend: function() {
                  document.body.style.cursor = 'wait';

                },
                complete: function() {
                  document.body.style.cursor = 'auto';

                  draw_ships_for_game();

                },
                url: '/game_ships/'
            });


        }

    })
}