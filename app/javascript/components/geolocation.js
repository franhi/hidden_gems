
function showPosition(position) {
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
    var location = [];
    location.push(latitude, longitude);
    console.log(location);
    return location
}


window.onload = function() { navigator.geolocation.getCurrentPosition(showPosition) };





