var placeToPosition = { harvardsquare:{lat:42.373442,lng:-71.11895}, beaconhill:{lat:42.361065,lng:-71.068926},
												portersquare:{lat:42.388857,lng:-71.119398}, kendallsquare:{lat:42.362874,lng:-71.090097},
												mit:{lat:42.358867,lng:-71.093825}, beaconhill:{lat:42.350265,lng:-71.080976},
												fenway:{lat:42.342865,lng:-71.100288}, centralsquare:{lat:42.365334,lng:-71.104466},
												backbay:{lat:42.350265,lng:-71.080976} }
												
var places = ["Harvard Square", "Porter Square", "Beacon Hill", "Kendall Square", "MIT", "Back Bay", "Fenway", "Central Square"];
var dogs = gon.dogs;
					
var mapWidgets = [];
var map;

function mapWidgetFor(dog){
	div = "<a href='/users/"+dog.id+"'><img class='span1' src='"+dog.image_url+"'></a>";
	div += "<div class='span2'><p><a href='/users/"+dog.id+"'><strong>"+ dog.name +"</strong></a>";
	div += "<br>"+ dog.breed +":</br>"+ dog.age +"</p></div>"
	return div;
}

function searchResultsInit(){
	var div;
	for(var i= 0; i < dogs.length; ++i){
		div = "<div class='row search-result img-polaroid'><div class='span6'><a href='/users/"+dogs[i].id+"'><img class='span3 img-polaroid' src='";
		div += dogs[i].image_url+"'></a></div><div class='span5'><p class='text-right lead'><a href='/users/"+dogs[i].id;
		div += "'><strong>"+dogs[i].name+"</strong></a></br>"+dogs[i].breed+"</br>"+dogs[i].age+"</p></div></div>";
		$("#listView").append(div);
	}
}

function search(){
	var key = $("#searchTextField").val().toLowerCase().replace(" ", "");
	var position = placeToPosition[key];
	if(position){
		var origin = new google.maps.LatLng(position.lat, position.lng);
		map.setOptions({'center': origin});
	}
}

var addMarkers = function(map){
	$.each(dogs, function(i){
		map.addMarker({
		'position' : dogs[i].latitude + "," + dogs[i].longitude
		}).click(function() {
			map.openInfoWindow({
			'content' : mapWidgetFor(dogs[i])
			}, this);
		})
	});				
}

	$(function() {
			//Initialzie html for markers
			for(i=0; i < dogs.length; ++i){
				mapWidgets.push(mapWidgetFor(dogs[i]));
			}
			
			searchResultsInit();
			
			//Initialize map widget
			$('#mapCanvas').gmap({
				'center' : '42.358448800000000000,-71.091220400000000000',
				'zoom' : 16,
				'callback' : function() {
					addMarkers(this);
				}
			});
			
			map = $('#mapCanvas').gmap('get','map');
			
			//Location button click event
			$("#locationButton").click(function(){
				var origin = new google.maps.LatLng('42.358448800000000000', '-71.091220400000000000');
				map.setOptions({'center':origin});
			});
			
			//Form submission event
			$("#mapForm").submit(function(){
				search();
				return false;
			});
			
			//Bind autocomplete to the textfield
			$("#searchTextField").typeahead({source: places, updater: function(item) {
    		this.$element[0].value = item;
    		search();
    		return item;
			}})       	
		}).load();