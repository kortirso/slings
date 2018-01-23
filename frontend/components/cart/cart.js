import "./cart.css";

const $ = require("jquery");

$("#delivery_form").on("change", function() {
  if (this.value === "Самовывоз") $(".delivery_data").hide();
  else $(".delivery_data").show();
});
