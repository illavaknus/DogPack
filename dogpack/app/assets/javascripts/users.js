$(document).ready(function() {
    $("#notif").carouFredSel({
        width           : '100%',
        items           : 4,
        scroll          : 3,
        circular      : false,
        infinite      : false,
        auto            : false,
        responsive      : true,
        prev : {
            button    : "#notif_prev",
            key     : "left",
            items   : 3,
            duration  : 1000
        },
        next : {
            button    : "#notif_next",
            key     : "right",
            items   : 3,
            duration  : 1000
        }                 
    });
    $("#upcoming").carouFredSel({
        width           : '100%',
        items           : 4,
        scroll          : 3,
        circular      : false,
        infinite      : false,
        auto            : false,
        responsive      : true,
        prev : {
            button    : "#upcoming_prev",
            key     : "left",
            items   : 3,
            duration  : 1000
        },
        next : {
            button    : "#upcoming_next",
            key     : "right",
            items   : 3,
            duration  : 1000
        }                 
    });
    $("#previous").carouFredSel({
        width           : '100%',
        items           : 4,
        scroll          : 3,
        circular      : false,
        infinite      : false,
        auto            : false,
        responsive      : true,
        prev : {
            button    : "#previous_prev",
            key     : "left",
            items   : 3,
            duration  : 1000
        },
        next : {
            button    : "#previous_next",
            key     : "right",
            items   : 3,
            duration  : 1000
        }                 
    });
    $("#notif-small").carouFredSel({
        width           : '100%',
        items           : 2,
        scroll          : 2,
        circular      : false,
        infinite      : false,
        auto            : false,
        responsive      : true,
        prev : {
            button    : "#notif_prev-small",
            key     : "left",
            items   : 2,
            duration  : 1000
        },
        next : {
            button    : "#notif_next-small",
            key     : "right",
            items   : 2,
            duration  : 1000
        }                 
    });
    $("#upcoming-small").carouFredSel({
        width           : '100%',
        items           : 2,
        scroll          : 2,
        circular      : false,
        infinite      : false,
        auto            : false,
        responsive      : true,
        prev : {
            button    : "#upcoming_prev-small",
            key     : "left",
            items   : 2,
            duration  : 1000
        },
        next : {
            button    : "#upcoming_next-small",
            key     : "right",
            items   : 2,
            duration  : 1000
        }                 
    });
    $("#previous-small").carouFredSel({
        width           : '100%',
        items           : 2,
        scroll          : 2,
        circular      : false,
        infinite      : false,
        auto            : false,
        responsive      : true,
        prev : {
            button    : "#previous_prev-small",
            key     : "left",
            items   : 2,
            duration  : 1000
        },
        next : {
            button    : "#previous_next-small",
            key     : "right",
            items   : 2,
            duration  : 1000
        }                 
    });
});