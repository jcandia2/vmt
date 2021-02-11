// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("packs/vehicles")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import 'bootstrap';
import './stylesheets/application.scss';


document.addEventListener("turbolinks:load", function () {
  function setVinValues() {
    $.ajax({
      url: "https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVINValuesBatch/",
      type: "POST",
      data: { format: "json", vin: $('#vehicle_vin').val() },
      success: function (result) {
        var resultJson = JSON.parse(result.type_options)["result"]
        console.log(resultJson)
        // if (resultJson) {
        //   $('#vehicle_year').val(resultJson[0]["modelyear"]);
        //   $('#vehicle_make').val(resultJson[0]["make"]);
        //   $('#vehicle_model').val(resultJson[0]["model"]);
        //   $('#vehicle_trim').val(resultJson[0]["body"]);
        // }
        // Set any standard vehicle information.
        // $('#vehicle_uid').replaceOptions(result.type_options);
      },
      error: function (xhr, ajaxOptions, thrownError) {
        // console.log(xhr.status);
        // console.log(thrownError);
      }
    });
  };
});
