var countryStateInfo = {
	"USA": {
		"California": {
			"Los Angeles": ["90001", "90002", "90003", "90004"],
			"San Diego": ["92093", "92101"]
		},
		"Texas": {
			"Dallas": ["75201", "75202"],
			"Austin": ["73301", "73344"]
		}
	},
	"India": {
		"Assam": {
			"Dispur": ["781005"],
			"Guwahati" : ["781030", "781030"]
		},
		"Gujarat": {
			"Vadodara" : ["390011", "390020"],
			"Surat" : ["395006", "395002"]
		},
		"maharashtra":{
			"pune":["4444","4441"],
			"amravati":["444603","444605"]
		}
	}
}


window.onload = function () {
	
	//Get html elements
	var countySel = document.getElementById("country");
	var stateSel = document.getElementById("state");	
	var citySel = document.getElementById("city");
	
	
	//Load countries
	for (var country in countryStateInfo) {
		countySel.options[countySel.options.length] = new Option(country, country);
	}
	
	//County Changed
	countySel.onchange = function () {
		 
		 stateSel.length = 1; // remove all options bar first
		 citySel.length = 1; // remove all options bar first
		 
		 
		 if (this.selectedIndex < 1)
			 return; // done
		 
		 for (var state in countryStateInfo[this.value]) {
			 stateSel.options[stateSel.options.length] = new Option(state, state);
		 }
	}
	
	//State Changed
	stateSel.onchange = function () {		 
		 
		 citySel.length = 1; // remove all options bar first
		 
		 
		 if (this.selectedIndex < 1)
			 return; // done
		 
		 for (var city in countryStateInfo[countySel.value][this.value]) {
			 citySel.options[citySel.options.length] = new Option(city, city);
		 }
	}
	
	
		
}
