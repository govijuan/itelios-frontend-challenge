dataXhttp = null
dataArray = new Object
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
			console.log(dataArray)
			console.log(seenItemObj)
			console.log(recommItemsListObj)
	dataXhttp.open('GET', "products.json", true)
	dataXhttp.send()
init = ()->
	loadJSON( (response)->
		dataArray = JSON.parse(response)[0].data
	)
init()
##console.log('Hurray')

