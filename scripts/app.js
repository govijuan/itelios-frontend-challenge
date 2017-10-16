(function() {
  var dataArray, dataXhttp, init, loadJSON;

  dataXhttp = null;

  dataArray = new Object;

  loadJSON = function(callback) {
    if (window.XMLHttpRequest) {
      dataXhttp = new XMLHttpRequest();
    } else {
      dataXhttp = ActiveXObject("Micosoft.XMLHTTP");
    }
    dataXhttp.onreadystatechange = function() {
      var recommItemsListObj, seenItemObj;
      if (dataXhttp.readyState === 4 && dataXhttp.status === 200) {
        callback(dataXhttp.responseText);
        seenItemObj = dataArray.item;
        recommItemsListObj = dataArray.recommendation;
        console.log(dataArray);
        console.log(seenItemObj);
        return console.log(recommItemsListObj);
      }
    };
    dataXhttp.open('GET', "products.json", true);
    return dataXhttp.send();
  };

  init = function() {
    return loadJSON(function(response) {
      return dataArray = JSON.parse(response)[0].data;
    });
  };

  init();

}).call(this);
