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
			printSeenItem(seenItemObj)
	dataXhttp.open('GET', "products.json", false)
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
		recomItemOutput =  '<div class="shelf-item-wrap">
													<div class="item-img-div" businessId="' + recomItem.businessId + '"><img src="' + recomItem.imageName + '" ></div>
													<div class="item-description">' + recomItem.name + '</div>
													<div class="item-price-wrap">Por <span class="item-price">' + recomItem.price + '</span></div>
													<div class="pay-conditions">' + ouAteStr + ' <span class="pay-cond-fees">' + paymentConditionsStrArr[2] + ' ' + paymentConditionsStrArr[3] + ' ' + paymentConditionsStrArr[4] + ' ' + paymentConditionsStrArr[5] + '</span>' + semJurosStr + '</div>
													<div class="add-cart-wrap">
														<button class="ad-to-cart-btn"><span class="hover-stripe"></span>adicionar ao carrinho <svg class="cart-icon-img" fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M0 0h24v24H0zm18.31 6l-2.76 5z" fill="none"/><path d="M11 9h2V6h3V4h-3V1h-2v3H8v2h3v3zm-4 9c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zm10 0c-1.1 0-1.99.9-1.99 2s.89 2 1.99 2 2-.9 2-2-.9-2-2-2zm-9.83-3.25l.03-.12.9-1.63h7.45c.75 0 1.41-.41 1.75-1.03l3.86-7.01L19.42 4h-.01l-1.1 2-2.76 5H8.53l-.13-.27L6.16 6l-.95-2-.94-2H1v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.13 0-.25-.11-.25-.25z"/></svg></button>
													</div>				
												</div>'
		recomendedItemList += recomItemOutput
	document.querySelector(".recom-item-list").innerHTML = recomendedItemList
### Imprime Item Visto ###
printSeenItem = (seenItemObj)->
	paymentConditionsStr = seenItemObj.productInfo.paymentConditions
	ouAteStr = paymentConditionsStr.slice(0, 6)
	semJurosStr = paymentConditionsStr.slice(-10)
	paymentConditionsStrArr = paymentConditionsStr.split(' ')
	seenItemObjOutput = '<div class="shelf-item-wrap">
												<div class="item-img-div" businessId="' + seenItemObj.businessId + '"><img src="' + seenItemObj.imageName + '" ></div>
												<div class="item-description">' + seenItemObj.name + '</div>
												<div class="item-price-wrap">Por <span class="item-price">' + seenItemObj.price + '</span></div>
												<div class="pay-conditions">' + ouAteStr + ' <span class="pay-cond-fees">' + paymentConditionsStrArr[2] + ' ' + paymentConditionsStrArr[3] + ' ' + paymentConditionsStrArr[4] + ' ' + paymentConditionsStrArr[5] + '</span>' + semJurosStr + '</div>
												<div class="add-cart-wrap">	
													<button class="ad-to-cart-btn"><span class="hover-stripe"></span>adicionar ao carrinho <svg class="cart-icon-img" fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M0 0h24v24H0zm18.31 6l-2.76 5z" fill="none"/><path d="M11 9h2V6h3V4h-3V1h-2v3H8v2h3v3zm-4 9c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zm10 0c-1.1 0-1.99.9-1.99 2s.89 2 1.99 2 2-.9 2-2-.9-2-2-2zm-9.83-3.25l.03-.12.9-1.63h7.45c.75 0 1.41-.41 1.75-1.03l3.86-7.01L19.42 4h-.01l-1.1 2-2.76 5H8.53l-.13-.27L6.16 6l-.95-2-.94-2H1v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.13 0-.25-.11-.25-.25z"/></svg></button>
												</div>					
											</div>'
	document.querySelector(".item-visto-div").innerHTML = seenItemObjOutput
sliderInit = ()->
	$('.recom-item-list').slick({slidesToShow: 3, slidesToScroll: 3, autoplay: true, dots: true, infinite: true, arrows: false, responsive: [{ breakpoint: 992, settings: { slidesToShow: 3, slidesToScroll: 3 }}, { breakpoint: 992, settings: { slidesToShow: 2, slidesToScroll: 2 }}, { breakpoint: 768, settings: { slidesToShow: 1, slidesToScroll: 1 }}] })
### Iniciando processos de JavaScript ###
init()
### Iniciando Slider ###
sliderInit()


