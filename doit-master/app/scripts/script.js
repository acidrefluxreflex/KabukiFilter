window.onload = function () {
	images = document.querySelectorAll('img')
	images.forEach(function(element) {
		element.src = chrome.extension.getURL('images/targetImage.png')
		element.removeAttribute('srcset')
	})
}