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
            data_for= {
                game_ship: {
                    ship_id: ship_id,
                    sunk: false,
                    hit_count: 0,
                    x: x,
                    y: y,
                    orientation: orientation
                }
            }
            $.ajax({
                dataType: "script",
                type: "Post",
                data: data_for,
                url: '/game_ships/'
            });


        }

    })
}