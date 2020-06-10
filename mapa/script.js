let map = L.map('mapid').on('load', onMapLoad).setView([41.489580, 2.356540], 14);
let tiles = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {}).addTo(map);
let markerGroup = L.markerClusterGroup();
let data_markers = [];

function onMapLoad() {
//FASE 3.1	
	console.log("Mapa cargado");	

// 1) Relleno el data_markers con una petición a la api	
	$.getJSON('http://localhost/mapa/api/apiRestaurants.php', function(data){
		let $type = [];	

		data.forEach(function(index) {
			data_markers.push(index);
// 2) Añado de forma dinámica en el select los posibles tipos de restaurantes	
			let $kindFood = (index.kind_food).split(",");
			$kindFood.forEach(function(value){	
				$type.push(value);		
			});			
		});

		let $uniqueType = [...new Set($type)].sort();
		$uniqueType.unshift('Todos');

		$uniqueType.forEach(function(value){				
			$('#kind_food_selector').append('<option>' + value+ '</option>');		
		});

// 3) Llamo a la función render_to_map para mostrar restaurantes en el mapa		
		render_to_map(data_markers, 'all');
	});		
}	

//en cada evento on change del elemento select con id kind_food_selector ejecuta la funcion render_to_map con el value escogido del select
$('#kind_food_selector').on('change', function() {	
	render_to_map(data_markers, this.value);
});

function render_to_map(data_markers, filter){	
//FASE 3.2	

//1) Limpio TODOS los marcadores del grupo con  clearLayers
	markerGroup.clearLayers();	

//2) bucle para decidir que marcadores cumplen el filtro y agregarlos al mapa 	
	let marker;
	if (filter === 'Todos') {
		for (let i = 0; i < data_markers.length; i++) {								
			marker = L.marker([data_markers[i].lat, data_markers[i].lng], data_markers[i].name);
			marker.addTo(markerGroup);
			marker.bindPopup('<p style="text-align:center; font-size:130%;"><b>' + data_markers[i].name + '</b></p> <p style="text-align:center;"><i>' + data_markers[i].kind_food + '</i></p>');
			markerGroup.addLayer(marker);			
		}			
	} else {
		for (let i = 0; i < data_markers.length; i++) {
			let type = data_markers[i].kind_food;
			if(type.includes(filter)){			
				marker = L.marker([data_markers[i].lat, data_markers[i].lng], data_markers[i].name);
				marker.addTo(markerGroup);
				marker.bindPopup('<p style="text-align:center; font-size:130%;"><b>' + data_markers[i].name + '</b></p>');
				markerGroup.addLayer(marker);
			}
		}
	  }		
	map.addLayer(markerGroup);			
} 
