let map
let Geocoder

function initMap(){
  geocoder = new google.maps.Geocoder()
  if(document.getElementById('map')){
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 35.6594666, lng: 139.7005536},
      zoom: 15,
    });
  }else{ 
    map = new google.maps.Map(document.getElementById('show_map'), {
      center: {lat: gon.lat, lng: gon.lng},
      zoom: 15,
    });

    marker = new google.maps.Marker({
      position:  {lat: gon.lat, lng: gon.lng},
      map: map
    });
  }
}

function codeAddress(){
  let inputAddress = document.getElementById('address').value;

  geocoder.geocode( {'address': inputAddress}, function(results, status) {
    if (status == 'OK') {
      let lat = results[0].geometry.location.lat();
      let lng = results[0].geometry.location.lng();
      let mark = {
          lat: lat,
          lng: lng
      };
      map.setCenter(results[0].geometry.location);
      let marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } else {
      alert('該当する結果がありませんでした');
    }
  });   
}
