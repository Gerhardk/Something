function ShipsDraggables() {
    $(".ships").draggable({
        cursor: 'move',
        stop: function() {
                    var position = $(this).position();
                    //alert(position.left.toFixed());
                    //alert(position.top.toFixed());
                    //$("#shaft_element_x").val(position.left.toFixed());
                    //$("#shaft_element_y").val(position.top.toFixed());
        }
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
            alert(x);
            alert(y);
            var ship_id = ui.draggable.attr("ship_id");
            data_for= {
                game_ship: {
                    ship_id: ship_id,
                    sunk: false,
                    hit_count: 0,
                    x: x,
                    y: y,
                    orientation: "vertical"
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