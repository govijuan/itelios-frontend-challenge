dataXhttp = null
dataArray = new Object
### Função que Carrega o JSON ###
loadJSON = (callback)->
	if window.XMLHttpRequest
		dataXhttp = new XMLHttpRequest()
	else
	  dataXhttp = ActiveXObject("Micosoft.XMLHTTP"); ##Para Navegadores não-modernos da Microsoft

	dataXhttp.onreadystatechange = ()->
		if dataXhttp.readyState == 4 and dataXhttp.status == 200
			callback(dataXhttp.responseText)
			seenItemObj = dataArray.item
			recommItemsListObj = dataArray.recommendation
			console.log dataArray
			printRecommList(recommItemsListObj)
	dataXhttp.open('GET', "products.json", true)
	dataXhttp.send()
### Função que Inicia procesos do javascript ###
init = ()->
	loadJSON( (response)->
		dataArray = JSON.parse(response)[0].data
	)
### Imprime os Items recomendados na div correspondente ###
printRecommList = (objListArray)->
	recomendedItemList = ''
	for recomItem in objListArray
		paymentConditionsStr = recomItem.productInfo.paymentConditions
		ouAteStr = paymentConditionsStr.slice(0, 6)
		semJurosStr = paymentConditionsStr.slice(-10)
		paymentConditionsStrArr = paymentConditionsStr.split(' ')
		recomItemOutput =  '<li class="recom-item-wrap js_slide">
													<div class"item-img-div" businessId="' + recomItem.businessId + '"><img src="' + recomItem.imageName + '" ></div>
													<div class="item-description">' + recomItem.name + '</div>
													<div class="">Por <span class="item-price">' + recomItem.price + '</span></div>
													<div class="pay-conditions">' + ouAteStr + ' <span class="pay-cond-fees">' + paymentConditionsStrArr[2] + ' ' + paymentConditionsStrArr[3] + ' ' + paymentConditionsStrArr[4] + ' ' + paymentConditionsStrArr[5] + '</span>' + semJurosStr + '</div>
													<button class="ad-to-cart-btn">adicionar ao carrinho <img src="images/ic_add_shopping_cart_black_24px.svg" class="cart-icon-img"></button>						
												</li>'
		recomendedItemList += recomItemOutput
	document.querySelector(".recom-item-list").innerHTML = recomendedItemList
### Iniciando processos de JavaScript ###
init()


