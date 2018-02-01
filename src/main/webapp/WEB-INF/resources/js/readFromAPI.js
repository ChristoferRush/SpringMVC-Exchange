var xhr = new XMLHttpRequest;
xhr.open("GET", "http://webtask.future-processing.com:8068/currencies?format=xml", false);

xhr.setRequestHeader("Accept", "application/xml");
xhr.send();

xmlDocument = xhr.responseXML;
console.log(xmlDocument.childNodes['0'].textContent);