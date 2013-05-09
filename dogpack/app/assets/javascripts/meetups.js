var places = [];
    
var othersEvents = {
    events: gon.recipient_meetups,
    color: 'red',
    textColor: 'white'
    
};

var yourEvents =  {
    events: gon.my_meetups,
    color: 'red',
    textColor: 'white'
};

$(document).ready(function() {
		console.log(yourEvents)
    //Set up calendar
    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        defaultView: 'agendaWeek', 
        editable: true,
        dayClick: function(date, allDay, jsEvent, view) {
            $('#calendar').fullCalendar('refetchEvents');
            $('#calendar').fullCalendar('renderEvent', {
                title: 'Meetup w/ ' + gon.recipient.name,
                start: date,
                end: new Date(date.getTime()+(1000*60*60)),
                allDay: false,
                color: 'green',
                textColor: 'white'
            }, false);
            $('#inputMeetupTime').val(date.toLocaleString());
            $('#hiddenTime').val(date.toLocaleString());	

        },
        eventSources: [yourEvents, othersEvents],
        height: 500
    });
    
    //Typeahead for location input
    $("#inputLocation").typeahead({source: places, updater: function(item) {
        this.$element[0].value = item;
        return item;
    }})
    $('.alert').hide();
    
    $('#sendBtn').click(function(e){
        console.log('Send button clicked');
        if($("#inputLocation").val().length == 0 || $("#inputMeetupTime").val().length == 0 || $("#textAreaMessage").val().length == 0){
            $('.alert').show();
            e.preventDefault();
        }
    });
    
    //Calendar for mobile
    $('#calendar-phone').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        defaultView: 'agendaWeek', 
        editable: true,
        dayClick: function(date, allDay, jsEvent, view) {
            $('#calendar-phone').fullCalendar('refetchEvents');
            $('#calendar-phone').fullCalendar('renderEvent', {
                title: 'Meetup w/ Name',
                start: date,
                end: new Date(date.getTime()+(1000*60*60)),
                allDay: false,
                color: 'green',
                textColor: 'white'
            }, false);
            $('#inputMeetupTime-phone').val(date.toUTCString());
            $('#hiddenTime').val(date.toLocaleString());	

        },
        eventSources: [yourEvents, othersEvents],
        height: 500
    });
    
    //Typeahead for location input
    $("#inputLocation-phone").typeahead({source: places, updater: function(item) {
        this.$element[0].value = item;
        return item;
    }})
    
    $('.alert').hide();
    $('#sendBtn-phone').click(function(e){
        console.log('Send button clicked');
        if($("#inputLocation-phone").val().length == 0 || $("#inputMeetupTime-phone").val().length == 0 || $("#textAreaMessage-phone").val().length == 0){
            $('.alert').show();
            e.preventDefault();
        }
    });            
    
});
