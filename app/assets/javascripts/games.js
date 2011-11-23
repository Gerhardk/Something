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

            var x = $(this).attr("data_x");
            var y = $(this).attr("data_y");
            var position = $(this).position();
            var ship_id = ui.draggable.attr("ship_id");
            var orientation = ui.draggable.attr("orientation");
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
                  $("#lightbox_content_small").html('<img src="app/assets/images/ajax-loader.gif"/>');
                  $("#lightbox_small").show();
                },
                complete: function() {
                  document.body.style.cursor = 'auto';
                  $("#lightbox_content_small").html('');
                  $("#lightbox_small").hide();
                },
                url: '/game_ships/'
            });


        }

    })
}