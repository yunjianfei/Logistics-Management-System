function toggleColorSearch(objElement) {
  if (objElement.className=='search-normal')
    objElement.className='search-focus';
  else
    objElement.className='search-normal';
}

var g_defaultSearchText = "";
function load()
{
	g_defaultSearchText = document.forms[0].orderNO.value;	
}

function focusSearch()
{
	var f = document.forms[0];	
	if (f.orderNO.value == g_defaultSearchText)
		f.orderNO.value = "";
}

function blurSearch()
{
	var f = document.forms[0];	
	if (f.orderNO.value == "")
		f.orderNO.value = g_defaultSearchText;
}