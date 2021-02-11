function setVinValues() {
  $.ajax({
    url: "https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVINValuesBatch/",
    type: "POST",
    data: { format: "json", data: $('#vehicle_vin').val() },
    dataType: "json",
    success: function (result) {
      var vehicleData = result.Results
      if (vehicleData.length > 0) {
        $('#vehicle_year').val(vehicleData[0]["ModelYear"]);
        $('#vehicle_make').val(vehicleData[0]["Make"]);
        $('#vehicle_model').val(vehicleData[0]["Model"]);
        $('#no-data-found').html("");
      } else {
        $('#no-data-found').append('No data found for this Vin');
      }
    },
    error: function (xhr, ajaxOptions, thrownError) {
      console.log(xhr.status);
      console.log(thrownError);
    }
  });
};

$(document).on("turbolinks:load", () => {
  $('#vin-api-refresh').on("click", (e) => {
    e.stopPropagation();
    e.preventDefault();
    console.log('clicked');
    setVinValues();
  });
});

