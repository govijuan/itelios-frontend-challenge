(function() {
  var dataArray, dataXhttp, init, loadJSON, printRecommList;

  dataXhttp = null;

  dataArray = new Object;


  /* Função que Carrega o JSON */

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
        return printRecommList(recommItemsListObj);
      }
    };
    dataXhttp.open('GET', "products.json", false);
    return dataXhttp.send();
  };


  /* Função que Inicia procesos do javascript */

  init = function() {
    return loadJSON(function(response) {
      return dataArray = JSON.parse(response)[0].data;
    });
  };


  /* Imprime os Items recomendados na div correspondente */

  printRecommList = function(objListArray) {
    var i, len, ouAteStr, paymentConditionsStr, paymentConditionsStrArr, recomItem, recomItemOutput, recomendedItemList, semJurosStr;
    recomendedItemList = '';
    for (i = 0, len = objListArray.length; i < len; i++) {
      recomItem = objListArray[i];
      paymentConditionsStr = recomItem.productInfo.paymentConditions;
      ouAteStr = paymentConditionsStr.slice(0, 6);
      semJurosStr = paymentConditionsStr.slice(-10);
      paymentConditionsStrArr = paymentConditionsStr.split(' ');
      recomItemOutput = '<li class="recom-item-wrap js_slide"> <div class"item-img-div" businessId="' + recomItem.businessId + '"><img src="' + recomItem.imageName + '" ></div> <div class="item-description">' + recomItem.name + '</div> <div class="">Por <span class="item-price">' + recomItem.price + '</span></div> <div class="pay-conditions">' + ouAteStr + ' <span class="pay-cond-fees">' + paymentConditionsStrArr[2] + ' ' + paymentConditionsStrArr[3] + ' ' + paymentConditionsStrArr[4] + ' ' + paymentConditionsStrArr[5] + '</span>' + semJurosStr + '</div> <button class="ad-to-cart-btn">adicionar ao carrinho <img src="images/ic_add_shopping_cart_black_24px.svg" class="cart-icon-img"></button> </li>';
      recomendedItemList += recomItemOutput;
    }
    return document.querySelector(".recom-item-list").innerHTML = recomendedItemList;
  };


  /* Iniciando processos de JavaScript */

  init();

}).call(this);
